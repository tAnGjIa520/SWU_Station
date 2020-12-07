package com.tangjia.pojo;

import java.util.Objects;

/**
 *商品
 */

public class Good {
    private String saler;//卖家id{存的是校园卡卡号}
    private String id;
    private String goodname;//商品名字
    private String description;//商品描述
    private int goodstatus;//商品状态{o->还没有被交易,1->已经被交易}
    private String date;//：交易时间格式年月日时分秒例如20200912121536中间没有空格直接连着写
    private String client;//顾客是谁

    public Good() {
    }

    @Override
    public String toString() {
        return "Good{" +
                "saler='" + saler + '\'' +
                ", id='" + id + '\'' +
                ", goodname='" + goodname + '\'' +
                ", description='" + description + '\'' +
                ", goodstatus=" + goodstatus +
                ", date='" + date + '\'' +
                ", client='" + client + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Good good = (Good) o;
        return id.equals(good.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public String getSaler() {
        return saler;
    }

    public void setSaler(String saler) {
        this.saler = saler;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getGoodstatus() {
        return goodstatus;
    }

    public void setGoodstatus(int goodstatus) {
        this.goodstatus = goodstatus;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }
}
