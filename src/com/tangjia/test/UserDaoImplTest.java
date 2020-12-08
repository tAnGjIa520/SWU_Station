package com.tangjia.test;

import com.tangjia.dao.UserDao;
import com.tangjia.dao.impl.UserDaoImpl;
import com.tangjia.pojo.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoImplTest {
    UserDao userDao = new UserDaoImpl();
    User user=new User("roww","123","email",null);
    @Test
    public void setUser() {
        userDao.setUser(new User(1,"root","1ass23","email",100));
    }

    @Test
    public void queryUserByUsername() {

        System.out.println(userDao.queryUserByUsername(user.getUsername()));
    }

    @Test
    public void queryUserByUsernameAndPassword() {
        User user1 = userDao.queryUserByUsernameAndPassword("rosst", "d");
        System.out.println(user1);
    }

    @Test
    public void addUser() {
        int i = userDao.addUser(user);
        System.out.println(i);
    }

    @Test
    public void deleteUser() {
        user.setId(9);
        userDao.deleteUser(user);
    }
}