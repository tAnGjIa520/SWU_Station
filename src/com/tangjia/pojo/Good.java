package com.tangjia.pojo;

import java.math.BigDecimal;
import java.util.Objects;

/**
 *商品
 */

public class Good {
    /*  id,goodname,saler,description,STATUS,DATE,CLIENT,price,photo*/
    private Integer id;//-----------------------------默认
    private String goodname;//商品名字===========================
    private Integer saler;//卖家username===============================


    private String description;//商品描述
    private Integer status=0;//商品状态{o->还没有被交易,1->已经被交易}//-----------------------------默认
    private String date;//：交易时间格式年月日时分秒例如20200912121536中间没有空格直接连着写
    private String client;//顾客是谁
    private BigDecimal price;//============================
    private String photo = "default/photo/default.jpg";////-----------------------------默认

    public Good() {
    }

    public Good(String goodname, Integer saler, BigDecimal price) {
        this.goodname = goodname;
        this.saler = saler;
        this.price = price;
    }

    public Good(Integer id, String goodname, Integer saler,  String description, Integer status, String date, String client,BigDecimal price, String photo) {
        /*  id,goodname,saler,description,STATUS,DATE,CLIENT,price,photo*/
        if (id != null) {
            this.id = id;
        }
        this.goodname = goodname;
        this.saler = saler;
        this.price = price;
        this.description = description;
        if (status ==null ) {
            this.status = 0;
        }else {this.status = status;}


        this.date = date;
        this.client = client;
        if (photo!=null){
            this.photo = photo;
        }

    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public Integer getSaler() {
        return saler;
    }

    public void setSaler(Integer saler) {
        this.saler = saler;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Good{" +
                "id=" + id +
                ", goodname='" + goodname + '\'' +
                ", saler=" + saler +
                ", description='" + description + '\'' +
                ", status=" + status +
                ", date='" + date + '\'' +
                ", client='" + client + '\'' +
                ", price=" + price +
                ", photo='" + photo + '\'' +
                '}';
    }
}
