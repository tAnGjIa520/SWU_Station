package com.tangjia.test;

import com.tangjia.Utils.MailUtils;
import org.junit.Test;

import static org.junit.Assert.*;

public class MailUtilsTest {

    @Test
    public void send() {
        MailUtils.send("1157507000@qq.com","验证","你好田浩，我是唐嘉");
    }
}