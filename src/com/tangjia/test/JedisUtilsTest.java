package com.tangjia.test;

import com.google.gson.Gson;
import com.tangjia.Utils.JedisUtils;
import com.tangjia.pojo.Message;
import org.junit.Test;
import redis.clients.jedis.Jedis;

import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import static org.junit.Assert.*;

public class JedisUtilsTest {

    @Test
    public void getConnectino() {
        Jedis connection = JedisUtils.getConnection();
    }


    @Test
    public void test() {


    }
    /*

    * */
}