package com.tangjia.service.impl;

import com.tangjia.pojo.Response;
import com.tangjia.service.ResponseService;

import java.util.List;

public class ResponseServiceImpl implements ResponseService {
    private ResponseService responseService=new ResponseServiceImpl();
    @Override
    public int addResponse(Response response) {
        return responseService.addResponse(response);
    }

    @Override
    public int deleteResponse(int responseId) {
        return responseService.deleteResponse(responseId);
    }

    @Override
    public List<Response> queryResponseForOne(int id) {
        return responseService.queryResponseForOne(id);
    }

    @Override
    public List<Response> queryResponseForArticle(int id) {
        return responseService.queryResponseForArticle(id);
    }
}
