/**
 * 
 */
package org.zeus.common.validator;

/**
 * @author lizhizhong
 *
 */
public interface SmsCodeSender {
	
	/**
	 * @param mobile
	 * @param code
	 */
	void send(String mobile, String code);

}
