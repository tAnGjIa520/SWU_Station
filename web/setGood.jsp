<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html lang="en">
<head>
    <title>SETGood</title>
    <%@ include file="default/static/header.jsp"%>
</head>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>修改商品</h1>
    </header>

    <form action="goodServlet?" class="templatemo-login-form" method="get">
        <input type="hidden" name="action" value="updateGood">
        <input type="hidden" name="goodid" value="${requestScope.good.id}">
        <!--===商品名字=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">商品名&nbsp</div>

                <input type="text" class="form-control" name="goodname" placeholder="${requestScope.good.goodname}">
            </div>
        </div>
        <!--===价格=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">价格&nbsp&nbsp&nbsp&nbsp</div>

                <input type="text" class="form-control" name="price" placeholder="${requestScope.good.price}">
            </div>
        </div>
        <!--===描述=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">描述&nbsp&nbsp&nbsp&nbsp</div>
                <input type="text" class="form-control" name="description" placeholder="${requestScope.good.description}">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">确认修改</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<%@ include file="/default/static/footer.jsp"%>
</body>
</html>