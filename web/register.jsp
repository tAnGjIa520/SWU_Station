
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

             <label style="color: red;display: none" id="isSuccess">已存在这个用户</label>
              <label style="color: red;display: none" id="isSuccess2">用户名可用</label>
        <div class="form-group">
            ${empty requestScope.codeerror? "" :"验证码错误了！亲！"}
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100" <%--disabled="disabled"--%>>register</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
    <p><strong><a class="blue-text" href="">返回主页</a></strong></p>
    <%-- href="" --%>
</div>

<%@ include file="/default/static/footer.jsp"%>
</body>


<script type="text/javascript">


     $(function(){

         $("#codeimg").click(function () {
     /*        alert("刷新验证码");*/
             this.src="code.jpg?d="+new Date();
         });

     });



</script>

<%@include file="default/static/regester_auth.jsp"%>
</html>