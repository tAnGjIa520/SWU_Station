package com.tangjia.test;

import com.tangjia.Utils.TimeUtils;
import com.tangjia.dao.impl.GoodDaoImpl;
import com.tangjia.pojo.Good;
import com.tangjia.service.GoodService;
import com.tangjia.service.impl.GoodServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class GoodServiceTest {
    GoodService goodService=new GoodServiceImpl();
    Good good=new Good(4,"root",12,"好看使用",null, TimeUtils.getCurrentTime(),null,new BigDecimal(100),null);
    Good newgood=new Good(null,"giao",12,"好看使用",null, TimeUtils.getCurrentTime(),null,new BigDecimal(100),null);

    @Test
    public void addGood() {
        System.out.println(goodService.addGood(newgood));
    }

    @Test
    public void deleteGood() {
        System.out.println(goodService.deleteGood(16));
    }

    @Test
    public void querryAllGood() {
        List<Good> list = goodService.querryAllGood();
        for (Good good:list){
            System.out.println(good);

        }
    }

    @Test
    public void querryGoodForSaler() {
        List<Good> list = goodService.querryGoodForSaler(8);
        for (Good good:list){
            System.out.println(good);

        }
    }

    @Test
    public void querryGoodById() {
        System.out.println(goodService.querryGoodById(100));
    }

    @Test
    public void setGood() {
        goodService.setGood(good);
    }
}