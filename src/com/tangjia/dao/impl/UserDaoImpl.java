package com.tangjia.dao.impl;

import com.tangjia.dao.UserDao;
import com.tangjia.pojo.User;

public class UserDaoImpl implements UserDao {
    @Override
    public int setUser(User user) {
        return 0;
    }

    @Override
    public User queryUserByUsername(String username) {
        return null;
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        return null;
    }

    @Override
    public int addUser(User user) {
        return 0;
    }
}
