package com.tangjia.dao.impl;

import  com.tangjia.Utils.JDBCutils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;


import javax.management.Query;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Handler;

public abstract class BaseDao {
    private  QueryRunner queryRunner=new QueryRunner();

    //改变


    public int update(String sql,Object...args){
        Connection connection= JDBCutils.getConnectino();
        try {
            return queryRunner.update(connection,sql,args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            JDBCutils.close(connection);
        }
        return  -1;
    }


    /**
     * 查询返回一条  javabean的sql语句
     * @param type 返回的对象类型
     * @param sql   执行的sql语句
     * @param args  sql对应的参数值
     * @param <T>   返回的类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type,String sql,Object...args){
        Connection connectino = JDBCutils.getConnectino();
        try {
            return queryRunner.query(connectino,sql,new BeanHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCutils.close(connectino);
        }
        return  null;
    }

    /**
     * 返回一个list对象
     * @param type
     * @param sql
     * @param args
     * @param <T>
     * @return
     */
    public <T> List <T> queryForList(Class<T> type, String sql, Object...args){
        Connection connectino = JDBCutils.getConnectino();
        try {
            return queryRunner.query(connectino,sql,new BeanListHandler<T>(type),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            JDBCutils.close(connectino);
        }
        return  null;
    }

    /**
     * 返回一行一列的sql语句
     * @param sql   sql语句
     * @param args  对应的参数值
     * @return
     */
    public Object queryForSingleValue(String sql,Object...args){
        Connection connection=JDBCutils.getConnectino();
        try {
            return queryRunner.query(connection,sql, new ScalarHandler(),args);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return  null;
    }


}
