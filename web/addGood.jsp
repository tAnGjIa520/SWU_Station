<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ADDGood</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <base href="http://localhost:8080/SWU_Station/">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

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
<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
    <p>本产品专利归计信院唐嘉吴朝旭田浩所有</p>
</div>
</body>
</html>