package com.tangjia.Utils;

import java.util.HashMap;

public class MessageUtil {
	public static HashMap<String,String> getMessage(String msg) {
		//数据处理工具类
		HashMap<String,String> map = new HashMap<String,String>();
//		String msgString  = msg.toString();
	String m[] = msg.split(",");
		map.put("fromName", m[0]);
		System.out.println(m[0]);
		map.put("toName", m[1]);
		System.out.println(m[1]);
		map.put("content", m[2]);
		System.out.println(m[2]);
		return map;
}
}
