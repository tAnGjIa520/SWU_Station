package com.tangjia.web;

import com.tangjia.dao.impl.BaseDao;
import com.tangjia.pojo.Article;
import com.tangjia.pojo.Response;
import com.tangjia.pojo.User;
import com.tangjia.service.ArticleService;
import com.tangjia.service.MessageService;
import com.tangjia.service.ResponseService;
import com.tangjia.service.impl.ArticleServiceImpl;
import com.tangjia.service.impl.MessageServiceImpl;
import com.tangjia.service.impl.ResponseServiceImpl;
import com.tangjia.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

public class BBSServlet extends BaseServlet {
    private ArticleService articleService=new ArticleServiceImpl();
    private ResponseService responseService=new ResponseServiceImpl();
    /*private ResponseService responseService=new ResponseServiceImpl();*/
    //需要提供
    protected void addArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("已经收到请求");
        String content = request.getParameter("content");
        System.out.println("内容是:" +content);
        String title = request.getParameter("title");
        System.out.println("title "+title);
        HttpSession session = request.getSession();
        User user =(User) session.getAttribute("user");
        Article article = new Article(null, user.getId(), content, title, null, new Date(), null);
        articleService.addArticle(article);
        System.out.println("已经加入成功");
        response.sendRedirect(request.getHeader("Referer"));

    }

    protected void deleteArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("已经收到请求");

    }
    protected void showArticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("正在列出商品！！");
        List<Article> articles = articleService.queryAllArticles();
        for(Article article:articles){
            System.out.println(article);
        }
        request.setAttribute("articleList",articles);
        System.out.println("已发送");
        request.getRequestDispatcher("pages/BBS_index.jsp").forward(request,response);
    }

    protected void getResponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        UserServiceImpl userService = new UserServiceImpl();
        int articleId = Integer.parseInt(request.getParameter("articleId"));

        List<Response> responses = responseService.queryResponseForArticle(articleId);
        Map<Integer, User> integerUserHashMap = new HashMap<>();

        for (Response response2:responses) {
            System.out.println(response2);

        }

        request.setAttribute("responseList",responses);
        Article article = articleService.queryArticle(articleId);
        System.out.println(article);
        request.setAttribute("article",article);


        request.getRequestDispatcher("pages/articles.jsp").forward(request,response);
    }

    protected void addResponse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("==============123123");
        int articleId = Integer.parseInt(request.getParameter("articleId"));
        String response1 = request.getParameter("response");
        System.out.println(response1);
        Response response2 = new Response(null, articleId, response1, new Date());
        responseService.addResponse(response2);
        response.sendRedirect(request.getHeader("Referer"));
    }
}
