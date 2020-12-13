<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html lang="en">
<head>
    <title>ADDGood</title>
    <%@ include file="default/static/header.jsp"%>

</head>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>添加商品</h1>
    </header>

    <form action="goodServlet?action=addGood" class="templatemo-login-form" method="post">
        <input type="hidden" name="action" value="addGood">
        <!--===商品名字=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">商品名&nbsp</div>

                <input type="text" class="form-control" name="goodname">
            </div>
        </div>
        <!--===价格=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">价格&nbsp&nbsp&nbsp&nbsp</div>

                <input type="text" class="form-control" name="price">
            </div>
        </div>
        <!--===描述=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">描述&nbsp&nbsp&nbsp&nbsp</div>
                <input type="text" class="form-control" name="description">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">增加商品</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<%@ include file="/default/static/footer.jsp"%>
</body>
</html>