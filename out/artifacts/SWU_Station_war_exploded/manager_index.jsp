<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
	<head>
		<title>登陆界面</title>
		<%@ include file="default/static/header.jsp"%>
	<script type="text/javascript">
	</script>
	</head>
	<body class="light-gray-bg">
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
	          <div class="square"></div>
	          <h1>管理员界面</h1>
	        </header>

	        <form action="rootServlet" class="templatemo-login-form" method="post">
				<input type="hidden" name="action" value="login">
				<!--用户名-->
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
				<br>
				<div class="form-group">
					<button type="submit" class="templatemo-blue-button width-100">Login</button>
				</div>
	        </form>
	        <!--表单部分结束-->
		</div>
		<%--<div class="templatemo-content-widget templatemo-login-widget templatemo-register-widget white-bg">
			<p><strong><a href="manager/register.jsp" class="blue-text">申请成为管理员！</a></strong></p>
		</div>--%>

		<%@ include file="/default/static/footer.jsp"%>
	</body>
</html>