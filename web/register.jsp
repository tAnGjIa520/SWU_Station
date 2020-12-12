
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>西大微店注册</title>
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
        <h1>注册</h1>
    </header>
    <!--表单部分吴朝旭完成-->
    <form action="userServlet" class="templatemo-login-form" method="post">
        <input type="hidden" name="action" value="login">
        <!--===用户名=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>-->
                <div class="input-group-addon">用户名&nbsp&nbsp&nbsp&nbsp</div>

                <input type="text" class="form-control" name="username">
            </div>
        </div>
        <!--===密码=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <div class="input-group-addon">密码&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                <input type="password" class="form-control" name="password" >
            </div>
        </div>
        <!--===确认密码=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <div class="input-group-addon">确认密码</div>
                <input type="password" class="form-control" >
            </div>
        </div>
        <!--===邮箱=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">邮箱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <input type="text" class="form-control" name="email">
            </div>
        </div>

        <!--================================-->
        <!--<div class="form-group">
            <div class="checkbox squaredTwo">
                <input type="checkbox" id="c1" name="cc" />
                <label for="c1"><span></span>Remember me</label>
            </div>
        </div>-->
        <!--================================-->
        <div class="form-group">
            ${empty requestScope.losetime?"" :"已经存在这个用户"}
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">register</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
    <p>本产品专利归计信院唐嘉吴朝旭田浩所有</p>
</div>
</body>
</html>