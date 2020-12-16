package com.tangjia.pojo;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.Date;

public class OrderItem {
    public final  static Integer NOSEND=0;
    public final  static Integer SENDING=1;
    public final  static Integer FINISHED=2;
    public final  static Integer REMARK=3;



    private String orderId;
    private Integer userId;
    private Integer salerId;
    private String goodName;
    private BigDecimal price;
    private Integer totalCount;
    private BigDecimal totalPrice;
    private Date createTime;
    private Integer status=OrderItem.NOSEND;

    public OrderItem() {
    }

    public OrderItem(String orderId, Integer userId, Integer salerId, String goodName, BigDecimal price, Integer totalCount, BigDecimal totalPrice, Date createTime, Integer status) {
        this.orderId = orderId;//订单号
        this.userId = userId;//userId用户id
        this.salerId = salerId;//salerID
        this.goodName = goodName;//商品名字
        this.price = price;//价格
        this.totalCount = totalCount;//总的数量
        this.totalPrice = totalPrice;//总价格
        this.createTime = createTime;//订单创建的时间
        this.status = status;//订单的状态
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "orderId='" + orderId + '\'' +
                ", userId=" + userId +
                ", salerId=" + salerId +
                ", goodName='" + goodName + '\'' +
                ", price=" + price +
                ", totalCount=" + totalCount +
                ", totalPrice=" + totalPrice +
                ", createTime=" + createTime +
                ", status=" + status +
                '}';
    }



    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSalerId() {
        return salerId;
    }

    public void setSalerId(Integer salerId) {
        this.salerId = salerId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
