package com.tangjia.dao.impl;

import com.tangjia.Utils.JDBCutils;
import com.tangjia.dao.GoodDao;
import com.tangjia.pojo.Good;
import com.tangjia.pojo.User;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GoodDaoImpl extends BaseDao implements GoodDao {
//    id,goodname,saler,description,STATUS,DATE,CLIENT,price,photo
    @Override
    public int addGood(Good good) {
        String sql="INSERT INTO Good (id,goodname,saler,description,STATUS,DATE,CLIENT,price,photo) VALUES ( ?,?,?,?,?,?,?,?,?)";
        return update(sql,good.getId(),good.getGoodname(),good.getSaler(),good.getDescription(),good.getStatus(),good.getDate(),good.getClient(),good.getPrice(),good.getPhoto());
    }

    @Override
    public int deleteGood(int id) {
        String sql="delete from Good where id=?;";
        return update(sql,id);
    }

    @Override
    public List<Good> querryAllGood() {
        String sql="select * from Good;";
        return queryForList(Good.class,sql);
    }

    @Override
    public List<Good> querryGoodForSaler(int saler) {
        String sql="select * from Good where saler=?";
        return queryForList(Good.class,sql,saler);
    }

    @Override
    public Good querryGoodById(Integer id) {
        String sql="select * from Good where id =?";
        return queryForOne(Good.class,sql,id);
    }

    @Override
    public int setGood(Good good) {
        String sql="update Good set goodname=?,saler=?,description=?,STATUS=?,DATE=?,CLIENT=?,price=?,photo=? where id=?";
        return update(sql,good.getGoodname(),good.getSaler(),good.getDescription(),good.getStatus(),good.getDate(),good.getClient(),good.getPrice(),good.getPhoto(),good.getId());
    }
}
