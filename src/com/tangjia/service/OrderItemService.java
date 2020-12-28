package com.tangjia.service;

import com.tangjia.pojo.Car;
import com.tangjia.pojo.CarItem;
import com.tangjia.pojo.OrderItem;

import java.util.List;

public interface OrderItemService {
    /**
     * 传入购物车，买家id，创建一个订单
     * @param car
     * @param userId
     * @return
     */
    public int createOrderItem(Car car, Integer userId);

    /**
     * 传入一个卖家id，列出他的所有商品信息（买）
     * @param userId
     * @return
     */
    public List<OrderItem> showOrderItemForSaler(Integer userId);

    /**
     * 传入一个卖家id，传出他的所有商品信息（卖）
     * @param userId
     * @return
     */
    public List<OrderItem> showOrderItemForUser(Integer userId);

    /**
     * 卖家把商品状态设为发出
     * @param orderId
     * @return
     */
    public int sendOrderItem(String orderId);

    /**
     * 买家把商品状态设为已经收到！！
     * @param orderId
     * @return
     */
    public int reseiveOrderItem(String orderId);

    public int markOrderItem(String orderId);


}
