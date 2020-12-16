package com.tangjia.service.impl;

import com.tangjia.dao.OrderItemDao;
import com.tangjia.dao.impl.OrderItemDaoImpl;
import com.tangjia.pojo.Car;
import com.tangjia.pojo.CarItem;
import com.tangjia.pojo.OrderItem;
import com.tangjia.service.OrderItemService;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class OrderItemServiceImpl implements OrderItemService {

    OrderItemDao orderItemDao=new OrderItemDaoImpl();

    /**
     * 传入购物车，买家id，创建一个订单
     *
     * @param car
     * @param userId
     * @return
     */
    @Override
    public int createOrderItem(Car car, Integer userId) {

        Date date = new Date();
        Set<Integer> idSet = car.getItemsMap().keySet();
        Map<Integer, CarItem> itemsMap = car.getItemsMap();
        int result=0;
        for (Integer id:idSet){
            String datestring=date.getTime()+userId+""+itemsMap.get(id).getId();
            CarItem carItem = itemsMap.get(id);
            OrderItem orderItem = new OrderItem(datestring, userId, orderItemDao.querySalerByGoodId(carItem.getId()), carItem.getItemName(), carItem.getItemPrice(), carItem.getTotalItemCount(), carItem.getTotalItemPrice(), new Date(), 0);
            result=orderItemDao.addOrderItem(orderItem);
            if (result==0){
                return 0;
            }
        }
        return 1;
    }

    /**
     * 传入一个卖家id，列出他的所有商品信息（买）
     *
     * @param userId
     * @return
     */
    @Override
    public List<OrderItem> showOrderItemForSaler(Integer userId) {
        return orderItemDao.queryOrderItemForSaler(userId);
    }

    /**
     * 传入一个卖家id，传出他的所有商品信息（卖）
     *
     * @param salerId
     * @return
     */
    @Override
    public List<OrderItem> showOrderItemForUser(Integer salerId) {
        return orderItemDao.queryOrderItemForUser(salerId);
    }

    /**
     * 卖家把商品状态设为发出
     *
     * @param orderId
     * @return
     */
    @Override
    public int sendOrderItem(String orderId) {

        return orderItemDao.changeOrderStatus(orderId,OrderItem.SENDING);
    }

    /**
     * 买家把商品状态设为已经收到！！
     *
     * @param orderId
     * @return
     */
    @Override
    public int reseiveOrderItem(String orderId) {
        return orderItemDao.changeOrderStatus(orderId,OrderItem.FINISHED);
    }
}
