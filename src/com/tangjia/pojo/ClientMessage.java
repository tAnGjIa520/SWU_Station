package com.tangjia.pojo;

public class ClientMessage {
    private String toName;
    private String message;

    public ClientMessage(String toName, String message) {
        this.toName = toName;
        this.message = message;
    }

    public ClientMessage() {
    }

    public String getToName() {
        return toName;
    }

    public void setToName(String toName) {
        this.toName = toName;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "ClientMessage{" +
                "toName='" + toName + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
