/**
 * 
 */
package org.zeus.common.validator;

import lombok.Data;

/**
 * 图片验证码配置项
 * 
 * @author lizhizhong
 *
 */
@Data
public class ImageCodeProperties extends SmsCodeProperties {
	
	public ImageCodeProperties() {
		setLength(4);
	}
	
	/**
	 * 图片宽
	 */
	private int width = 67;
	/**
	 * 图片高
	 */
	private int height = 23;

}
