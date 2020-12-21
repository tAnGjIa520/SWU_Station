package com.tangjia.web;

import com.tangjia.pojo.User;
import com.tangjia.service.UserService;
import com.tangjia.service.impl.UserServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

public class IconServlet extends HttpServlet {

    private UserService userService=new UserServiceImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        //解析和检查请求，是否是post方式，是否是二进制流格式
        Boolean isMultipart= ServletFileUpload.isMultipartContent(req);
        if (!isMultipart) {
            return; //如果不是就不用上传了
        }
        try {
            //userIcon/default
            //创建FileItemFactory对象
            FileItemFactory factory=new DiskFileItemFactory();
            //创建文件上传的处理器
            ServletFileUpload upload=new ServletFileUpload(factory);
            //解析请求
            List<FileItem> items=upload.parseRequest(req);

            for (FileItem item : items) {
                String fieldName = item.getFieldName();
                if (item.isFormField()) {
                    String value = item.getString("utf-8");
                    System.out.println(fieldName + "->" + value);
                } else {
                    HttpSession session = req.getSession();
                    User user = (User) session.getAttribute("user");
                    int id = user.getId();

                    String fileName = id+"."+ FilenameUtils.getExtension(item.getName());
                    System.out.println(fileName);

                    String path =super.getServletContext().getRealPath("/userIcon");
                    System.out.println(path);
                    userService.updateIcon(id,fileName);
                    File file = new File(path + File.separatorChar + fileName);
                    System.out.println(file.getAbsolutePath());
                    item.write(file);
                }
            }

        }

        catch (Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("image/jpeg");
        String path =super.getServletContext().getRealPath("/userIcon");
        File file = new File(path);
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int id = user.getId();
        File[] f=file.listFiles();

        for(File i:f){
            String name = i.getName();

            if (name.startsWith(id+".")){
                OutputStream os = response.getOutputStream();
                FileInputStream fis=null;
                try
                {
                    fis = new FileInputStream(i);
                    int count = 0;
                    byte[] buffer = new byte[1024 * 1024];
                    while ((count = fis.read(buffer)) != -1)
                        os.write(buffer, 0, count);
                    os.flush();
                }
                catch (IOException e)
                {
                    e.printStackTrace();
                }
                finally
                {
                    if (os != null)
                        os.close();
                    if (fis != null)
                        fis.close();
                }


                return;
            }

        }

            String name = /*i.getName()*/"default.png";
            OutputStream os = response.getOutputStream();
            FileInputStream fis=null;
            try
            {
                String absolutePath = file.getAbsolutePath();
                fis = new FileInputStream(absolutePath + File.separatorChar+name);
                int count = 0;
                byte[] buffer = new byte[1024 * 1024];
                while ((count = fis.read(buffer)) != -1)
                    os.write(buffer, 0, count);
                os.flush();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
            finally
            {
                if (os != null)
                    os.close();
                if (fis != null)
                    fis.close();
            }


        }
}
