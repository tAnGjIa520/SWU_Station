package com.tangjia.test;

import com.tangjia.pojo.Car;
import com.tangjia.pojo.CarItem;
import com.tangjia.pojo.OrderItem;
import com.tangjia.service.OrderItemService;
import com.tangjia.service.impl.OrderItemServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;

import static org.junit.Assert.*;

public class OrderItemServiceImplTest {
    OrderItemService orderItemService=new OrderItemServiceImpl();

    @Test
    public void createOrderItem() {
        Car car = new Car();
        car.addItem(new CarItem(12,"苹果",2,new BigDecimal(2),new BigDecimal(3)));
        car.addItem(new CarItem(21,"苹果",66,new BigDecimal(55),new BigDecimal(444)));
        orderItemService.createOrderItem(car,2);
        /* Integer id, String itemName, Integer totalItemCount, BigDecimal itemPrice, BigDecimal totalItemPrice) {
         */
    }

    @Test
    public void showOrderItemForSaler() {
        for (OrderItem orderItem:orderItemService.showOrderItemForSaler(4)){
            System.out.println(orderItem);
        }
    }

    @Test
    public void showOrderItemForUser() {
        for (OrderItem orderItem:orderItemService.showOrderItemForUser(2)){
            System.out.println(orderItem);
        }
    }

    @Test
    public void sendOrderItem() {
        for (OrderItem orderItem:orderItemService.showOrderItemForSaler(4)){
            System.out.println(orderItem);
            orderItemService.sendOrderItem(orderItem.getOrderId());
        }
    }

    @Test
    public void reseiveOrderItem() {
        for (OrderItem orderItem:orderItemService.showOrderItemForSaler(4)){
            System.out.println(orderItem);
            orderItemService.reseiveOrderItem(orderItem.getOrderId());
        }
    }
}