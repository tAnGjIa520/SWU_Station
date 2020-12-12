package com.tangjia.test;

import com.tangjia.Utils.TimeUtils;
import com.tangjia.dao.GoodDao;
import com.tangjia.dao.UserDao;
import com.tangjia.dao.impl.GoodDaoImpl;
import com.tangjia.pojo.Good;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class GoodDaoImplTest {
    /*  id,goodname,saler,description,STATUS,DATE,CLIENT,price,photo*/
    /*Integer id, String goodname, Integer saler,  String description, Integer status, String date, String client,BigDecimal price, String photo*/
    Good good=new Good(1,"123",123,"123",1, TimeUtils.getCurrentTime(),"123",new BigDecimal(123), null);
    Good good1=new Good(null,"123",123,"123",1, TimeUtils.getCurrentTime(),"123",new BigDecimal(123), null);

    GoodDao goodDao=new GoodDaoImpl();
    @Test
    public void addGood() {
        goodDao.addGood(good1);
    }

    @Test
    public void deleteGood() {
        goodDao.deleteGood(2);
    }

    @Test
    public void querryAllGood() {
        List<Good> list = goodDao.querryAllGood();
        for (Good good:list){
            System.out.println(good);
        }
    }

    @Test
    public void querryGoodForSaler() {
        List<Good> list = goodDao.querryGoodForSaler(123);
        for (Good good:list){
            System.out.println(good);
        }
    }

    @Test
    public void querryGoodById() {
        Good good = goodDao.querryGoodById(4);
        System.out.println(good);
    }

    @Test
    public void setGood() {
        Good good=new Good(4,"1233123",123,"1231231",1, TimeUtils.getCurrentTime(),"123",new BigDecimal(123), null);
        goodDao.setGood(good);
    }
}