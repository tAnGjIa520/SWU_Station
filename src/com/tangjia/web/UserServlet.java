package com.tangjia.web;

import com.tangjia.pojo.User;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;



public class UserServlet extends BaseServlet {

    protected void logout(HttpServletRequest request, HttpServletResponse response){
        request.getSession().invalidate();
        try {
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

         String code = (String)session.getAttribute("code");

        String code1 = request.getParameter("code");
        System.out.println(code);
        System.out.println(code1);
        System.out.println("===========");
   /*
        if (code.equalsIgnoreCase(code1) && code1!=null){
       }*/

        UserServiceImpl userService = new UserServiceImpl();

        User user=userService.login(request.getParameter("username"),request.getParameter("password"));
        if (user==null){
            System.out.println("登陆失败");
            request.getRequestDispatcher("/login_fail.jsp").forward(request,response);
        }else {
            System.out.println(user);
            System.out.println("登录成功");
            session.setAttribute("user" ,user);
            request.setAttribute("id",user.getId());
            request.getRequestDispatcher("/main_index.jsp").forward(request,response);
        }
        System.out.println("============================");

    }

    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
//        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String kaptcha_session_key =(String) session.getAttribute("KAPTCHA_SESSION_KEY");
        session.removeAttribute("KAPTCHA_SESSION_KEY");
        String code = request.getParameter("code");
        if (kaptcha_session_key!=null && kaptcha_session_key.equalsIgnoreCase(code)){
            User user = new User();
            UserService userService = new UserServiceImpl();
            try {

                BeanUtils.populate(user,request.getParameterMap());
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
            User register = userService.register(user);
            if (register==null){
                System.out.println("已存在这个用户名的用户");
                request.setAttribute("losetime",1);//0代表不存在这个用户
                request.getRequestDispatcher("/register.jsp").forward(request,response);
                return;
            }
            session.setAttribute("user" ,user);

            request.getRequestDispatcher("/main_index.jsp").forward(request,response);
        }else {
            System.out.println("验证码错误！！！");
            request.setAttribute("codeerror",1);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }


    }

    protected void set(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("===========================已经收到请求");
        HttpSession session = request.getSession();
        User olduser = (User) session.getAttribute("user");

        //获取新的账号
        String newusername = (String) request.getParameter("newusername");
        if (newusername == null || newusername == "") {
            newusername = olduser.getUsername();
        }

        String newpassword = (String) request.getParameter("newpassword");
        if (newpassword == null || newpassword == "") {
            newpassword = olduser.getPassword();
        }
        String newemail = (String) request.getParameter("newemail");
        if (newemail == null || newemail == "") {
            newemail = olduser.getEmail();
        }

        System.out.println("====================================");
        User user = new User(olduser.getId(), newusername, newpassword, newemail, olduser.getTrade_number());
        UserService userService = new UserServiceImpl();
        userService.setUser(user);
    }



}
