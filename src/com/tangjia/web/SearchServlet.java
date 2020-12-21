package com.tangjia.web;

import com.tangjia.Utils.TokenizerUtils;
import com.tangjia.pojo.Good;
import com.tangjia.service.GoodService;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.GoodServiceImpl;
import com.tangjia.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SearchServlet extends BaseServlet {
    private GoodService goodService=new GoodServiceImpl();

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyWords = request.getParameter("keyWords");
        Set<String> keySet = TokenizerUtils.keySet(keyWords);
        List<Good> list = goodService.querryAllGood();
        Set<Good> resultSet=new HashSet<>();
        if (keyWords.equals("") ||keyWords==null){
            request.getRequestDispatcher("/goodServlet?action=listAll").forward(request,response);
            return;
        }
        for (Good good:list){
            for (String searchWord:keySet){
                String description = good.getDescription();
                String goodname = good.getGoodname();
                if (goodname.contains(searchWord)||description.contains(searchWord)){
                    resultSet.add(good);
                    break;
                }
            }
        }
        System.out.println("搜索结果是");
        request.setAttribute("allGood",resultSet);
        for (Good good:resultSet){
            System.out.println(good);
        }

        request.getRequestDispatcher("/shop_index.jsp").forward(request,response);
}
}
