package org.zeus.common;

import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.zeus.common.validator.SecurityProperties;

/**
 * @author: lizhizhong
 * CreatedDate: 2019/1/14.
 */
@Configuration
@EnableConfigurationProperties(SecurityProperties.class)
public class SecurityCoreConfig {

}

