package com.tangjia.dao.impl;

import com.tangjia.Utils.JDBCutils;
import com.tangjia.dao.UserDao;
import com.tangjia.pojo.User;

import java.sql.*;
import java.util.Enumeration;

public class UserDaoImpl implements UserDao {
    @Override
    public int setUser(User user) {
        Connection conn = JDBCutils.getConnectino();
        int i = 0;
        String sql=String.format("update USER set password='%s',email='%s',trade_number=%d where username= '%s'",user.getPassword(),user.getEmail(),user.getTrade_number(),user.getUsername());
        System.out.println(sql);
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            i = pstmt.executeUpdate();
            System.out.println("resutl: " + i);
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();

        }finally {
            JDBCutils.close(conn);
        }
        return i;
    }

    @Override
    public User queryUserByUsername(String username) {
        String sql = "select * from USER;";
        //3.通过数据库的连接操作数据库，实现增删改查
        Connection connectino = JDBCutils.getConnectino();
        User user = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            preparedStatement = connectino.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                if (rs.getString("username").equals(username)){
                    user=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("email"),rs.getInt("trade_number"));
                    System.out.println(user);
                    System.out.println("=====222");
                    break;
//                            new User(rs.getInt("id"),rs.getString("name"),rs.getInt("age"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JDBCutils.close(connectino);

        }
        return user;
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {

        String sql = "select * from USER";
        //3.通过数据库的连接操作数据库，实现增删改查
        Connection connectino = JDBCutils.getConnectino();
        User user = null;
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            preparedStatement = connectino.prepareStatement(sql);
            rs = preparedStatement.executeQuery();
            while(rs.next()){
                if (rs.getString("username").equals(username) &&rs.getString("password").equals(password)  ){
                    user=new User(rs.getInt("id"),rs.getString("username"),rs.getString("password"),rs.getString("email"),rs.getInt("trade_number"));
//                            new User(rs.getInt("id"),rs.getString("name"),rs.getInt("age"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JDBCutils.close(connectino);

        }

        return user;
    }

    @Override
    public int addUser(User user) {
        Connection connection = JDBCutils.getConnectino();
        int number=0;
        Statement statement = null;
        try {
            statement = connection.createStatement();
//          String sql="INSERT INTO USER (`id`,`username`,`password`,`email`,`trade_number`) VALUES ( "+user.getId()+" , "+user.getUsername()+" , "+user.getPassword()+","+user.getEmail()+","+user.getTrade_number()+");";
            String sql=String.format("INSERT INTO USER (id,username,password,email,trade_number) VALUES ( '%d','%s','%s','%s','%d');",user.getId(),user.getUsername(),user.getPassword(),user.getEmail(),user.getTrade_number());
            number= statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            JDBCutils.close(connection);
        }
        return number;

    }

    @Override
    public int deleteUser(User user) {
        Connection conn = JDBCutils.getConnectino();
        int i = 0;
        String sql = String.format("delete from USER where username= '%s';",user.getUsername());
        PreparedStatement pstmt;
        try {
            pstmt = (PreparedStatement) conn.prepareStatement(sql);
            i = pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCutils.close(conn);
        }
        return i;
    }
}
