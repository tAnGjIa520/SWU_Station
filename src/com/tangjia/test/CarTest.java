package com.tangjia.test;

import com.tangjia.pojo.Car;
import com.tangjia.pojo.CarItem;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class CarTest {
    Car car=new Car();
    @Test
    public void addItem() {
        CarItem carItem = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem1 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem2= new CarItem(133, "1111", 1, new BigDecimal(1020),new BigDecimal(1020));
        CarItem carItem3 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        car.addItem(carItem);
        car.addItem(carItem1);
        car.addItem(carItem2);
        car.addItem(carItem3);
        Integer totalCount = car.getTotalCount();
        BigDecimal totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
    }

    @Test
    public void deleteItem() {
        CarItem carItem = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem1 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem2= new CarItem(133, "1111", 1, new BigDecimal(1020),new BigDecimal(1020));
        CarItem carItem3 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        car.addItem(carItem);
        car.addItem(carItem1);
        car.addItem(carItem2);
        car.addItem(carItem3);
        Integer totalCount = car.getTotalCount();
        BigDecimal totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
        car.deleteItem(13);
        System.out.println("==================");
        totalCount = car.getTotalCount();
        totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
    }

    @Test
    public void clearItems() {
        CarItem carItem = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem1 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem2= new CarItem(133, "1111", 1, new BigDecimal(1020),new BigDecimal(1020));
        CarItem carItem3 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        car.addItem(carItem);
        car.addItem(carItem1);
        car.addItem(carItem2);
        car.addItem(carItem3);
        Integer totalCount = car.getTotalCount();
        BigDecimal totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
        car.clearItems();
        System.out.println("==================");
        totalCount = car.getTotalCount();
        totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
    }

    @Test
    public void setItemCount() {
        CarItem carItem = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem1 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        CarItem carItem2= new CarItem(133, "1111", 1, new BigDecimal(1020),new BigDecimal(1020));
        CarItem carItem3 = new CarItem(13, "1111", 1, new BigDecimal(100),new BigDecimal(100));
        car.addItem(carItem);
        car.addItem(carItem1);
        car.addItem(carItem2);
        car.addItem(carItem3);
        Integer totalCount = car.getTotalCount();
        BigDecimal totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
        car.setItemCount(13,10);
        System.out.println("==================");
        totalCount = car.getTotalCount();
        totalPrice = car.getTotalPrice();
        System.out.println(totalPrice);
        System.out.println(totalCount);
    }
}