package net.cnki.common.fw;

import lombok.extern.slf4j.Slf4j;

import net.cnki.bean.TblTeacherBase;
import net.cnki.common.fw.annotation.SystemLog;
import net.cnki.common.util.IpInfoUtil;
import net.cnki.dmsMapper.SysLogMapper;
import net.cnki.entity.SysLog;
import net.cnki.entity.SysLogExample;
import net.cnki.service.SysLogService;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 日志管理
 * @author lizhizhong
 */
@Aspect
@Component
@Slf4j
public class SystemLogAspect {

    private static final ThreadLocal<Date> beginTimeThreadLocal = new NamedThreadLocal<Date>("ThreadLocal beginTime");


    @Autowired(required = false)
    private HttpServletRequest request;

    @Autowired
    private IpInfoUtil ipInfoUtil;

    @Autowired
    SysLogService sysLogService;

    @Autowired
    SysLogMapper sysLogMapper;

    /**
     * Controller层切点,注解方式
     */
    @Pointcut("@annotation(net.cnki.common.fw.annotation.SystemLog)")
    public void controllerAspect() {

    }

    /**
     * 前置通知 (在方法执行之前返回)用于拦截Controller层记录用户的操作的开始时间
     * @param joinPoint 切点
     * @throws InterruptedException
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint) throws InterruptedException{

        //线程绑定变量（该数据只有当前请求的线程可见）
        Date beginTime=new Date();
        beginTimeThreadLocal.set(beginTime);
    }


    /**
     * 后置通知(在方法执行之后返回) 用于拦截Controller层操作
     * @param joinPoint 切点
     */
    @After("controllerAspect()")
    public void after(JoinPoint joinPoint){
        try {
            TblTeacherBase user = (TblTeacherBase) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            String username= user.getUsername();

            if (StringUtils.isNotBlank(username)) {

                // 请求方法名 the requested name
                String operationName = joinPoint.getSignature().getName();

                //请求开始时间 start time
                Date startTime = beginTimeThreadLocal.get();

                long beginTime = beginTimeThreadLocal.get().getTime();
                long endTime = System.currentTimeMillis();

                Map methodInfo = getControllerMethodInfo(joinPoint);

                String description = (String)methodInfo.get("description");

                LogType logType = (LogType) methodInfo.get("type");


                //output log
                Long totalTime = endTime - beginTime;
                log.info("操作人姓名为:{},操作人角色为:{},操作类型为:{},操作内容{}",
                        user.getTeacherName(),user.getAuthorities().toString(),logType.getDesc(),description);
                log.info("{} 操作开始时间为: {} 共耗时 {} 微秒",operationName,startTime,totalTime);
                log.info("{} bigin at {},and consume total {} milliseconds",operationName,startTime,totalTime);
                // 数据库中插入操作记录
                SysLog sysLog = new SysLog();
                sysLog.setOperatorRole(user.getRoles()
                        .stream().map(
                                o->o.getNameZh()).
                                collect(Collectors.joining(",")));
                sysLog.setLogType(logType.getDesc());
                sysLog.setOperator(user.getTeacherName());
                sysLog.setLogContent(description);
                sysLog.setOperationTime(new Date());
                sysLog.setIpAddress(ipInfoUtil.getIpAddr(request));
                sysLogMapper.insert(sysLog);

            }
        } catch (Exception e) {
            log.error("AOP后置通知异常", e);
        }
    }
    /**
     * 保存日志至数据库
     */
    private static class SaveToDBThread implements Runnable {


        public SaveToDBThread() {
           log.info("save to DB");
        }

        @Override
        public void run() {

           log.info("save to db");
        }
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     * @param joinPoint 切点
     * @return 方法描述
     * @throws Exception
     */
    public static Map<String, Object> getControllerMethodInfo(JoinPoint joinPoint) throws Exception{

        Map<String, Object> map = new HashMap<String, Object>(16);
        //获取目标类名
        String targetName = joinPoint.getTarget().getClass().getName();
        //获取方法名
        String methodName = joinPoint.getSignature().getName();
        //获取相关参数
        Object[] arguments = joinPoint.getArgs();
        //生成类对象
        Class targetClass = Class.forName(targetName);
        //获取该类中的方法
        Method[] methods = targetClass.getMethods();

        String description = "";
        LogType type = null;

        for(Method method : methods) {
            if(!method.getName().equals(methodName)) {
                continue;
            }
            Class[] clazzs = method.getParameterTypes();
            if(clazzs.length != arguments.length) {
                //比较方法中参数个数与从切点中获取的参数个数是否相同，原因是方法可以重载
                continue;
            }
            description = method.getAnnotation(SystemLog.class).description();
            type = method.getAnnotation(SystemLog.class).type();
            map.put("description", description);
            map.put("type", type);
        }
        return map;
    }

}
