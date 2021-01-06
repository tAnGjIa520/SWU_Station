package com.tangjia.Utils;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class MailUtils {

    public static int send(String mail,String subject,String string) {
        /*
        * 田浩 17:45:14
t1090439711@163.com

田浩 17:45:22
SBMMBSAHCMPDUOWC


        *
        * */
        HtmlEmail email = new HtmlEmail();//创建一个HtmlEmail实例对象
        email.setHostName("smtp.163.com");//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
        email.setCharset("utf-8");//设置发送的字符类型
        try {
            email.addTo(mail);//设置收件人
        } catch (EmailException e) {
            e.printStackTrace();
            return 0;
        }
        try {
            email.setFrom("t1090439711@163.com", "SWU_Station");//发送人的邮箱为自己的，用户名可以随便填
        } catch (EmailException e) {
            e.printStackTrace();
            return 0;
        }
        email.setAuthentication("t1090439711", "SBMMBSAHCMPDUOWC");//设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
        email.setSubject(subject);//设置发送主题
        try {
            email.setMsg(string);//设置发送内容
        } catch (EmailException e) {
            e.printStackTrace();
            return 0;
        }
        try {
            email.send();//进行发送
        } catch (EmailException e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
}

