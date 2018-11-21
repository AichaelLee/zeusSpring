package com.lzz.common.fw.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
/**
 * 日志记录，目前没有根据方法或者请求名映射为操作名称
 * 也没有往数据库中存储
 * */
@Aspect
@Component
public class LoggingAdvice {
    Logger logger = LoggerFactory.getLogger(getClass());

    @Around("execution(* com.lzz.controller..*.*(..))")
    public Object LogOperation(ProceedingJoinPoint pj) throws Throwable{
        Object ret = null;
        String opName = pj.getTarget().getClass().getSimpleName()+'.'+pj.getSignature().getName();
        StringBuilder profixSb = new StringBuilder();
        profixSb.append("[OPERATION_LOG_ID]");
        profixSb.append("=");
        profixSb.append(opName);
        logger.info("log advice start{}",profixSb.toString());

        ret = pj.proceed();

        return ret;

    }
}
