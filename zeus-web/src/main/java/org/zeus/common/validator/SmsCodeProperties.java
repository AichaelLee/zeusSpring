/**
 * 
 */
package org.zeus.common.validator;

import lombok.Data;

/**
 * 短信验证码配置项
 * @author lizhizhong
 *
 */
@Data
public class SmsCodeProperties {
	
	/**
	 * 验证码长度
	 */
	private int length = 6;
	/**
	 * 过期时间
	 */
	private int expireIn = 60;
	/**
	 * 要拦截的url，多个url用逗号隔开，ant pattern
	 */
	private String url;

}
