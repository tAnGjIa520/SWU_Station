package com.tangjia.dao.impl;

import com.tangjia.dao.MessageDao;
import com.tangjia.pojo.Message;
import com.tangjia.web.BaseServlet;

import java.util.List;

public class MessageDaoImpl extends BaseDao implements MessageDao {
    /**
     * 增加一条评论
     *
     * @param meaasge
     * @return
     */
    @Override
    public int addMessage(Message meaasge) {
        String sql="INSERT INTO Message (id,salerId,orderId,date,level,clientId,mark) VALUES (?,?,?,?,?,?,?)";
        return update(sql,meaasge.getId(),meaasge.getSalerId(),meaasge.getOrderId(),meaasge.getDate(),meaasge.getLevel(),meaasge.getClientId(),meaasge.getMark());
    }

    /**
     * 删除一条Message
     * @param messageId
     * @return
     */
    @Override
    public int deleteMessage(Integer messageId) {
        String sql="delete from Message where id=?;";
        return update(sql,messageId);
    }

    /**
     * 为商家查记录
     *
     * @param salerId
     * @return
     */
    @Override
    public List<Message> querryMessageForSaler(Integer salerId) {
        String sql="select * from Message where salerId=?;";
        return queryForList(Message.class,sql,salerId);
    }

    /**
     * 为顾客查找评论
     *
     * @param clientId
     * @return
     */
    @Override
    public List<Message> querryMessageForClient(Integer clientId) {
        String sql="select * from Message where clientId=?;";
        return queryForList(Message.class,sql,clientId);
    }

    /**
     * 查找商品的评论
     *
     * @param goodId
     * @return
     */
    @Override
    public List<Message> querryMessageForOrder(String goodId) {
        String sql="select * from Message where goodId=?;";
        return queryForList(Message.class,sql,goodId);
    }
}
