/**
 * 
 */
package org.zeus.common.validator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 默认的短信验证码发送器
 * 
 * @author zhailiang
 *
 */
@Component("smsCodeSender")
public class DefaultSmsCodeSender implements SmsCodeSender {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 发送手机验证码的默认实现，后续决定使用哪一个短信平台之后重新实现该接口就可以了
     * @param mobile
     * @param code
     */
	@Override
	public void send(String mobile, String code) {
		logger.warn("todo:请配置真实的短信验证码发送器(SmsCodeSender)");
		logger.info("向手机 {} 发送短信验证码 {} 成功",mobile,code);
	}

}
