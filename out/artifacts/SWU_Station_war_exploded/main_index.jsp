<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的主页</title>
    <%@ include file="default/static/header.jsp"%>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
<!--      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
<%--    <![endif]-->--%>

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>您好！${sessionScope.user.username}</h1>
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
            <li><a href="main_index.jsp" class="active"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="tradehistory.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-top-nav-container">
          <div class="row">
            <nav class="templatemo-top-nav col-lg-12 col-md-12">
              <ul class="text-uppercase">
                <li><a href="shop_index.jsp" style="text-align: center" class="active">商店</a></li>

              </ul>
            </nav>
          </div>
        </div>
        <div class="templatemo-content-container">

        </div> <!-- Second row ends -->
        <div class="templatemo-flex-row flex-content-row">
          <div class="templatemo-content-widget white-bg col-2">
            <i class="fa fa-times"></i>
            <div class="square"></div>
            <h2 class="templatemo-inline-block">Visual Admin Template</h2><hr>
          </div>
          <div class="templatemo-content-widget white-bg col-1 text-center">
            <i class="fa fa-times"></i>
            <h2 class="text-uppercase">Maris</h2>
            <h3 class="text-uppercase margin-bottom-10">Design Project</h3>
            <img src="images/bicycle.jpg" alt="Bicycle" class="img-circle img-thumbnail">
          </div>
          <div class="templatemo-content-widget white-bg col-1">
            <i class="fa fa-times"></i>
            <h2 class="text-uppercase">Dictum</h2>
            <h3 class="text-uppercase">Sedvel Erat Non</h3><hr>
            <div class="progress">
              <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
            </div>
            <div class="progress">
              <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 50%;"></div>
            </div>
            <div class="progress">
              <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
            </div>
          </div>
        </div>

        <div class="copyrights">Collect from <a href="https://yihaowangluo.taobao.com/" >手机天字一号网络</a></div>
          <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
            <div class="col-1 templatemo-overflow-hidden">
              <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="templatemo-flex-row flex-content-row">

                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center">Modular<span class="badge">new</span></h2>
                    <div id="pie_chart_div" class="templatemo-chart"></div> <!-- Pie chart div -->
                  </div>

                  <div class="col-1 col-lg-6 col-md-12">
                    <h2 class="text-center">Interactive<span class="badge">new</span></h2>
                    <div id="bar_chart_div" class="templatemo-chart"></div> <!-- Bar chart div -->
                  </div>

                </div>
              </div>
            </div>
          </div>
        <%@ include file="/default/static/footer.jsp"%>

        </div>
      </div>
    </div>


  </body>
</html>