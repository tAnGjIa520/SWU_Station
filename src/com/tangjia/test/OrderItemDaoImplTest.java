package com.tangjia.test;

import com.tangjia.dao.OrderItemDao;
import com.tangjia.dao.impl.OrderItemDaoImpl;
import com.tangjia.pojo.OrderItem;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class OrderItemDaoImplTest {
    OrderItemDao orderItemDao=new OrderItemDaoImpl();
    OrderItem orderItem = new OrderItem("123", 1, 3, "唐嘉", new BigDecimal(123), 2, new BigDecimal(123), new Date(), 0);

    @Test
    public void addOrderItem() {
        OrderItem orderItem = new OrderItem("123", 1, 3, "唐嘉", new BigDecimal(123), 2, new BigDecimal(123), new Date(), 0);
        orderItemDao.addOrderItem(orderItem);
        /*
public OrderItem(String orderId, Integer userId, Integer salerId, String goodName, BigDecimal price, Integer totalCount, BigDecimal totalPrice, Date createTime, Integer status) {
*/

        }

    @Test
    public void queryOrderItemForSaler() {
        List<OrderItem> orderItems = orderItemDao.queryOrderItemForSaler(3);
        for (OrderItem orderItem:orderItems){
            System.out.println(orderItem);
        }
    }

    @Test
    public void queryOrderItemForUser() {
        List<OrderItem> orderItems = orderItemDao.queryOrderItemForUser(1);
        for (OrderItem orderItem:orderItems){
            System.out.println(orderItem);
        }
    }

    @Test
    public void changeOrderStatus() {
        int i = orderItemDao.changeOrderStatus("1", 1);
        System.out.println(i);
    }
}