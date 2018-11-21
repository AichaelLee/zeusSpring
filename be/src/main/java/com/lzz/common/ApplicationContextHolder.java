package com.lzz.common;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * Created by aichaellee on 2018/9/30.
 */

@Component
public class ApplicationContextHolder implements ApplicationContextAware {

    // 上下文对象实例
    private static ApplicationContext applicationContext;
    Thread a = new Thread(){

    };

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException
    {
        ApplicationContextHolder.applicationContext = applicationContext;
    }

    public ApplicationContext getApplicationContext(){
        return applicationContext;    }

    public static <T> T getBean(Class<T> clazz){
        return applicationContext.getBean(clazz);
    }

    @SuppressWarnings("unchecked")
    public static <T> T getBean(String name){
        return (T)applicationContext.getBean(name);
    }

   // public static <T> T getBean(String name, Class<T> clazz){
       // return getApplicationContext().getBean(name, clazz);
    //}



}
