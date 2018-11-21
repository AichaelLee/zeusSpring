package com.lzz.entity;

import lombok.Data;

@Data
public class ErrorInfo<T> {
	 public static final Integer OK = 0;
	    public static final Integer ERROR = 100;

	    private Integer code;
	    private String message;
	    private String url;
	    private T data;
}
