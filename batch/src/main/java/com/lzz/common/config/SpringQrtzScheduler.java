package com.lzz.common.config;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;

import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

import com.lzz.quartz.AutoWiringSpringBeanJobFactory;
import com.lzz.quartz.ChiyodaTriggerListener;
import com.lzz.quartz.SampleJob2;



/**
 * @author lizhizhong
 */
@Configuration
public class SpringQrtzScheduler {

    Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
//    @Qualifier("dataSourceQuartz")
    private DataSource datasource;

    @PostConstruct
    public void init() {
        logger.info("Hello world from Spring...");
    }

    @Bean
    public SpringBeanJobFactory springBeanJobFactory() {
        AutoWiringSpringBeanJobFactory jobFactory = new AutoWiringSpringBeanJobFactory();
        logger.debug("Configuring Job factory");	

        jobFactory.setApplicationContext(applicationContext);
        return jobFactory;
    }

    @Bean
    public ChiyodaTriggerListener listener()
    {
        return new ChiyodaTriggerListener("ChiyodaTriggerListener");
    }
    @Bean
    public SchedulerFactoryBean scheduler(Trigger[] trigger, JobDetail[] jobDetail, ChiyodaTriggerListener listener) {

        SchedulerFactoryBean schedulerFactory = new SchedulerFactoryBean();
        schedulerFactory.setConfigLocation(new ClassPathResource("quartz.properties"));

        logger.debug("Setting the Scheduler up");
        schedulerFactory.setJobFactory(springBeanJobFactory());
        schedulerFactory.setJobDetails(jobDetail);
        schedulerFactory.setTriggers(trigger);
//        schedulerFactory.setGlobalTriggerListeners(listener);
        schedulerFactory.setDataSource(datasource);

        return schedulerFactory;
    }
    @Bean
    public JobDetailFactoryBean DemoJobDetail() {

        JobDetailFactoryBean jobDetailFactory = new JobDetailFactoryBean();
        jobDetailFactory.setJobClass(SampleJob2.class);
        jobDetailFactory.setName("SampleJob2");
        jobDetailFactory.setDescription("示例Demo");
        jobDetailFactory.setDurability(true);
        return jobDetailFactory;
    }
      @Bean
      public CronTriggerFactoryBean KarendaJobTrigger(JobDetail DemoJobDetail)
      {
         CronTriggerFactoryBean triggerFactoryBean = new CronTriggerFactoryBean();
         triggerFactoryBean.setJobDetail(DemoJobDetail);
         triggerFactoryBean.setName("Demo_Qrtz_syncTrigger");
         triggerFactoryBean.setCronExpression("0 0/1 8-20 * * ?");
         triggerFactoryBean.setMisfireInstruction(CronTrigger.MISFIRE_INSTRUCTION_FIRE_ONCE_NOW);

         return triggerFactoryBean;
      }
   
}
