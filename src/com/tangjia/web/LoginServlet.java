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

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        UserServiceImpl userService = new UserServiceImpl();
        HttpSession session = request.getSession();

        User user=userService.login(request.getParameter("username"),request.getParameter("password"));
        if (user==null){
            System.out.println("登陆失败");
            request.getRequestDispatcher("/login_fail.jsp").forward(request,response);
        }else {
            System.out.println(user);
            System.out.println("登录成功");
            session.setAttribute("user" ,user);

            request.getRequestDispatcher("/main_index.jsp").forward(request,response);
//            response.sendRedirect();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
