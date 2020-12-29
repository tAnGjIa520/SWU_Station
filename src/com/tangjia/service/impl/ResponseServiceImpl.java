package com.tangjia.service.impl;

import com.tangjia.dao.ResponseDao;
import com.tangjia.dao.impl.ResponseDaoImpl;
import com.tangjia.pojo.Response;
import com.tangjia.service.ResponseService;

import java.util.List;

public class ResponseServiceImpl implements ResponseService {

    private ResponseDao responseDao=new ResponseDaoImpl();

    @Override
    public int addResponse(Response response) {
        return responseDao.addResponse(response);
    }

    @Override
    public int deleteResponse(int responseId) {
        return responseDao.deleteResponse(responseId);
    }

    @Override
    public List<Response> queryResponseForOne(int id) {
        return responseDao.queryResponseForOne(id);
    }

    @Override
    public List<Response> queryResponseForArticle(int id) {
        return responseDao.queryResponseForArticle(id);
    }
}
