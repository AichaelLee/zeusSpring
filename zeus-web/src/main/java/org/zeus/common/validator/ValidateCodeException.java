/**
 * 
 */
package org.zeus.common.validator;

import org.springframework.security.core.AuthenticationException;

/**
 * 验证码验证异常
 * @author lizhizhong
 *
 */
public class ValidateCodeException extends AuthenticationException {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7285211528095468156L;

	public ValidateCodeException(String msg) {
		super(msg);
	}

}
