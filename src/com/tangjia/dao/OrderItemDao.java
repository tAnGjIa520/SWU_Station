package com.tangjia.dao;

import com.tangjia.pojo.OrderItem;

import java.util.List;

public interface OrderItemDao {
    /**
     * 保存一个订单
     * @return
     */
    public int addOrderItem(OrderItem orderItem);

    /**
     * 为一个saler查找有没有自己的订单
     * @param salerId
     * @return
     */
    public List<OrderItem> queryOrderItemForSaler(Integer salerId);

    /**
     * 为一个user查看他的order
     * @param userId
     * @return
     */
    public List<OrderItem> queryOrderItemForUser(Integer userId);

    /**
     * 改变某一个订单的状态；
     * @param orderItem
     * @param status
     * @return
     */
    public int changeOrderStatus(String orderItem,Integer status);

    /**
     * 查询商品的主人是谁！！！很重要！！p2p专属！╮(╯▽╰)╭
     * @param Id
     * @return
     */
    public Integer querySalerByGoodId(Integer Id);

    /**
     * 现在将根据orderid查找出orderItem
     * @param id
     * @return
     */
    public OrderItem queryOrderItemByOrderId(String id);

}
