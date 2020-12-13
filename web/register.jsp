
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
        <h1>注册</h1>
    </header>
    <!--表单部分吴朝旭完成-->
    <form action="userServlet" class="templatemo-login-form" method="post">
        <input type="hidden" name="action" value="register">
        <input type="hidden" name="trade_number" value="0">
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

        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">验证码&nbsp&nbsp&nbsp</div>
                <!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <input type="text" class="form-control" name="code">
            </div>
        </div>
        <div class="form-group">
            <div class="input-group" style="text-align: center;">
                <img src="code.jpg" >
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
            ${empty requestScope.codeerror? "" :"验证码错误了！亲！"}
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">register</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<%@ include file="/default/static/footer.jsp"%>
</body>
</html>