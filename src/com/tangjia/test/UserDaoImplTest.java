package com.tangjia.test;

import com.tangjia.dao.UserDao;
import com.tangjia.dao.impl.UserDaoImpl;
import com.tangjia.pojo.User;
import org.junit.Test;


import java.sql.Time;
import java.util.Date;


import static org.junit.Assert.*;

public class UserDaoImplTest {
    UserDao userDao = new UserDaoImpl();
    User user=new User("123","123456","email",null);
    @Test
    public void setUser() {
        userDao.setUser(new User(1,"r33ot","1ass23","email",100));
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

    }

    @Test
    public void updateIcon() {
        int id=1;
        String icon="123";
        userDao.updateIcon(icon,id);
    }
    @Test
    public void test(){
        User user = userDao.queryByUserNameEmail("ro4", "email");
        System.out.println(user);
    }
}