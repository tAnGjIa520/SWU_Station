package com.tangjia.test;

import com.tangjia.dao.UserDao;
import com.tangjia.dao.impl.UserDaoImpl;
import com.tangjia.pojo.User;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDaoImplTest {
    UserDao userDao = new UserDaoImpl();
    User user=new User(134,"ro4","123","email",10);
    @Test
    public void setUser() {
        userDao.setUser(new User(123,"root","123","email",100));
    }

    @Test
    public void queryUserByUsername() {

        System.out.println(user);
    }

    @Test
    public void queryUserByUsernameAndPassword() {
        User user1 = userDao.queryUserByUsernameAndPassword("root", "d");
        User user = user1;
        System.out.println(user);
    }

    @Test
    public void addUser() {
        int i = userDao.addUser(user);
        System.out.println(i);
    }

    @Test
    public void deleteUser() {
        userDao.deleteUser(user);
    }
}