package com.tangjia.service.impl;

import com.tangjia.dao.UserDao;
import com.tangjia.dao.impl.UserDaoImpl;
import com.tangjia.pojo.User;
import com.tangjia.service.UserService;

public class UserServiceImpl implements UserService {
    UserDao userDao=new UserDaoImpl();
    @Override
    public boolean existUsername(String username) {
        if (userDao.queryUserByUsername(username)!=null){
            return true;
        }
        return false;
    }

    @Override
    public User login(String username,String password) {
        if (userDao.queryUserByUsernameAndPassword(username,password)!=null){
            return userDao.queryUserByUsernameAndPassword(username,password);
        }
        return null;
    }

    @Override
    public User register(User user) {
        System.out.println(userDao.queryUserByUsername(user.getUsername()));
        if (userDao.queryUserByUsername(user.getUsername())==null){
            userDao.addUser(user);
            

        }else{
            System.out.println("================");
            System.out.println(userDao.queryUserByUsername(user.getUsername()));
            return null;
        }
        return user;
    }
}
