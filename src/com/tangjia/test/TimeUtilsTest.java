package com.tangjia.test;

import com.tangjia.Utils.TimeUtils;
import org.junit.Test;

import java.sql.Time;

import static org.junit.Assert.*;

public class TimeUtilsTest {

    @Test
    public void getCurrentTime() {
        TimeUtils.getCurrentTime();
    }
}