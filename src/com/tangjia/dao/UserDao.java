package com.tangjia.dao;

import com.tangjia.pojo.User;

public interface UserDao {
    //基本思路增删查改
    public int addUser(User user);

    public User queryUserByUsername(String username);

    public User queryUserByUsernameAndPassword(String username,String password);

    public int setUser(User user);


}