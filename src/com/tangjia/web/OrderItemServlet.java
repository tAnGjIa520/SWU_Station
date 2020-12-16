package com.tangjia.web;

import com.tangjia.pojo.Car;
import com.tangjia.pojo.User;
import com.tangjia.service.OrderItemService;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.OrderItemServiceImpl;
import com.tangjia.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class OrderItemServlet extends BaseServlet {
    private OrderItemService orderItemService=new OrderItemServiceImpl();

    protected void createOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        Car car = (Car)session.getAttribute("car");
        User user = (User)session.getAttribute("user");
        Integer userId = user.getId();
        System.out.println(car);
        System.out.println(userId);
        orderItemService.createOrderItem(car,userId);
        session.removeAttribute("car");
        response.sendRedirect(request.getHeader("Referer"));
        System.out.println("已经结算完毕");

    }


    protected void showOrderForSaler(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        System.out.println("已经收到请求");

        User user = (User)request.getSession().getAttribute("user");
        int salerId = user.getId();
/*        System.out.println(orderItemService.showOrderItemForSaler(salerId));*/
        request.setAttribute("salerInfoList",orderItemService.showOrderItemForSaler(salerId));
        /*response.sendRedirect(request.getContextPath()+"/tradehistory.jsp");*/
        request.getRequestDispatcher("/tradehistory.jsp").forward(request,response);

    }


    protected void showOrderForUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        User user = (User)request.getSession().getAttribute("user");
        int userId = user.getId();
        request.setAttribute("userInfoList",orderItemService.showOrderItemForUser(userId));
        request.getRequestDispatcher("/buyhistory.jsp").forward(request,response);
        /*response.sendRedirect(request.getContextPath()+"/buyhistory.jsp");*/
    }

    //request :orderId
    protected void sendOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String orderId = request.getParameter("orderId");
        orderItemService.sendOrderItem(orderId);
        request.getRequestDispatcher("orderItemServlet?action=showOrderForSaler").forward(request,response);
/*        response.sendRedirect(request.getContextPath()+"/orderItemServlet?action=showOrderForUser");*/
    }

    //request :orderId
    protected void receiveOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String orderId = request.getParameter("orderId");
        orderItemService.reseiveOrderItem(orderId);
        request.getRequestDispatcher("orderItemServlet?action=showOrderForUser").forward(request,response);
    }

}
