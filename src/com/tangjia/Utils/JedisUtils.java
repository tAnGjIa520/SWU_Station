package com.tangjia.Utils;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JedisUtils {
    private  static JedisPool jedisPool;
    //默认配置连接池
    static {
        Properties properties=new Properties();

        try {
            properties.load(JDBCutils.class.getClassLoader().getResourceAsStream("jedis.properties"));
            System.out.println(new File(properties.getProperty("host")));
            JedisPoolConfig jedisPoolConfig=new JedisPoolConfig();
            jedisPoolConfig.setMaxTotal(Integer.parseInt(properties.getProperty("maxTotal")));
            jedisPoolConfig.setMaxIdle(Integer.parseInt(properties.getProperty("maxIdle")));
            System.out.println(properties.getProperty("maxTotal"));
            //从读取的文件中配置数据库连接池
            jedisPool=new JedisPool(jedisPoolConfig,properties.getProperty("host"),Integer.parseInt(properties.getProperty("port")));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static  Jedis getConnection(){
        Jedis resource = jedisPool.getResource();
        return resource;
    }

    /**
     *关闭一个连接
     * @param jedis
     */
    public  static void close(Jedis jedis){
        jedis.close();
    }
}
