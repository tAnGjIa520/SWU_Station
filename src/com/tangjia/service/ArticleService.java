package com.tangjia.service;

import com.tangjia.pojo.Article;

import java.util.List;

public interface ArticleService {
    public int addArticle(Article article);

    public int deleteArticle(int id);

    public int updateTags(Article article);

    public List<Article> queryAllArticles();

    public List<Article> queryArticleForOne(Integer userId);

}