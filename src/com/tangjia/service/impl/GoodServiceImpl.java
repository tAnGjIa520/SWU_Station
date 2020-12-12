package com.tangjia.service.impl;

import com.tangjia.dao.GoodDao;
import com.tangjia.dao.impl.GoodDaoImpl;
import com.tangjia.pojo.Good;
import com.tangjia.service.GoodService;

import java.util.List;

public class GoodServiceImpl implements GoodService {
    GoodDao goodDao=new GoodDaoImpl();

    @Override
    public int addGood(Good good) {
        return goodDao.addGood(good);
    }

    @Override
    public int deleteGood(int id) {
        return goodDao.deleteGood(id);
    }

    @Override
    public List<Good> querryAllGood() {
        return goodDao.querryAllGood();
    }


    @Override
    public List<Good> querryGoodForSaler(int saler) {
        return goodDao.querryGoodForSaler(saler);
    }

    @Override
    public Good querryGoodById(Integer id) {
        return goodDao.querryGoodById(id);
    }

    @Override
    public int setGood(Good good) {
        return goodDao.setGood(good);
    }
}
