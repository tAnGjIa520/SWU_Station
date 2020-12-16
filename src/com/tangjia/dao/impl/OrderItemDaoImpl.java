package com.tangjia.dao.impl;

import com.tangjia.dao.OrderItemDao;
import com.tangjia.pojo.Good;
import com.tangjia.pojo.OrderItem;
import org.apache.commons.dbutils.QueryRunner;

import java.util.List;

public class OrderItemDaoImpl extends BaseDao implements OrderItemDao {


    /**
     * 保存一个订单
     *
     * @param orderItem
     * @return
     */
    @Override
    public int addOrderItem(OrderItem orderItem) {
        String sql="INSERT INTO orderitem (orderId,userId,salerId,goodName,price,totalCount,totalPrice,createTime,status) VALUES ( ?,?,?,?,?,?,?,?,?)";
        return update(sql,orderItem.getOrderId(),orderItem.getUserId(),orderItem.getSalerId(),orderItem.getGoodName(),orderItem.getPrice(),orderItem.getTotalCount(),orderItem.getPrice(),orderItem.getCreateTime(),orderItem.getStatus());

    }

    /**
     * 为一个saler查找有没有自己的订单
     *
     * @param salerId
     * @return
     */
    @Override
    public List<OrderItem> queryOrderItemForSaler(Integer salerId) {
        String sql="select * from orderitem where salerId=?;";
        return queryForList(OrderItem.class,sql,salerId);
    }

    /**
     * 为一个user查看他的order
     *
     * @param userId
     * @return
     */
    @Override
    public List<OrderItem> queryOrderItemForUser(Integer userId) {
        String sql="select * from orderitem where userId=?;";
        return queryForList(OrderItem.class,sql,userId);
    }

    /**
     * 改变某一个订单的状态；
     *
     * @param orderId
     * @param status
     * @return
     */
    @Override
    public int changeOrderStatus(String orderId, Integer status) {
        String sql="update orderitem set status=? where orderId= ?";
        return update(sql,status,orderId);
    }

    /**
     * 查询商品的主人是谁！！！很重要！！p2p专属！╮(╯▽╰)╭
     *
     * @param id
     * @return
     */
    @Override
    public Integer querySalerByGoodId(Integer id) {
        String sql="select * from Good where id=?;";
        Good good = queryForOne(Good.class, sql, id);
        return good.getSaler();
    }

    /**
     * 现在将根据orderid查找出orderItem
     *
     * @param id
     * @return
     */
    @Override
    public OrderItem queryOrderItemByOrderId(String id) {
        String sql="select * from Good where id=?;";
        return queryForOne(OrderItem.class,sql,id);
    }
}
