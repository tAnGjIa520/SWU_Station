package com.tangjia.dao.impl;

import com.tangjia.dao.ResponseDao;
import com.tangjia.pojo.Article;
import com.tangjia.pojo.Response;

import java.util.List;

public class ResponseDaoImpl extends BaseDao implements ResponseDao {

    @Override
    public int addResponse(Response response) {
        String sql="INSERT INTO Response (id,articleId,content,date) VALUES (?,?,?,?);";
        return update(sql,response.getId(),response.getArticleId(),response.getContent(),response.getDate());

    }

    @Override
    public int deleteResponse(int responseId) {
        String sql="delete from Response where id=?;";

        return update(sql,responseId);
    }

    @Override
    public List<Response> queryResponseForOne(int id) {
        String sql="select * from Response where id=?;";
        return queryForList(Response.class,sql,id);
    }

    @Override
    public List<Response> queryResponseForArticle(int id) {
        String sql="select * from Response where articleId=?;";
        return queryForList(Response.class,sql,id);
    }
}
