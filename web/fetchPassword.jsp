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
	          <h1>找回密码</h1>
	        </header>
	        <!--表单部分吴朝旭完成-->
	        <form <%--action="userServlet" class="templatemo-login-form" method="post"--%>>
				<input type="hidden" name="action" value="login">
				<!--			用户名-->
				<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>	        		
		              <input type="text" class="form-control" placeholder="用户名" id="username">
		          	</div>	
	        	</div>
	        	<!--================================-->
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="password"placeholder="注册邮箱" class="form-control" id="mail" >
		          	</div>	
	        	</div>
				<br>
				<div class="form-group">
					<button  type="submit" class="templatemo-blue-button width-100"  id="fetch" onclick="timer()">找回密码</button>
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
<script>
	var TIME=60;
	var time = 60;
	//倒计时
	function getRandomCode() {
		
		if (time === 0) {
			time = TIME;
			$("#fetch").attr("disabled",false);
			$("#fetch").text("找回密码");

			return;
		} else {

			time--;
			$("#fetch").text(time);

			//alert现在的时间
		}
		setTimeout(function() {
			getRandomCode();
		},1000);
	}

	function timer() {
	/*	alert($("#username").val());
				alert($("#mail").val());*/
		$.get(
				"userServlet",
				{action:"fetchPassword",
					username:$("#username").val(),
					email:$("#mail").val()
				},
				function (result) {
					if (result="1"){
						alert("您的密码已经成功发送到您的邮箱");
					}
				},"text"
		)

		$("#fetch").attr("disabled",true);


		getRandomCode();

	}



</script>
</html>