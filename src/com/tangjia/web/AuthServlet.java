package com.tangjia.web;

import javax.imageio.ImageIO;
import javax.lang.model.element.TypeParameterElement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.security.PublicKey;
import java.util.*;

public class AuthServlet extends HttpServlet {

    //private Object BufferedImage;
   // public final static String AUTH_SECRETE = "AUTH_SECRETE";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, Object> result = this.createImage();
       // HttpSession session = request.getSession(true);
        //session.setAttribute(AUTH_SECRETE,(String)result.get("secrete"));
       // System.out.println(result.get("secrete"));
        response.setContentType("image/jpeg");
        HttpSession session = request.getSession();
        session.setAttribute("code",result.get("code").toString());
        System.out.println(result.get("code").toString());

        ImageIO.write(
                (BufferedImage)result.get("image"),
                "jpeg",response.getOutputStream()
       );


        
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req,resp);
    }

    public Map<String, Object> createImage(){
        BufferedImage image = new BufferedImage(100, 30, BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        g.setColor(new Color(255, 255, 255));
        g.fillRect(0, 0, 100, 30);
        Random r = new Random();
        g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
        g.setFont(new Font("微软雅黑", Font.BOLD | Font.ITALIC, 24));
        String secrect = "";


        StringBuilder stringBuilder = new StringBuilder();

        for(int i=0;i<4;i++) {
        	secrect = getString(r, 1);
        	stringBuilder.append(secrect);
        	g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
            g.drawString(secrect, 1+i*18, 25);// 此处的1和25是左下角的坐标
        }



        for (int i = 0; i < 8; i++) {
            g.setColor(new Color(r.nextInt(255), r.nextInt(255), r.nextInt(255)));
            g.drawLine(r.nextInt(80), r.nextInt(30), r.nextInt(80), r.nextInt(30));

        }




        Map<String, Object> result = new HashMap<>();
        result.put("secrete",secrect);
        result.put("image", image);
        result.put("code",stringBuilder);
        return result;
    }

    private String getString(Random r, int size) {
        StringBuilder sb = new StringBuilder();
        String chars = "0123456789abcdefghijklmnpqrstuvwxyzABCDEFGHIJKLMNPQRSTUVWXYZ";

        sb.append(chars.charAt(r.nextInt(chars.length())));
        return sb.toString();
    }

}
