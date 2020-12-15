package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import img.CreateVerificationCode;
import img.CreateVerificationCode.SecurityCodeLevel;

public class TestServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	 resp.setContentType("text/html;charset=UTF-8");

         PrintWriter out = resp.getWriter();
  
         String res = CreateVerificationCode.getSecurityCode(10, SecurityCodeLevel.Simple, true);
         
         String docType = "<!DOCTYPE html> \n";
         out.println(docType + "<html><head></head>"
         		+ ""
         		+ "<body>"
         		+ res
         		+ "<body></html>");
     
    	
    	
    }
    
}

