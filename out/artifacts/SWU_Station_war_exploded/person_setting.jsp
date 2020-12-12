<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>${sessionScope.user.username}的设置</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <base href="http://localhost:8080/SWU_Station/">
    
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>${sessionScope.user.username}的设置</h1>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
          <div class="profile-photo-overlay"></div>
        </div>
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li><a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.html"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="myGoods.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="#"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp" class="active"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>退出系统</a></li></ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="" class="active">商城</a></li>
                <li><a href="">商城</a></li>
                <li><a href="">商城</a></li>
                <li><a href="index.jsp">商城</a></li>
              </ul>
            </nav>
          </div>
        </div>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">个人设置</h2>
<!--            <p>完善您的个人信息！！！</p>-->
<!--            //design point:如果发现有人的信息没有填好的那么就显示请完善您的个人信息-->
            <form action="UserServlet" class="templatemo-login-form" method="post">
                <input type="hidden" name="action" value="set">
           <%--   <div class="row form-group">
              <!--  <div class="col-lg-6 col-md-6 form-group">
                    <label for="inputFirstName">First Name</label>
                    <input type="text" class="form-control" id="inputFirstName" placeholder="默认的username">
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputLastName">Last Name</label>
                    <input type="text" class="form-control" id="inputLastName" placeholder="Smith">                  
                </div> -->
              </div>--%>

<!--              用户名-->
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputUsername">Username</label>
                    <input type="text" class="form-control" id="inputUsername" placeholder="${sessionScope.user.username}" name="newusername">
                </div>
<!--                邮箱-->
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputEmail">Email</label>
                    <input type="email" class="form-control" id="inputEmail" placeholder="${sessionScope.user.email}" name="newemail">
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
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Confirm New Password</label>
                    <input type="password" class="form-control" id="inputConfirmNewPassword">
                </div> 
              </div>



              <div class="form-group text-right">
                <button type="submit" class="templatemo-blue-button">确认更改</button>
                <button type="reset" class="templatemo-white-button">重置</button>
              </div>
            </form>
          </div>
          <footer class="text-right">
            <p>Copyright &copy; 唐嘉田浩吴朝旭
          </footer>
        </div>
      </div>
    </div>

    <!-- JS -->
   <!-- <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        &lt;!&ndash; jQuery &ndash;&gt;
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>  &lt;!&ndash; http://markusslima.github.io/bootstrap-filestyle/ &ndash;&gt;
    <script type="text/javascript" src="js/templatemo-script.js"></script>  -->       <!--Templatemo Script -->
  </body>
</html>
