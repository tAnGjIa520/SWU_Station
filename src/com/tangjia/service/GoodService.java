package com.tangjia.service;

import com.tangjia.pojo.Good;

import java.util.List;

public interface GoodService {
    public int addGood(Good good);

    public int deleteGood(int id);

    public List<Good> querryAllGood();

    public List<Good> querryGoodForSaler(int saler);

    public Good querryGoodById(Integer id);

    public int setGood(Good good);
}
