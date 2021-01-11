package com.tangjia.web;

import com.tangjia.pojo.Root;
import com.tangjia.pojo.User;
import com.tangjia.service.RootService;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.RootServiceImpl;
import com.tangjia.service.impl.UserServiceImpl;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class RootServlet extends BaseServlet {

    private RootService rootService=new RootServiceImpl();

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Root register = rootService.register(username, password);
        if (register!=null){
            System.out.println("成功");
            HttpSession session = request.getSession();
            session.setAttribute("root",register);
            request.getRequestDispatcher("manager/main_index.jsp").forward(request,response);

        }else {
            request.setAttribute("isSuccess",1);
            System.out.println("失败");
            request.getRequestDispatcher("manager_index.jsp").forward(request,response);
        }

    }


    protected void userList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService=new UserServiceImpl();
       /* userService.*/
        List<User> users = userService.queryAll();
        request.setAttribute("userList",users);
        request.getRequestDispatcher("manager/main_index.jsp").forward(request,response);
    }
    protected void deleteUesr(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService=new UserServiceImpl();
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(id);
        userList(request,response);
    }




}
