<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的交易记录</title>
    <%@ include file="default/static/header.jsp"%>
      <script type="text/javascript">
          $(function () {
              $(".send").click(function () {
                  location.href = "orderItemServlet?action=sendOrder&orderId=" + $(this).attr("orderId");
              /*            alert("orderItemServlet?action=sendOrder?orderId=" + $(this).attr("orderId"));*/
              })



          })

      </script>
  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>交易记录</h1>
        </header>
          <%@include file="default/static/icon.jsp"%>
          <%@include file="default/static/search_bar.jsp"%>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>

            <li><a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="orderItemServlet?action=showOrderForSaler" class="active"><i class="fa fa-map-marker fa-fw"></i>出售记录</a></li>
            <li><a href="orderItemServlet?action=showOrderForUser"><i class="fa fa-map-marker fa-fw"></i>购买记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>          </ul>
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">

        <%@include file="default/static/shop_bar.jsp"%>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <table class="table table-striped table-bordered templatemo-user-table">

                <thead>
                  <tr>
                    <td>序号</td>
                    <td>订单号</td>
                    <td>买家</td>
                    <td>卖家</td>
                    <td>商品名称</td>
                    <td>商品数量</td>
                    <td>商品单价</td>
                    <td>交易状态</td>
                    <td>已发货超链接</td>
                  </tr>
                </thead>
               <tbody>
                <c:forEach var="salerInfo" items="${requestScope.salerInfoList}" varStatus="status" >
                         <tr>
                        <td>${status.index+1}</td>
                        <td>${salerInfo.orderId}</td>
                        <td>${salerInfo.userId}</td>
                        <td>${salerInfo.salerId}</td>
                        <td>${salerInfo.goodName}</td>
                        <td>${salerInfo.totalCount}</td>
                        <td>${salerInfo.price}</td>

                        <td>
                            <c:if test="${salerInfo.status==0}">未发货</c:if>
                            <c:if test="${salerInfo.status==1}">已发货</c:if>
                            <c:if test="${salerInfo.status==2}">已收货</c:if>

                            <c:if test="${salerInfo.status==3}">已评价</c:if>

                        </td>

                             <td orderId="${salerInfo.orderId}">

                                 <c:if test="${salerInfo.status==0}"><a><div class="send" orderId="${salerInfo.orderId}">我已经发货</div></a></c:if>
                             </td>
                      </tr>
                    </c:forEach>
                </tbody>
              </table>    
            </div>                          
          </div>          
        <%--
          <div class="pagination-wrap">
            <ul class="pagination">
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li class="active"><a href="#">3<span class="sr-only">(current)</span></a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true"><i class="fa fa-play"></i></span>
                </a>
              </li>
            </ul>
          </div>--%>
        <%@ include file="/default/static/footer.jsp"%>
        </div>
      </div>
    </div>
    
    <!-- JS -->
  <%--  <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });
    </script>--%>
  </body>
</html>