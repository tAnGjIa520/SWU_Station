package com.tangjia.service;

import com.tangjia.pojo.Response;

import java.util.List;

public interface ResponseService {
    public int addResponse(Response response);

    public int deleteResponse(int responseId);

    public List<Response> queryResponseForOne(int id);

    public List<Response> queryResponseForArticle(int id);

}
