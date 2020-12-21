package com.tangjia.test;

import com.tangjia.Utils.TokenizerUtils;

import org.junit.Test;

import javax.xml.transform.Result;

import java.util.Iterator;
import java.util.Set;

import static org.junit.Assert.*;

public class TokenizerUtilsTest {

    @Test
    public void keySet() {
        Set<String> set = TokenizerUtils.keySet("你好我叫唐嘉");
        for (String s:set){
            System.out.println(s);
        }
    }
}