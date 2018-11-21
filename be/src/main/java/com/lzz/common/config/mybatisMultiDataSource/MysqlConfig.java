package com.lzz.common.config.mybatisMultiDataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

/**
 * Created by aichaellee on 2018/10/5.
 */

@SpringBootConfiguration

@MapperScan(basePackages = "com.lzz.mysqlmapper", sqlSessionFactoryRef = "mysqlSqlsessionFactory")
public class MysqlConfig {

    @Bean
    public SqlSessionFactory mysqlSqlsessionFactory(@Qualifier("secondaryDataSource")DataSource mysqlDataSource) throws Exception {

        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        //bean.setConfigLocation(new ClassPathResource("classpath:mybatis/mybatis-config.xml"));
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mysqlmapper/*.xml"));

        bean.setDataSource(mysqlDataSource);

        return bean.getObject();

    }
}
