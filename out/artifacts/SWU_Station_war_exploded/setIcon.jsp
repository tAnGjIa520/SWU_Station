
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
        <h1>上传头像</h1>
    </header>
    <!--表单部分吴朝旭完成-->
    <form action="iconServlet" class="templatemo-login-form" method="post" enctype="multipart/form-data">
        <!--===用户名=============================-->
        <div class="form-group">
            <div class="input-group">
<!--                <div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>-->
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
</html>