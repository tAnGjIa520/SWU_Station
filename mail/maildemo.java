package mail;




import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;



/**

 * ����һ��ֻ�����ı��ļ��ʼ�

*/

public class maildemo extends HttpServlet {
  /*  public static void main(String[] args)*/ {
	  
	  
        HtmlEmail email=new HtmlEmail();//����һ��HtmlEmailʵ������
        email.setHostName("smtp.163.com");//�����SMTP��������һ��123�������smtp.123.com,qq����Ϊsmtp.qq.com
        email.setCharset("utf-8");//���÷��͵��ַ�����
        try {
            email.addTo("1090439711@qq.com");//�����ռ���
        } catch (EmailException e) {
            e.printStackTrace();
        }
        try {
            email.setFrom("t1090439711@163.com","th");//�����˵�����Ϊ�Լ��ģ��û������������
        } catch (EmailException e) {
            e.printStackTrace();
        }
        email.setAuthentication("t1090439711","SBMMBSAHCMPDUOWC");//���÷����˵���������û�������Ȩ��(��Ȩ�����Լ����õ�)
        email.setSubject("����");//���÷�������
        try {
            email.setMsg("��д��ķ�������");//���÷�������
        } catch (EmailException e) {
            e.printStackTrace();
        }
        try {
            email.send();//���з���
        } catch (EmailException e) {
            e.printStackTrace();
        }
    }
}
