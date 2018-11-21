package com.lzz.common.exception;

public class S3FileException extends RuntimeException {
    private String messageId;

    public S3FileException(String messageId) {
        super();
        this.messageId = messageId;
    }

    public S3FileException(Throwable e) {
        super(e);
    }

    public S3FileException(String messageId, Throwable e) {
        super(e);
        this.messageId = messageId;
    }

    public String getMessageId() {
        return this.messageId;
    };

}
