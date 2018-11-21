package com.lzz.common.util;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Component;

/**
 * メッセージユーティリティ
 */
@Component
public class MessageUtil {

	/*
	 * メッセージソース
	 */
    @Autowired
    MessageSource msg;

	/**
	 * 指定キーのメッセージを取得する
	 *
	 * @param key メッセージキー
	 * @param args メッセージ用パラメータ
	 * @return メッセージ
	 */
	public String getMessage(String key, Object... args) {
		return msg.getMessage(key, args, Locale.JAPAN);
	}

}
