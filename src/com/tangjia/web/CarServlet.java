package com.tangjia.web;

import com.tangjia.pojo.Car;
import com.tangjia.pojo.CarItem;
import com.tangjia.pojo.Good;
import com.tangjia.service.GoodService;
import com.tangjia.service.impl.GoodServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;


public class CarServlet extends BaseServlet{

    private GoodService goodService =new GoodServiceImpl();
    protected void addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*System.out.println("正在加入购物车");
        System.out.println(request.getParameter("goodId"));
        */

        Integer id = Integer.parseInt(request.getParameter("goodId"));
        Good good = goodService.querryGoodById(id);
        CarItem carItem = new CarItem(good.getId(), good.getGoodname(), 1, good.getPrice(), good.getPrice());
        HttpSession session = request.getSession();
        Car car = (Car) session.getAttribute("car");
        if (car == null) {
            car = new Car();
        }
        car.addItem(carItem);

        session.setAttribute("car", car);


        for (Integer i : car.getItemsMap().keySet()) {
            {
                System.out.println(car.getItemsMap().get(i));
            }

        }
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void clearCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Car car = (Car)session.getAttribute("car");
        car.clearItems();
        System.out.println(request.getHeader("Referer"));
        response.sendRedirect(request.getHeader("Referer"));


    }

    protected void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Car car = (Car)session.getAttribute("car");
        car.deleteItem(Integer.parseInt(request.getParameter("itemId")));
/*        System.out.println(request.getHeader("Referer"));*/
        response.sendRedirect(request.getHeader("Referer"));

    }

    protected void setItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        Car car =(Car) session.getAttribute("car");
        car.setItemCount(Integer.parseInt(request.getParameter("goodId")),Integer.parseInt(request.getParameter("newCount")));
        response.sendRedirect(request.getHeader("Referer"));
    }

}
