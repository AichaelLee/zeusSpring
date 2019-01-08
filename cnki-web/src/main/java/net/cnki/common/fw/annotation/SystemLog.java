package net.cnki.common.fw.annotation;


import net.cnki.common.fw.LogType;

import java.lang.annotation.*;

/**
 * 方法级别的系统日志
 * @author lizhizhong
 * @date 2018-12-04
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
