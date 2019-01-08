package net.cnki.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import com.alibaba.druid.support.spring.stat.BeanTypeAutoProxyCreator;
import com.alibaba.druid.support.spring.stat.DruidStatInterceptor;
import org.springframework.aop.Advisor;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.aop.support.JdkRegexpMethodPointcut;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.sql.DataSource;

/**
 * Druid可视化监控配置
 * @author: lizhizhong
 * CreatedDate: 2019/1/3.
 */
@Configuration
public class DruidConfig {


    /**
     *  以下所有配置信息，均从application.porperties中读取。Value对应的变量值，即为配置文件中的key
     */
    
    // 数据库连接URL
    @Value("${spring.datasource.url}")
    private String dbUrl;

    // 数据库用户名
    @Value("${spring.datasource.username}")
    private String username;

    // 数据库密码
    @Value("${spring.datasource.password}")
    private String password;

    // 数据库驱动（java类包）
    @Value("${spring.datasource.driver-class-name}")
    private String driverClassName;

    // 连接池初始化大小 
    @Value("${spring.datasource.initialSize}")
    private int initialSize;

    // 连接池最小值
    @Value("${spring.datasource.minIdle}")
    private int minIdle;

    // 连接池最大 值
    @Value("${spring.datasource.maxActive}")
    private int maxActive;

    // 配置获取连接等待超时的时间 
    @Value("${spring.datasource.maxWait}")
    private int maxWait;

    // 配置间隔多久才进行一次检测，检测需要关闭的空闲连接，单位是毫秒
    @Value("${spring.datasource.timeBetweenEvictionRunsMillis}")
    private int timeBetweenEvictionRunsMillis;

    // 配置一个连接在池中最小生存的时间，单位是毫秒
    @Value("${spring.datasource.minEvictableIdleTimeMillis}")
    private int minEvictableIdleTimeMillis;

    // 用来验证数据库连接的查询语句,这个查询语句必须是至少返回一条数据的SELECT语句
    @Value("${spring.datasource.validationQuery}")
    private String validationQuery;

    // 检测连接是否有效
    @Value("${spring.datasource.testWhileIdle}")
    private boolean testWhileIdle;

    // 申请连接时执行validationQuery检测连接是否有效。做了这个配置会降低性能。
    @Value("${spring.datasource.testOnBorrow}")
    private boolean testOnBorrow;

    // 归还连接时执行validationQuery检测连接是否有效，做了这个配置会降低性能
    @Value("${spring.datasource.testOnReturn}")
    private boolean testOnReturn;

    // 是否缓存preparedStatement，也就是PSCache。
    @Value("${spring.datasource.poolPreparedStatements}")
    private boolean poolPreparedStatements;
    
    // 指定每个连接上PSCache的大小。
    @Value("${spring.datasource.maxPoolPreparedStatementPerConnectionSize}")
    private int maxPoolPreparedStatementPerConnectionSize;
    
    // 配置监控统计拦截的filters，去掉后监控界面sql无法统计，'wall'用于防火墙  
    @Value("${spring.datasource.filters}")
    private String filters;
    
    // 通过connectProperties属性来打开mergeSql功能；慢SQL记录    
    @Value("${spring.datasource.connectionProperties}")
    private String connectionProperties;

    
    ////////////////////////////////////////////////////////
    // Druid控制台配置：记录慢SQL 
    @Value("${spring.datasource.logSlowSql}")
    private String logSlowSql;
    
