package com.lzz.common.config;

/**
 * Created by aichaellee on 2018/11/29.
 */
public class DruidConfig {
//
//    /**
//     * druidServlet注册
//     */
//    @Bean
//    public ServletRegistrationBean druidServletRegistration() {
//        ServletRegistrationBean registration = new ServletRegistrationBean(new StatViewServlet());
//        registration.addUrlMappings("/druid/*");
//        return registration;
//    }
//    /**
//     * druid监控 配置URI拦截策略
//     */
//    @Bean
//    public FilterRegistrationBean druidStatFilter() {
//        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter());
//        //添加过滤规则.
//        filterRegistrationBean.addUrlPatterns("/*");
//        //添加不需要忽略的格式信息.
//        filterRegistrationBean.addInitParameter(
//            "exclusions", "/static/*,*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid,/druid/*");
//        //用于session监控页面的用户名显示 需要登录后主动将username注入到session里
//        filterRegistrationBean.addInitParameter("principalSessionName", "username");
//        return filterRegistrationBean;
//    }
//
//
//    /**
//     * druid数据库连接池监控
//     */
//    @Bean
//    public DruidStatInterceptor druidStatInterceptor() {
//        return new DruidStatInterceptor();
//    }
//
//    @Bean
//    public JdkRegexpMethodPointcut druidStatPointcut() {
//        JdkRegexpMethodPointcut druidStatPointcut = new JdkRegexpMethodPointcut();
//        String patterns = "com.stylefeng.guns.modular.*.service.*";
//        //可以set多个
//        druidStatPointcut.setPatterns(patterns);
//        return druidStatPointcut;
//    }
//
//    /**
//     * druid数据库连接池监控
//     */
//    @Bean
//    public BeanTypeAutoProxyCreator beanTypeAutoProxyCreator() {
//        BeanTypeAutoProxyCreator beanTypeAutoProxyCreator = new BeanTypeAutoProxyCreator();
//        beanTypeAutoProxyCreator.setTargetBeanType(DruidDataSource.class);
//        beanTypeAutoProxyCreator.setInterceptorNames("druidStatInterceptor");
//        return beanTypeAutoProxyCreator;
//    }
//
//    /**
//     * druid 为druidStatPointcut添加拦截
//     *
//     * @return
//     */
//    @Bean
//    public Advisor druidStatAdvisor() {
//        return new DefaultPointcutAdvisor(druidStatPointcut(), druidStatInterceptor());
//    }
}
