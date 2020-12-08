package com.tangjia.pojo;

import java.util.Objects;

/**
 * 用户信息
 */
public class User {
    private String username;//用户名
    private String password;//密码
    private String email;//邮箱
    private Integer id;
    private Integer trade_number;//有效交易次数

    public User() {
    }

    public User(String username, String password, String email,Integer id) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.id = id;
        this.trade_number=0;
    }

    public User( int id,String username, String password, String email, Integer trade_number) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.id = id;
        this.trade_number = trade_number;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTrade_number() {
        return trade_number;
    }

    public void setTrade_number(int trade_number) {
        this.trade_number = trade_number;
    }

    @Override
    public String toString() {
        return "User{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", id=" + id +
                ", trade_number=" + trade_number +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return id == user.id &&
                Objects.equals(username, user.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(username, id);
    }
}
