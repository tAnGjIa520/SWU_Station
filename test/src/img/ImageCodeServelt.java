package img;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ImageCodeServelt extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String vericode= CreateVerificationCode.getSecurityCode();
        HttpSession session=req.getSession();
        session.setAttribute("verityCode",vericode);
        //���÷��ص�����
        resp.setContentType("img/jpeg");
        //�������������Ӧ����--��֤��ͼƬ����һ�ξ�Ҫˢ��һ�Σ����Բ����л������
        resp.setHeader("Pragma","No-cache");
        resp.setHeader("Cache-Control","no-cache");
        //������֤��ʧЧʱ��
        resp.setDateHeader("Expires",0);
        //���ֽ�������ȥ������img��src����ȥ��������
        ImageIO.write(new CreateVerificationCodeImage(vericode).createImage(),"JPEG",resp.getOutputStream());
    }
}