    @Bean
    public DynamicDataSource dynamicDataSource() {
        DynamicDataSource dynamicDataSource = DynamicDataSource.getInstance();

        DruidDataSource defaultDataSource = new DruidDataSource();
        defaultDataSource.setUrl(dbUrl);
        defaultDataSource.setUsername(username);
        defaultDataSource.setPassword(password);
        defaultDataSource.setDriverClassName(driverClassName);
        defaultDataSource.setInitialSize(initialSize);
        defaultDataSource.setMinIdle(minIdle);
        defaultDataSource.setMaxActive(maxActive);
        defaultDataSource.setMaxWait(maxWait);
        defaultDataSource.setTimeBetweenEvictionRunsMillis(timeBetweenEvictionRunsMillis);
        defaultDataSource.setMinEvictableIdleTimeMillis(minEvictableIdleTimeMillis);
        defaultDataSource.setValidationQuery(validationQuery);
        defaultDataSource.setTestWhileIdle(testWhileIdle);
        defaultDataSource.setTestOnBorrow(testOnBorrow);
        defaultDataSource.setTestOnReturn(testOnReturn);
        defaultDataSource.setPoolPreparedStatements(poolPreparedStatements);
        defaultDataSource.setMaxPoolPreparedStatementPerConnectionSize(maxPoolPreparedStatementPerConnectionSize);
        try {
        	defaultDataSource.setFilters(filters);
        } catch (SQLException e) {
        	e.printStackTrace();
        }
        defaultDataSource.setConnectionProperties(connectionProperties);
        

        Map<Object,Object> map = new HashMap<>();
        map.put("default", defaultDataSource);
        dynamicDataSource.setTargetDataSources(map);
        dynamicDataSource.setDefaultTargetDataSource(defaultDataSource);

        return dynamicDataSource;
    }
	
	
    /**
     * sql执行的监控，配置filter和stat之后，sql监控也没有起作用，
     * 经过最后的排查尝试重新又配置了一下druid datasource
     * @return
     */
  /*  @Bean
    @ConfigurationProperties(prefix="spring.datasource")
    public DataSource druidDataSource() {
        return new DruidDataSource();
    }*/


    /**
     * druidServlet注册
     */
    @Bean
    public ServletRegistrationBean druidServletRegistration() {
        ServletRegistrationBean registration = new ServletRegistrationBean(new StatViewServlet());
        //登录查看信息的账号密码.
        registration.addInitParameter("loginUsername","admin");
        registration.addInitParameter("loginPassword","123");
        //是否能够重置数据.
        registration.addInitParameter("resetEnable","false");
        registration.addUrlMappings("/druid/*");
        return registration;
    }
    /**
     * druid监控 配置URI拦截策略
     */
    @Bean
    public FilterRegistrationBean druidStatFilter() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
        //添加过滤规则.
        filterRegistrationBean.addUrlPatterns("/*");
        //添加不需要忽略的格式信息.
        filterRegistrationBean.addInitParameter(
                "exclusions", "/static/*,*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid,/druid/*");
        //用于session监控页面的用户名显示 需要登录后主动将username注入到session里
        filterRegistrationBean.addInitParameter("principalSessionName", "username");
        return filterRegistrationBean;
    }


    /**
     * druid数据库连接池监控
     */
    @Bean
    public DruidStatInterceptor druidStatInterceptor() {
        return new DruidStatInterceptor();
    }

    @Bean
    public JdkRegexpMethodPointcut druidStatPointcut() {
        JdkRegexpMethodPointcut druidStatPointcut = new JdkRegexpMethodPointcut();
        String patterns = "com.stylefeng.guns.modular.*.service.*";
        //可以set多个
        druidStatPointcut.setPatterns(patterns);
        return druidStatPointcut;
    }

    /**
     * druid数据库连接池监控
     */
    @Bean
    public BeanTypeAutoProxyCreator beanTypeAutoProxyCreator() {
        BeanTypeAutoProxyCreator beanTypeAutoProxyCreator = new BeanTypeAutoProxyCreator();
        beanTypeAutoProxyCreator.setTargetBeanType(DruidDataSource.class);
        beanTypeAutoProxyCreator.setInterceptorNames("druidStatInterceptor");
        return beanTypeAutoProxyCreator;
    }

    /**
     * druid 为druidStatPointcut添加拦截
     *
     * @return
     */
    @Bean
    public Advisor druidStatAdvisor() {
        return new DefaultPointcutAdvisor(druidStatPointcut(), druidStatInterceptor());
    }
}
