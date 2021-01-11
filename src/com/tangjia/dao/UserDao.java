package com.tangjia.dao;

import com.tangjia.pojo.User;

import java.util.List;

public interface UserDao {
    //基本思路增删查改
    public int addUser(User user);

    public User queryUserByUsername(String username);

    public User queryUserByUsernameAndPassword(String username,String password);

    public int setUser(User user);

    public int updateIcon(String icon,Integer userId);

    public User queryUser(Integer id);

    public User queryByUserNameEmail(String username,String email);

    public List<User> queryAll();

    public int deleteUser(int id);



}
