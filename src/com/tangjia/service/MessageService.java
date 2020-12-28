package com.tangjia.service;

import com.tangjia.pojo.Good;
import com.tangjia.pojo.Message;

import java.util.List;

public interface MessageService {
    public int addMessage(Message message);

    public List<Message> queryMessageForSaler(Integer salerId);

    public List<Message> queryMessageForOrder(String goodId);

    public List<Message> queryMessageForClient(Integer clientId);

    public int deleteMessage(Integer id);
}
