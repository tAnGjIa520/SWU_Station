package main.com.vae.Upload;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;



public class UploadServlet extends HttpServlet {
 
	  @Override
	    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        req.setCharacterEncoding("utf-8");
	        String headimg=req.getParameter("headimg");
	        System.out.println(123);
	        System.out.println("111" + headimg);
	        //解析和检查请求，是否是post方式，是否是二进制流格式
	        Boolean isMultipart=ServletFileUpload.isMultipartContent(req);
	        if (!isMultipart) {
	            return; //如果不是就不用上传了
	        }
	 
	        try {
	 
	            //创建FileItemFactory对象
	            FileItemFactory factory=new DiskFileItemFactory();
	            //创建文件上传的处理器
	            ServletFileUpload upload=new ServletFileUpload(factory);
	            //解析请求
	            List<FileItem> items=upload.parseRequest(req);
	            for (FileItem item : items) {
	                String fileName = item.getFieldName();
	                if (item.isFormField()) {
	                    String value = item.getString("utf-8");
	                    System.out.println(fileName + "->" + value);
	                } else {
	                	String RandomName = UUID.randomUUID().toString()+"."+FilenameUtils.getExtension(item.getName());
	                    System.out.println(fileName + "->" + item.getName()); //一个的标签的name，一个是文件的name
	                    String path =super.getServletContext().getRealPath("/WEB-INF");
	                    System.out.println(path);
	                    item.write(new File(path, RandomName)); //把上传的文件保存到某个文件中
	                }
	            }
	 
	            }
	 
	            catch (Exception e){
	            e.printStackTrace();
	        }
	 
	 
	    }
}