package com.tangjia.test;

import com.tangjia.dao.ArticleDao;
import com.tangjia.dao.impl.ArticleDaoImpl;
import com.tangjia.pojo.Article;
import org.junit.Test;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class ArticleDaoImplTest {
    private Article article=new Article(null,4,"我想要一个相机，求安利，","anli",4,new Date(),null);
    private ArticleDao articleDao=new ArticleDaoImpl();
    @Test
    public void addArticle() {
        articleDao.addArticle(article);
    }

    @Test
    public void deleteArticle() {
        articleDao.deleteArticle(1);
    }

    @Test
    public void updateTags() {
        article.setTags(111);
        article.setId(2);
        articleDao.updateTags(article);


    }

    @Test
    public void queryAllArticles() {
        List<Article> articles = articleDao.queryAllArticles();
        for (Article article:articles){
            System.out.println(article);
        }
    }

    @Test
    public void queryArticleForOne() {
        List<Article> articles = articleDao.queryArticleForOne(4);
        for (Article article:articles){
            System.out.println(article);
        }
    }
}