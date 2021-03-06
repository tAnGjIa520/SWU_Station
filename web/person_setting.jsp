<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
      <title>${sessionScope.user.username}的设置</title>
      <%@ include file="default/static/header.jsp"%>
      <style type="text/css">
          span{color: red;font-size: 12px; display: none;}
          .classA{position: relative; left: 40px;}
      </style>

  </head>
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>${sessionScope.user.username}的设置</h1>
        </header>
          <%@include file="default/static/icon.jsp"%>
          <%@include file="default/static/search_bar.jsp"%>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
          <ul>

            <li><a href="message?action=messageList"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
              <li><a href="orderItemServlet?action=showOrderForSaler"><i class="fa fa-map-marker fa-fw"></i>出售记录</a></li>
              <li><a href="orderItemServlet?action=showOrderForUser"><i class="fa fa-map-marker fa-fw"></i>购买记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp" class="active"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
              <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">


          <%@include file="default/static/shop_bar.jsp"%>

        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">个人设置</h2>
<!--            <p>完善您的个人信息！！！</p>-->
<!--            //design point:如果发现有人的信息没有填好的那么就显示请完善您的个人信息-->
            <form action="userServlet" class="templatemo-login-form" method="post">
                <input type="hidden" name="action" value="set">

<!--              用户名-->
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">Username</label>
                    <input type="text" class="form-control" id="inputUsername" placeholder="${sessionScope.user.username}"
                           name="newusername">
                    <span class="classA" id="tipUser">用户名必须为8-12为字母或数字</span>
                </div>
<!--                邮箱-->
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="${sessionScope.user.email}"
                           name="newemail">
                    <span class="classA" id="tipinputEmail">请输入正确的邮箱格式</span>
                </div>

              </div>
<!--              个人密码  -->
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputCurrentPassword">Current Password</label>
                    <input type="password" class="form-control highlight" id="inputCurrentPassword" disabled="true" placeholder="${sessionScope.user.password}">
                </div>
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">New Password</label>
                    <input type="password" name="newpassword" class="form-control" id="inputNewPassword">
                    <span class="classA" id="tipNewPassword">新密码必须为8-12为字母或数字</span>
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Confirm New Password</label>
                    <input type="password" class="form-control" id="inputConfirmNewPassword">
                    <span class="classA" id="tipConfirmNewPassword">与输入的新密码不一致</span>
                </div>
              </div>



              <div class="form-group text-right">
                <button type="submit" class="templatemo-blue-button">确认更改</button>
                <button type="reset" class="templatemo-white-button">重置</button>
              </div>
            </form>

              <a href="setIcon.jsp"><button class="templatemo-blue-button">更改头像</button></a>
          </div>
            <%@ include file="/default/static/footer.jsp"%>
        </div>
      </div>
    </div>

  </body>

<script type="text/javascript">
    var iptUser=document.getElementById('inputUsername');
    var iptNewPassword=document.getElementById('inputNewPassword');
    var iptinputEmail=document.getElementById('inputEmail');
    var iptConfirmNewPassword=document.getElementById('inputConfirmNewPassword');

    var tipUser=document.getElementById('tipUser');
    var tipNewPassword=document.getElementById('tipNewPassword');
    var tipinputEmail=document.getElementById('tipinputEmail');
    var tipConfirmNewPassword=document.getElementById('tipConfirmNewPassword');

    $("#inputUsername").blur(function () {
        User();
    })


    $("#inputNewPassword").blur(function () {
        NewPassword();
    })

    $("#inputEmail").blur(function () {
        valMailbox();
    })

    $("#inputConfirmNewPassword").blur(function () {
        Confirm_NewPassword();
    })

    function User(){
        var  r=/^\w\w{7,11}$/;
        var  p=r.test(iptUser.value);
        if (!p){
            tipUser.style.display = 'inline-block';
            tipUser.focus();
            return false;
        }
        else{
            tipUser.style.display = 'none';
            tipUser.focus();
            return true;
        }
    }


    function NewPassword(){
        var  r=/^\w\w{7,11}$/;
        var  p=r.test(iptNewPassword.value);
        if (!p){
            tipNewPassword.style.display = 'inline-block';
            tipNewPassword.focus();
            return false;
        }
        else{
            tipNewPassword.style.display = 'none';
            tipNewPassword.focus();
            return true;
        }
    }

    function valMailbox(){
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        var r=reg.test(iptinputEmail.value);
        if(!r){
            tipinputEmail.style.display='inline-block';
            tipinputEmail.focus();
            return false;
        }
        else{
            tipinputEmail.style.display='none';
            return true;
        }
    }

    function Confirm_NewPassword() {
        if ($("#inputNewPassword").val() == $("#inputConfirmNewPassword").val()) {
            tipConfirmNewPassword.style.display = 'none';
            tipConfirmNewPassword.focus();
            return true;
        } else {
            tipConfirmNewPassword.style.display = 'inline-block';
            tipConfirmNewPassword.focus();
            return false;
        }
    }
</script>
</html>
