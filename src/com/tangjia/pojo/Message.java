package com.tangjia.pojo;

import java.util.Date;

public class Message {
    public  final static  Integer ONE_STAR=1;
    public  final static  Integer TWE_STAR=2;
    public  final static  Integer THREE_STAR=3;
    public  final static  Integer FOUR_STAR=4;
    public  final static  Integer FIVE_STAR=5;

    private Integer id;
    private Integer salerId;
    private String orderId;
    private Date date;
    private Integer level;
    private Integer clientId;
    private String mark;

    public Message() {
    }

    @Override
    public String toString() {
        return "Message{" +
                "id=" + id +
                ", salerId=" + salerId +
                ", orderId='" + orderId + '\'' +
                ", date=" + date +
                ", level=" + level +
                ", clientId=" + clientId +
                ", mark='" + mark + '\'' +
                '}';
    }

    public Message(Integer id, Integer salerId, String orderId, Date date, Integer level, Integer clientId, String mark) {
        this.id = id;
        this.salerId = salerId;
        this.orderId = orderId;
        this.date = date;
        this.level = level;
        this.clientId = clientId;
        this.mark = mark;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getSalerId() {
        return salerId;
    }

    public void setSalerId(Integer salerId) {
        this.salerId = salerId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
