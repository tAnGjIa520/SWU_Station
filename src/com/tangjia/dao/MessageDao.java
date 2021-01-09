package com.tangjia.dao;

import com.tangjia.pojo.Message;

import java.util.List;

public interface MessageDao {
    /**
     * 增加一条评论
     * @param meaasge
     * @return
     */
    public int addMessage(Message meaasge);

    /**
     *删除一条Message
     * @param messageId
     * @return
     */
    public int deleteMessage(Integer messageId);

    /**
     * 为商家查记录
     * @param salerId
     * @return
     */
    public List<Message> querryMessageForSaler(Integer salerId);

    /**
     * 为顾客查找评论
     * @param clientId
     * @return
     */
    public List<Message> querryMessageForClient(Integer clientId);

    /**
     * 查找商品的评论
     * @param goodId
     * @return
     */
    public List<Message> querryMessageForOrder(String goodId);

    public Message querryById(Integer id);

}
