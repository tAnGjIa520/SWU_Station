package com.tangjia.web;

import com.tangjia.pojo.Good;
import com.tangjia.pojo.Message;
import com.tangjia.pojo.User;
import com.tangjia.service.MessageService;
import com.tangjia.service.OrderItemService;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.MessageServiceImpl;
import com.tangjia.service.impl.OrderItemServiceImpl;
import com.tangjia.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class MessageServlet extends BaseServlet {

    //需要request里的salerId,orderId,level,mark
    protected void addMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        MessageService messageService=new MessageServiceImpl();
        System.out.println("1111");
         HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int userId = user.getId();
        String salerId = request.getParameter("salerId");
        String goodId = request.getParameter("orderId");
        String level = request.getParameter("level");
        String mark = request.getParameter("mark");
        System.out.println(userId);
        System.out.println(salerId);
        System.out.println(goodId);
        System.out.println(level);
        System.out.println(mark);
        Message message = new Message(null,Integer.parseInt(salerId),goodId,new Date(),null,userId,mark);
        messageService.addMessage(message);
        System.out.println("加入成功！！");
        OrderItemService orderItemService=new OrderItemServiceImpl();
        orderItemService.markOrderItem(goodId);
        /*messageList(request,response);*/

        request.getRequestDispatcher("orderItemServlet?action=showOrderForUser").forward(request,response);
    }

    protected void messageList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MessageService messageService=new MessageServiceImpl();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int salerId = user.getId();
        System.out.println("salerId="+salerId);
        List<Message> messages = messageService.queryMessageForSaler(salerId);
        for (Message message:messages){
            System.out.println(message);
        }

        request.setAttribute("messageList",messages);
        request.getRequestDispatcher("main_index.jsp").forward(request,response);


    }



}
