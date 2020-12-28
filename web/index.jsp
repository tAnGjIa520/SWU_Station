<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
	<head>
		<title>登陆界面</title>
		<%@ include file="default/static/header.jsp"%>
	<script type="text/javascript">
		$(function () {
			$("#codeimg").click(function () {
				this.src="authServlet?apple="+new Date();
			})
		})


	</script>
	</head>
	<body class="light-gray-bg">
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
	          <div class="square"></div>
	          <h1>欢迎来到西大微店</h1>
	        </header>
	        <!--表单部分吴朝旭完成-->
	        <form action="userServlet" class="templatemo-login-form" method="post">
				<input type="hidden" name="action" value="login">
				<!--			用户名-->
				<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>	        		
		              <input type="text" class="form-control" placeholder="用户名" name="username">
		          	</div>	
	        	</div>
	        	<!--================================-->
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="password"placeholder="密码" class="form-control" name="password" >
		          	</div>	
	        	</div>
				<br>
				<div class="form-group">
					<button type="submit" class="templatemo-blue-button width-100">Login</button>
				</div>
	        </form>
	        <!--表单部分结束-->
		</div>
		<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
			<p>还没有账号？？？ ！！！<strong><a href="register.jsp" class="blue-text">不妨注册一个</a></strong></p>
		</div>
		<%@ include file="/default/static/footer.jsp"%>
	</body>
</html>