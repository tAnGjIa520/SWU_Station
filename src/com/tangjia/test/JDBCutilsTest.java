package com.tangjia.test;

import com.tangjia.Utils.JDBCutils;
import org.junit.Test;

import static org.junit.Assert.*;

public class JDBCutilsTest {

    @Test
    public void getConnectino() {
        System.out.println(JDBCutils.getConnectino());
    }

    @Test
    public void close() {
    }
}