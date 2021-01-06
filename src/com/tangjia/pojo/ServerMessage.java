package com.tangjia.pojo;

public class ServerMessage {
    private boolean isSystem;
    private String fromName;
    private Object message;

    public ServerMessage(boolean isSystem, String fromName, Object message) {
        this.isSystem = isSystem;
        this.fromName = fromName;
        this.message = message;
    }

    public ServerMessage() {
    }

    @Override
    public String toString() {
        return "ServerMessage{" +
                "isSystem=" + isSystem +
                ", fromName='" + fromName + '\'' +
                ", message=" + message +
                '}';
    }

    public boolean isSystem() {
        return isSystem;
    }

    public void setSystem(boolean system) {
        isSystem = system;
    }

    public String getFromName() {
        return fromName;
    }

    public void setFromName(String fromName) {
        this.fromName = fromName;
    }

    public Object getMessage() {
        return message;
    }

    public void setMessage(Object message) {
        this.message = message;
    }
}
