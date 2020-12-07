package com.tangjia.Utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCutils {
    private  static DruidDataSource dataSource;
    //默认配置连接池
    static {
        Properties properties=new Properties();

        try {
            properties.load(JDBCutils.class.getClassLoader().getResourceAsStream("druid.properties"));
            System.out.println(new File("druid.properties"));
            //这里采用的是阿里巴巴的德鲁伊
            //读取属性配置文件
            dataSource= (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
            //从读取的文件中配置数据库连接池
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     *
     * @return 一个连接
     */
    public static Connection getConnectino(){
        Connection connection=null;

        try {
            connection=dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("success");
        return connection;
    }

    /**
     *关闭一个连接
     * @param connection
     */
    public  static void close(Connection connection){
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}