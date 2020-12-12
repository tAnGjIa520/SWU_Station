package com.tangjia.web;


import com.tangjia.pojo.Good;
import com.tangjia.pojo.User;
import com.tangjia.service.GoodService;
import com.tangjia.service.impl.GoodServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class GoodServlet extends BaseServlet {

    private GoodService goodService=new GoodServiceImpl();

    protected void updateGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void deleteGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        goodService.deleteGood(Integer.parseInt(request.getParameter("id")));
        list(request,response);
//        response.sendRedirect(request.getContextPath()+"/myGoods.jsp");
    }

    protected void addGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Good good = new Good();
        try {
            BeanUtils.populate(good,request.getParameterMap());
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        User user =(User) request.getSession().getAttribute("user");
        good.setSaler(user.getId());
        goodService.addGood(good);

        response.sendRedirect(request.getContextPath()+"/myGoods.jsp");
    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("正在列出图书列表！！！");
        HttpSession session = request.getSession();
          /*Object user =(User) */
        User user =(User) session.getAttribute("user");



        List<Good> list = goodService.querryGoodForSaler(user.getId());
        for (Good good:list){
            System.out.println(good);
        }
        request.setAttribute("Goods", list);

        request.getRequestDispatcher("myGoods.jsp").forward(request,response);
    }


}
