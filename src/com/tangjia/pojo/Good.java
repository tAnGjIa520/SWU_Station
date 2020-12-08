package com.tangjia.pojo;

import java.util.Objects;

/**
 *商品
 */

public class Good {
    private int id;
    private String saler;//卖家username
    private int price;
    private String goodname;//商品名字
    private String description;//商品描述
    private int status;//商品状态{o->还没有被交易,1->已经被交易}
    private String date;//：交易时间格式年月日时分秒例如20200912121536中间没有空格直接连着写
    private String client;//顾客是谁

    public Good() {
    }

    /**
     * 用于记录商品的信息
     * @param saler 卖家的名字（一定知道）
     * @param price 价格（一定知道）
     * @param goodname  商品的名字（一定知道）
     */
    public Good(String saler, int price, String goodname) {
        this.saler = saler;
        this.price = price;
        this.goodname = goodname;
    }

    public String getSaler() {
        return saler;
    }

    public void setSaler(String saler) {
        this.saler = saler;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Good good = (Good) o;
        return id == good.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Good{" +
                "saler='" + saler + '\'' +
                ", id='" + id + '\'' +
                ", price=" + price +
                ", goodname='" + goodname + '\'' +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", date='" + date + '\'' +
                ", client='" + client + '\'' +
                '}';
    }
}
