package com.tangjia.web;

import com.tangjia.pojo.User;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import org.apache.commons.mail.HtmlEmail;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;


public class UserServlet extends BaseServlet {

    protected void email(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        System.out.println("已经收到");
        try {

            HtmlEmail email = new HtmlEmail();//不用更改
            email.setHostName("smtp.126.com");//需要修改，126邮箱为smtp.126.com,163邮箱为163.smtp.com，QQ为smtp.qq.com
            email.setCharset("UTF-8");
            email.addTo("1157507000@qq.com");// 收件地址

            email.setFrom("tj20010424@126.com", "aa");//此处填邮箱地址和用户名,用户名可以任意填写

            email.setAuthentication("tj20010424@126.com", "ONAEOHNVIYAGVFPP");//此处填写邮箱地址和客户端授权码

            email.setSubject("孙大大通讯");//此处填写邮件名，邮件名可任意填写
            email.setMsg("尊敬的用户您好,您本次注册的验证码是:" + 123);//此处填写邮件内容

            email.send();

        }
        catch(Exception e){
            e.printStackTrace();

        }
    }

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
            request.getRequestDispatcher("/message?action=messageList").forward(request,response);
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

    protected void uploadIcon(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("已收到请求");
     /*   req.setCharacterEncoding("utf-8");
        String headimg=req.getParameter("headimg");
        System.out.println(123);
        System.out.println("111" + headimg);
        //解析和检查请求，是否是post方式，是否是二进制流格式
        Boolean isMultipart= ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            return; //如果不是就不用上传了
        }

        try {
            //userIcon/default
            //创建FileItemFactory对象
            FileItemFactory factory=new DiskFileItemFactory();
            //创建文件上传的处理器
            ServletFileUpload upload=new ServletFileUpload(factory);
            //解析请求
            List<FileItem> items=upload.parseRequest(req);
            for (FileItem item : items) {
                String fileName = item.getFieldName();
                if (item.isFormField()) {
                    String file = item.getString("utf-8");

                } else {
                    String RandomName = UUID.randomUUID().toString()+"."+ FilenameUtils.getExtension(item.getName());
                   *//* System.out.println(fileName + "->" + item.getName()); //一个的标签的name，一个是文件的name*//*
                    String path =super.getServletContext().getRealPath("/WEB-INF");
                    System.out.println(path);
                    item.write(new File(path, RandomName)); //把上传的文件保存到某个文件中
                }
            }

        } catch (Exception e){
            e.printStackTrace();
        }
*/




    }


}
