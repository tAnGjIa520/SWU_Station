package com.tangjia.web;

import com.tangjia.pojo.User;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SetUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("===========================已经收到请求");
        HttpSession session = request.getSession();
        User olduser = (User) session.getAttribute("user");

        //获取新的账号
        String newusername = (String)request.getParameter("newusername");
        if (newusername==null || newusername==""){
            newusername=olduser.getUsername();
        }

        String newpassword= (String)request.getParameter("newpassword");
        if (newpassword==null|| newpassword==""){
            newpassword=olduser.getPassword();
        }
        String newemail = (String)request.getParameter("newemail");
        if (newemail==null|| newemail==""){
            newemail=olduser.getEmail();
        }

        System.out.println("====================================");
        User user = new User(olduser.getId(), newusername, newpassword, newemail, olduser.getTrade_number());
        UserService userService = new UserServiceImpl();
        userService.setUser(user);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
