package com.tangjia.test;

import com.tangjia.dao.ResponseDao;
import com.tangjia.dao.impl.ResponseDaoImpl;
import com.tangjia.pojo.Response;
import org.junit.Test;

import javax.print.DocFlavor;
import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

public class ResponseDaoImplTest {

    private ResponseDao responseDao=new ResponseDaoImpl();
    private Response response=new Response(null,1,"我也是这么认为的",new Date());
    private Response response1=new Response(null,1,"我也是这么认为的",new Date());

    private Response response2=new Response(null,1,"我也是这么认为的",new Date());

    @Test
    public void addResponse() {
        responseDao.addResponse(response1);
        responseDao.addResponse(response2);

    }

    @Test
    public void deleteResponse() {
        responseDao.deleteResponse(1);
    }

    @Test
    public void queryResponseForOne() {
        responseDao.queryResponseForOne(1);
    }

    @Test
    public void queryResponseForArticle() {
        List<Response> responses = responseDao.queryResponseForArticle(1);
        for (Response response:responses){
            System.out.println(response);
        }
    }
}