
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>

    <title>西大微店注册</title>
    <style type="text/css">
        span{color: red;font-size: 12px;display: none; }
        .classA{position: relative; left: 83px;}
        /*display: none;*/
    </style>
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
                <input type="text" class="form-control" name="username" id="txt-name">
            </div>
            <span id="tip-name" class="classA">用户名必须为8-12为字母或数字</span>
        </div>
        <!--===密码=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <div class="input-group-addon">密码&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                <input type="password" class="form-control" name="password" id="pwd">
            </div>
            <span id="tip-pwd" class="classA">密码必须为8-12为字母或数字</span>
        </div>
        <!--===确认密码=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <div class="input-group-addon">确认密码</div>
                <input type="password" class="form-control" id="pwd2">
            </div>
            <span id="tip-pwd2" class="classA">密码不一致！</span>
        </div>
        <!--===邮箱=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">邮箱&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
<!--                <div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>-->
                <input type="text" class="form-control" name="email" id="email">
            </div>
            <span id="tip-Mailbox" class="classA">邮箱格式不正确！</span>
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
                <img src="code.jpg" id="codeimg">
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
            <button type="submit" class="templatemo-blue-button width-100" <%--disabled="disabled"--%>>register</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>


<%@ include file="/default/static/footer.jsp"%>
</body>


<script type="text/javascript">


   /* var codeimg = document.getElementById(codeimg);
    codeimg.onclick=function () {
        window.alert("nihao");
    }*/
     $(function(){



         $("#codeimg").click(function () {
     /*        alert("刷新验证码");*/
             this.src="code.jpg?d="+new Date();
         });

     });



</script>

<%@include file="default/static/regester_auth.jsp"%>
</html>