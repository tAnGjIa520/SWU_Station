<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>${sessionScope.user.username}的商品</title>
    <meta name="description" content="">
<!--    <meta name="author" content="templatemo">-->

    <meta name="author" content="唐嘉">

    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="jqvmap/jqvmap.css" media="screen" rel="stylesheet" type="text/css" /> 
    <link href="css/templatemo-style.css" rel="stylesheet">
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--    &lt;!&ndash;[if lt IE 9]>-->z
<!--      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>-->
<!--      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>-->
<!--    <![endif]&ndash;&gt;-->

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>Visual Admin</h1>
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
          <ul><li><a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.html"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="myGoods.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="#" class="active"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">

        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg" style="height: 80px">
            <div style="float: left;"><h2 class="margin-bottom-10">商品列表</h2></div>

              <div class="row" style="float: right">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                      <ul class="text-uppercase">

                    <li><a href="addGood.jsp" class="active">我要增加商品</a></li>
                   <%-- <li><a href="">商城</a></li>
                    <li><a href="index.jsp">商城</a></li>--%>
                  </ul>
                </nav>
              </div>
            <%--每一栏的具体内容--%>

            <%--        循环体   =================================--%>

          </div>



           <c:forEach var="good" items="${requestScope.Goods}">


            <div class="templatemo-flex-row flex-content-row">

            <div class="col-1">              
              <div class="panel panel-default margin-10" style="height:500px;">
                <div class="panel-heading"><h2>商品<1></h2></div>
                  <div class="panel-body">
                    <div id="vmap_africa" class="vmap">
                        <table width="1100px" height="250px" border="1" style="border: none;">
                          <tr>
                            <td rowspan="3" height="250px" width="150px">
                              图片
                            </td>
                            <td width="35%" height="50px">
  <%--=================================商品id==========================================--%>
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label  >商品id</label>
                                  <input type="text" disabled="disabled" class="form-control" disabled="disabled  "  placeholder="${good.id}" name="id">
                                </div>
                              </div>
    <%--=================================商品名==========================================--%>

                            </td>
                            <td width="35%" height="50px">
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label>商品名</label>
                                  <input type="text" disabled="disabled" class="form-control"  placeholder="${good.goodname}" name="goodname">
                                </div>
                              </div>
                            </td>
                          </tr>
                          <tr>
    <%--=================================卖家==========================================--%>

                            <td width="35%" height="50px">
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label >卖家</label>
                                  <input type="text" disabled="disabled" class="form-control"  placeholder="${good.saler}" name="saler">
                                </div>
                              </div>
                            </td>
      <%--=================================出售时间==========================================--%>
                  <td width="35%" height="50px">
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label >出售时间</label>
                                  <input type="text" disabled="disabled" class="form-control" placeholder="${good.date}" name="date">
                                </div>
                              </div>
                            </td>
                          </tr>
  <%--=================================价格==========================================--%>

                          <tr>
                            <td width="35%" height="50px">
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label >价格</label>
                                  <input type="text" disabled="disabled" class="form-control"  placeholder="${good.price}" name="price">
                                </div>
                              </div>
                            </td>
  <%--=================================状态==========================================--%>

                            <td width="35%" height="50px">
                              <div class="row form-group">
                                <div class="col-lg-6 col-md-6 form-group">
                                  <label >出售状态</label>
                                    <input type="text" disabled="disabled" class="form-control"  placeholder="${good.status}" name="status">

                                </div>
                              </div>
                            </td>
                          </tr>
<%--                          增加的一行--%>
                          <tr>
                            <td width="35%" height="50px">
                                    描述:<input disabled="disabled" type="text" name="description" placeholder="${good.description}">
                            </td>
                            <%--=================================是否删除==========================================--%>

                            <td width="35%" height="50px">
                              <div class="row" style="text-align: center;">
                                    <a href="goodServlet?action=deleteGood&id=${good.id}">删除商品</a>
                              </div>
                            </td>
                            <td width="35%" height="50px">
                                <div class="row" style="text-align: center;">
                                    <a href="">修改商品</a>
                                </div>
                                <%--                  提交按钮--%>
                             <%-- <div class="form-group text-right" style="float:left;">
                                <button type="submit" class="templatemo-blue-button">确认更改</button>
                                <button type="reset" class="templatemo-white-button">重置</button>
                              </div>--%>
                            </td>

                          </tr>
                        </table>

                    </div>
                  </div>
              </div>
            </div>                                 
          </div>



            </c:forEach>
            <%--        循环体   =================================--%>
          </div>


          <footer class="text-right">
              <p></p>
          </footer>
        </div>
      </div>
    </div>
  </body>
</html>