package com.lzz.common.exception;
/**
 * @author aichaellee
 * */
public class SendMailException extends RuntimeException {

    public SendMailException() {
        super();
    }

    public SendMailException(String message) {
        super(message);
    }

    public SendMailException(Throwable e) {
        super(e);
    }

    public SendMailException(String message, Throwable e) {
        super(message, e);
    }
}
