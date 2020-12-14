package com.tangjia.pojo;

import java.math.BigDecimal;

public class CarItem {
    private Integer id;
    private String itemName;
    private Integer totalItemCount;
    private BigDecimal itemPrice;
    private BigDecimal totalItemPrice;

    public CarItem(Integer id, String itemName, Integer totalItemCount, BigDecimal itemPrice, BigDecimal totalItemPrice) {
        this.id = id;
        this.itemName = itemName;
        this.totalItemCount = totalItemCount;
        this.itemPrice = itemPrice;
        this.totalItemPrice = totalItemPrice;
    }

    public CarItem() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public Integer getTotalItemCount() {
        return totalItemCount;
    }

    public void setTotalItemCount(Integer totalItemCount) {
        this.totalItemCount = totalItemCount;
    }

    public BigDecimal getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(BigDecimal itemPrice) {
        this.itemPrice = itemPrice;
    }

    public BigDecimal getTotalItemPrice() {
        return totalItemPrice;
    }

    public void setTotalItemPrice(BigDecimal totalItemPrice) {
        this.totalItemPrice = totalItemPrice;
    }

    @Override
    public String toString() {
        return "CarItem{" +
                "id=" + id +
                ", itemName='" + itemName + '\'' +
                ", totalItemCount=" + totalItemCount +
                ", itemPrice=" + itemPrice +
                ", totalItemPrice=" + totalItemPrice +
                '}';
    }
}
