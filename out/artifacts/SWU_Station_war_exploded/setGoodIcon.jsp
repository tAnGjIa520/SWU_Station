
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>西大微店注册</title>
    <%@ include file="default/static/header.jsp"%>

</head>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>上传物品照片</h1>
    </header>
    <!--表单部分吴朝旭完成-->
    <form action="photoServlet" class="templatemo-login-form" method="post" enctype="multipart/form-data">
        <%  String goodId = request.getParameter("goodId");
            HttpSession session1 = request.getSession();
            session1.setAttribute("goodId",goodId);%>
<%--        ${requestScope.goodId}--%>
        <!--===用户名=============================-->
        <div class="form-group">
            <div class="input-group">

                <div class="input-group-addon">上传文件&nbsp&nbsp&nbsp&nbsp</div>
                <input type="file" class="form-control" name="icon" >
            </div>
        </div>
        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">上传</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<%@ include file="/default/static/footer.jsp"%>
</body>
</html>