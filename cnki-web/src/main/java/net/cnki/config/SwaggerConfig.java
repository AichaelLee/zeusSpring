package net.cnki.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
/**
 * swagger
 * @author: lizhizhong
 * CreatedDate: 2018/12/21.
 */
@Configuration
@EnableSwagger2
public class SwaggerConfig implements WebMvcConfigurer {

}