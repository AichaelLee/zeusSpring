package com.lzz.common.annotation;


import com.lzz.common.constant.LogType;

import java.lang.annotation.*;

/**
 * 方法级别的系统日志
 * @author aichaellee
 * @date 2018-11-20
 */
@Target({ElementType.PARAMETER, ElementType.METHOD})//作用于参数或方法上
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {

        /**
         * 日志名称
         * @return
         */
        String description() default "";

        /**
         * 日志类型
         * @return
         */
        LogType type() default LogType.OPERATION;
}
