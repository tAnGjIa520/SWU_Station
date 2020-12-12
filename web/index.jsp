<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">  
	    <title>登陆界面</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        
	    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
	    <link href="css/font-awesome.min.css" rel="stylesheet">
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/templatemo-style.css" rel="stylesheet">
	    <base href="http://localhost:8080/SWU_Station/">

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
		              <input type="text" class="form-control" name="username">
		          	</div>	
	        	</div>
	        	<!--================================-->
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="password" class="form-control" name="password" >
		          	</div>	
	        	</div>	        
	        	<!--======记住我==========================-->
	         <!-- 	<div class="form-group">
				    <div class="checkbox squaredTwo">
				        <input type="checkbox" id="c1" name="cc" />
						<label for="c1"><span></span>Remember me</label>
				    </div>
				</div>-->
					<!--================================-->
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
	</body>
</html>