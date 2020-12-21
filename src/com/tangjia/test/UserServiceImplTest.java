package com.tangjia.test;

import com.tangjia.pojo.User;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.UserServiceImpl;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserServiceImplTest {
    UserService userService=new UserServiceImpl();
    User user=new User(134,"root","1233","email",10);

    @Test
    public void existUsername() {
        System.out.println(userService.existUsername(user.getUsername()));
    }

    @Test
    public void login() {
/*//        System.out.println(userService.login());*/
        System.out.println(userService.login("1234","1234"));
    }

    @Test
    public void register() {
        System.out.println(userService.register(user));
    }

    @Test
    public void updateIcon() {
        userService.updateIcon(1,"1234");
    }
}