package com.tangjia.dao.impl;

import com.tangjia.Utils.JDBCutils;
import com.tangjia.dao.UserDao;
import com.tangjia.pojo.User;
import org.apache.commons.dbutils.QueryRunner;

import java.beans.JavaBean;
import java.sql.*;
import java.util.Enumeration;
import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {

    @Override
    public int setUser(User user) {
        String sql="update USER set username=?,password=?,email=?,trade_number=? where id= ?";
        return update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getTrade_number(),user.getId());
    }

    @Override
    public User queryUserByUsername(String username) {
        String sql = "select * from USER where username=?";
        return queryForOne(User.class,sql,username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {

        String sql = "select * from USER where username=? and password=?";
        return queryForOne(User.class,sql,username,password);
}

    @Override
    public int addUser(User user) {
        String sql="INSERT INTO USER (username,password,email,trade_number) VALUES ( ?,?,?,?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getTrade_number());

    }

    @Override
    public int updateIcon(String icon, Integer userId) {
        String sql="update USER set icon=? where id= ?";
        return  update(sql,icon,userId);
    }

    @Override
    public User queryUser(Integer id) {
        String sql="select * from USER where id= ?";
        return queryForOne(User.class,sql,id);
    }

    @Override
    public User queryByUserNameEmail(String username, String email) {
        String sql="SELECT * FROM USER WHERE username=? and email=?;";
        return queryForOne(User.class,sql,username,email);
    }

    @Override
    public List<User> queryAll() {
        String sql="SELECT * FROM USER";

        return queryForList(User.class,sql);
    }

    @Override
    public int deleteUser(int id) {
        String sql="delete from USER where id=?";
        return update(sql,id);
    }
}
