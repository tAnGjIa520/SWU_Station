package img;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
   
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf8");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String vericode=req.getParameter("vericode");
        String generatedCode= (String) req.getSession().getAttribute("verityCode");
        if (name.equals("bob")&&password.equals("123")&&vericode.toLowerCase().equals(generatedCode.toLowerCase())){
            resp.getWriter().write("µÇÂ¼³É¹¦");
        }else {resp.getWriter().write("µÇÂ¼Ê§°Ü");}
    }
}