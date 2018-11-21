package com.lzz.common.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

import java.util.Locale;

/**
 * message util
 * @author aichaellee
 */
@Component
public class MessageUtil {

	/**
	 * message source
	 */
    @Autowired
    MessageSource msg;

	/**
	 * 根据指定key获得相关文本
	 *
	 * @param key key
	 * @param args parameter
	 * @return message
	 */
	public String getMessage(String key, Object... args) {
		return msg.getMessage(key, args, Locale.JAPAN);
	}

}
