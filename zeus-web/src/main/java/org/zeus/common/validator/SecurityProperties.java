/**
 * 
 */
package org.zeus.common.validator;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * 验证码属性的配置项
 * @author lizhizhong
 *
 */
@ConfigurationProperties(prefix = "imooc.security")
public class SecurityProperties {

	/**
	 * 验证码配置
	 */
	private ValidateCodeProperties code = new ValidateCodeProperties();

    public ValidateCodeProperties getCode() {
        return code;
    }

    public void setCode(ValidateCodeProperties code) {
        this.code = code;
    }
	
}

