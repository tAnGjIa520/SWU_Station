package com.tangjia.dao;

import com.tangjia.pojo.Good;

import java.util.List;

public interface GoodDao {
    //增删查改
    /*private String saler;//卖家id{存的是校园卡卡号}
    private String id;
    private int price;
    private String goodname;//商品名字
    private String description;//商品描述
    private int status;//商品状态{o->还没有被交易,1->已经被交易}
    private String date;//：交易时间格式年月日时分秒例如20200912121536中间没有空格直接连着写
    private String client;//顾客是谁*/
    public int addGood(Good good);

    public int deleteGood(Good good);

    public Good QuerryById(int id);

    public List<Good> QuerryBySaler(String salername);

    public int setGood(Good good);
}
