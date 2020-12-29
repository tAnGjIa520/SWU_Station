package com.tangjia.service.impl;

import com.tangjia.dao.ArticleDao;
import com.tangjia.dao.impl.ArticleDaoImpl;
import com.tangjia.pojo.Article;
import com.tangjia.service.ArticleService;

import java.util.List;

public class ArticleServiceImpl implements ArticleService {
    private ArticleDao articleDao=new ArticleDaoImpl();
    @Override
    public int addArticle(Article article) {
        return articleDao.addArticle(article);
    }

    @Override
    public int deleteArticle(int id) {
        return articleDao.deleteArticle(id);
    }

    @Override
    public int updateTags(Article article) {
        return articleDao.updateTags(article);
    }

    @Override
    public List<Article> queryAllArticles() {
        return articleDao.queryAllArticles();
    }

    @Override
    public List<Article> queryArticleForOne(Integer userId) {
        return articleDao.queryArticleForOne(userId);
    }

    @Override
    public Article queryArticle(int id) {
        return articleDao.queryArticle(id);
    }
}
