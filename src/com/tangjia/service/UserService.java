package com.tangjia.service;

import com.tangjia.pojo.User;

import javax.swing.undo.UndoableEditSupport;
import java.util.List;

public interface UserService {

    /**
     * 用于确认某一个人是否存在
     * @param username  用户名
     * @return  true：存在 false：不存在
     */
    public boolean existUsername(String username);

    /**
     * 登陆
     * @param username
     * @param password
     * @return
     */

    public User login(String username,String password);


    /**
     * 用于注册某一个用户；
     * @param user
     * @return
     */
    public User register(User user);

    public User setUser(User user);

    public int updateIcon(Integer id,String icon);

    public User queryUser(Integer id);

    public User fetchPassword(String username,String email);

    public User queryByUsername(String username);

    public List<User> queryAll();

    public int deleteUser(int id);

}
