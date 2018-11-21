package com.lzz.common;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * Created by aichaellee on 2018/9/30.
 */@Slf4j
public class Test {

    public static void  main(String[] args) throws Exception{
        String resource = "classpath:application.properties";
        InputStream is = Resources.getResourceAsStream(resource);
        SqlSessionFactoryBuilder sqlBuilder = new SqlSessionFactoryBuilder();
        SqlSessionFactory sf = sqlBuilder.build(is);
        SqlSession sqlSession = sf.openSession();
        sqlSession.selectOne("select * from users");

        }
}
