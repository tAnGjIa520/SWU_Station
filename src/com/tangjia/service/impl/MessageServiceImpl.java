package com.tangjia.service.impl;

import com.tangjia.dao.MessageDao;
import com.tangjia.dao.impl.MessageDaoImpl;
import com.tangjia.pojo.Message;
import com.tangjia.service.MessageService;

import java.util.List;

public class MessageServiceImpl implements MessageService {
    private MessageDao messageDao=new MessageDaoImpl();

    @Override
    public int addMessage(Message message) {
        return  messageDao.addMessage(message);
    }

    @Override
    public List<Message> queryMessageForSaler(Integer salerId) {
        return  messageDao.querryMessageForSaler(salerId);
    }

    @Override
    public List<Message> queryMessageForOrder(String goodId) {
        return  messageDao.querryMessageForOrder(goodId);
    }

    @Override
    public List<Message> queryMessageForClient(Integer clientId) {
        return  messageDao.querryMessageForClient(clientId);
    }

    @Override
    public int deleteMessage(Integer id) {
        return  messageDao.deleteMessage(id);
    }
}
