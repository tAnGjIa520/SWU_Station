package com.tangjia.dao.impl;

import com.google.gson.Gson;
import com.tangjia.Utils.JedisUtils;
import com.tangjia.dao.MessageDao;
import com.tangjia.pojo.Message;
import com.tangjia.web.BaseServlet;
import redis.clients.jedis.Jedis;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

public class MessageDaoImpl extends BaseDao implements MessageDao {
    /**
     * 增加一条评论
     *
     * @param meaasge
     * @return
     */
    @Override
    public int addMessage(Message meaasge) {
        Gson gson = new Gson();
        String s = gson.toJson(meaasge);
        Jedis connection = JedisUtils.getConnection();
        connection.sadd(String.valueOf(meaasge.getSalerId()),s);
        connection.close();
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
        Gson gson = new Gson();
        Jedis connection = JedisUtils.getConnection();
        List<Message> messageList = new LinkedList<>();
        Set<String> smembers = connection.smembers(String.valueOf(salerId));
        if (smembers.size()!=0 && smembers!=null){
            for (String s:smembers){
                System.out.println(s);
                Message message = gson.fromJson(s, Message.class);
                messageList.add(message);
                System.out.println(message);
            }
        }else {

            String sql="select * from Message where salerId=?;";
            messageList=queryForList(Message.class, sql, salerId);
            for (Message message:messageList){
                String s = gson.toJson(message);
                connection.sadd(String.valueOf(salerId),s);
            }


        }
        connection.close();
        return messageList;


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
        /*
            private Integer id;
            private Integer salerId;
            private String orderId;
            private Date date;
            private Integer level;
            private Integer clientId;
            private String mark;
        */

        return queryForList(Message.class,sql,goodId);
    }

    @Override
    public Message querryById(Integer id) {
        String sql="select * from Message where id=?;";
        return queryForOne(Message.class,sql,id);
    }
}
