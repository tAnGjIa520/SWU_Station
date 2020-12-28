package com.tangjia.test;

import com.tangjia.dao.MessageDao;
import com.tangjia.dao.impl.MessageDaoImpl;
import com.tangjia.pojo.Message;
import org.junit.Test;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class MessageDaoImplTest {
    MessageDao messageDao=new MessageDaoImpl();

    @Test
    public void addMessage() {

        Message message = new Message(null,4,"5555",new Date(),5,1,"很好用！！");
        messageDao.addMessage(message);
    }

    @Test
    public void deleteMessage() {
    /*    Message message = new Message(1,4,12,new Date(),2,1);*/
        messageDao.deleteMessage(1);
    }

    @Test
    public void querryMessageForSaler() {
        List<Message> messages = messageDao.querryMessageForSaler(4);
        for (Message e:messages){
            System.out.println(e);
        }
    }

    @Test
    public void querryMessageForClient() {
        List<Message> messages = messageDao.querryMessageForClient(1);
        for (Message e:messages){
            System.out.println(e);
        }
    }

    @Test
    public void querryMessageForGood() {
        List<Message> messages = messageDao.querryMessageForOrder("12");
        for (Message e:messages){
            System.out.println(e);
        }
    }
}