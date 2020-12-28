<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的商品</title>
    <%@ include file="default/static/header.jsp"%>

  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>Visual Admin</h1>
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
            <li><a href="goodServlet?action=list" class="active"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
              <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">


        <%@include file="default/static/shop_bar.jsp"%>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg" style="height: 80px">
            <div style="float: left;"><h2 class="margin-bottom-10">商品列表</h2></div>

              <div class="row" style="float: right">
                <nav class="templatemo-top-nav col-lg-12 col-md-12">
                      <ul class="text-uppercase">

                    <li><a href="addGood.jsp" class="active">我要增加商品</a></li>

                  </ul>
                </nav>
              </div>
            <%--每一栏的具体内容--%>

            <%--        循环体   =================================--%>

          </div>



           <c:forEach var="good" items="${requestScope.Goods}" >


            <div class="templatemo-flex-row flex-content-row">

            <div class="col-1">              
              <div class="panel panel-default margin-10" style="height:500px;">
                <div class="panel-heading"><h2>商品<></h2></div>
                  <div class="panel-body">
                    <div id="vmap_africa" class="vmap">
                        <table width="1100px" height="250px" border="1" style="border: none;">
                          <tr>
                            <td rowspan="3" height="250px" width="150px">
                              <img src="photoServlet?icon=${good.id}" style="float: left;height: 200px;width: 200px" alt="Bicycle">
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
                                    描述:<input disabled="disabled" type="text" name="description" placeholder="${good.description}">

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
                                <div class="row" style="text-align: center;">
                                    <a href="setGoodIcon.jsp?goodId=${good.id}">修改图片</a>
                                </div>
                            </td>
                            <%--=================================是否删除==========================================--%>

                            <td width="35%" height="50px">
                              <div class="row" style="text-align: center;">
                                    <a href="goodServlet?action=deleteGood&id=${good.id}">删除商品</a>
                              </div>
                            </td>
                            <td width="35%" height="50px">
                                <div class="row" style="text-align: center;">
                                    <a href="goodServlet?action=getGood&goodid=${good.id}">修改商品</a>
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


          <%@ include file="default/static/footer.jsp"%>>
        </div>
      </div>
    </div>
  </body>
</html>