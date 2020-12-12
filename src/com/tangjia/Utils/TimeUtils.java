package com.tangjia.Utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtils {
    public static String getCurrentTime(){
        SimpleDateFormat df = new SimpleDateFormat("yyyy:MM:dd:HH:mm:ss");//设置日期格式
        String format = df.format(new Date());
        System.out.println(format);// new Date()为获取当前系统时间
        return format;
    }

}
