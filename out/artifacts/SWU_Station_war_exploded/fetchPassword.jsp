<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
	<head>
		<title>登陆界面</title>
		<%@ include file="default/static/header.jsp"%>
	<style type="text/css">
		span{color: red;font-size: 12px; display: none;}
		.classA{position: relative; left: 60px;}
	</style>
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
					<span id="tip-name" class="classA">用户名必须为8-12为字母或数字！</span>
	        	</div>
	        	<!--================================-->
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input type="text"placeholder="注册邮箱" class="form-control" id="mail" >
		          	</div>
					<span id="tip-Mailbox" class="classA">邮箱格式不正确！</span>
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
		</div>
		<%@ include file="/default/static/footer.jsp"%>
	</body>
<script type="text/javascript">
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

	var iptName=document.getElementById('username');
	var iptMailbox=document.getElementById('mail');
	var tipName=document.getElementById('tip-name');
	var tipMailbox=document.getElementById('tip-Mailbox');

	$("#username").blur(function () {
		valUserName();
		/* $("#isSuccess").css("display","inline");*/
		/*        alert($("#txt-name").val());*/
		$.get(
				"userServlet",
				{
					action:"isExist",
					username:$("#txt-name").val()
				}
				,function (data) {
					if(data=="1"){
						$("#isSuccess").css("display","inline");
						$("#isSuccess2").css("display","none");
					}else{
						$("#isSuccess").css("display","none");
						$("#isSuccess2").css("display","inline");
					}
				}
				,"text"

		)
	})


	$("#mail").blur(function () {
		valMailbox();
	})

	function valUserName() {
		var p=/^\w\w{7,11}$/;//用户名必须为8-12为字母或数字
		var r=p.test(iptName.value);//校验
		if(!r){
			//校验不通过
			tipName.style.display='inline-block';//显示
			iptName.focus();
			return false;
		}
		else{
			tipName.style.display='none';
			return true;
		}
	}

	function valMailbox(){
		var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
		var r=reg.test(iptMailbox.value);
		if(!r){
			tipMailbox.style.display='inline-block';
			iptMailbox.focus();
			return false;
		}
		else{
			tipMailbox.style.display='none';
			return true;
		}
	}

</script>
</html>