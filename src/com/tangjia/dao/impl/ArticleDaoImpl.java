package com.tangjia.dao.impl;

import com.tangjia.dao.ArticleDao;
import com.tangjia.pojo.Article;

import java.util.List;

public class ArticleDaoImpl extends BaseDao implements ArticleDao  {
    @Override
    public int addArticle(Article article) {
        String sql="INSERT INTO Article (id,authorId,content,title,tags,date,extra) VALUES (?,?,?,?,?,?,?);";
        return update(sql,article.getId(),article.getAuthorId(),article.getContent(),article.getTitle(),article.getTags(),article.getDate(),article.getExtra());
    }

    @Override
    public int deleteArticle(int id) {
        String sql="delete from Article where id=?;";

        return update(sql,id);
    }

    @Override
    public int updateTags(Article article) {
        String sql="update Article set tags=? where id= ?";

        return update(sql,article.getTags(),article.getId());
    }

    @Override
    public List<Article> queryAllArticles() {
        String sql="select * from Article;";
        return queryForList(Article.class,sql);
    }

    @Override
    public List<Article> queryArticleForOne(Integer userId) {
        String sql="select * from Article where authorId=?;";
        return queryForList(Article.class,sql,userId);
    }

    @Override
    public Article queryArticle(int id) {
        String sql="select * from Article where id=?;";
        return queryForOne(Article.class,sql,id);
    }
}
