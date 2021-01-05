package mail;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

public class MailServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


			HtmlEmail email=new HtmlEmail();//创建一个HtmlEmail实例对象
	        email.setHostName("smtp.163.com");//邮箱的SMTP服务器，一般123邮箱的是smtp.123.com,qq邮箱为smtp.qq.com
	        email.setCharset("utf-8");//设置发送的字符类型
	        try {
	            email.addTo("1090439711@qq.com");//设置收件人
	        } catch (EmailException e) {
	            e.printStackTrace();
	        }
	        try {
	            email.setFrom("t1090439711@163.com","th");//发送人的邮箱为自己的，用户名可以随便填
	        } catch (EmailException e) {
	            e.printStackTrace();
	        }
	        email.setAuthentication("t1090439711","SBMMBSAHCMPDUOWC");//设置发送人到的邮箱和用户名和授权码(授权码是自己设置的)
	        email.setSubject("测试");//设置发送主题
	        try {
	            email.setMsg("填写你的发送内容");//设置发送内容
	        } catch (EmailException e) {
	            e.printStackTrace();
	        }
	        try {
	            email.send();//进行发送
	        } catch (EmailException e) {
	            e.printStackTrace();
	        }
		resp.sendRedirect("/test/success.html");
	}
	
}
