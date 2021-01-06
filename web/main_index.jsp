<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的主页</title>
    <%@ include file="default/static/header.jsp"%>
    <script type="text/javascript">
      $(function () {
         $
      })

    </script>
  </head>
  <body>
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>您好！${sessionScope.user.username}</h1>
        </header>
        <%@include file="default/static/icon.jsp"%>

        <!-- Search box -->
        <%@include file="default/static/search_bar.jsp"%>


        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>

        <nav class="templatemo-left-nav">
          <ul>
            <li ><a href="message?action=messageList" class="active"><i class="fa fa-home fa-fw"></i>我的主页<span class="badge">new</span></a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="orderItemServlet?action=showOrderForSaler"><i class="fa fa-map-marker fa-fw"></i>出售记录</a></li>
            <li><a href="orderItemServlet?action=showOrderForUser"><i class="fa fa-map-marker fa-fw"></i>购买记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">

        <%@include file="default/static/shop_bar.jsp"%>

        <div class="templatemo-content-container">


        <div class="templatemo-flex-row flex-content-row">
              <div class="templatemo-content-widget white-bg col-2">
                <h2 class="templatemo-inline-block" style="padding-left:45%">消息通知</h2>
                <hr>
                <c:forEach items="${requestScope.messageList}" var="message">
                     ${message.date}    id为${message.id}的用户在订单号为${message.orderId}的交易中给您留言:${message.mark}
                  <hr>
                </c:forEach>
              </div>
        </div>
        <%@ include file="/default/static/footer.jsp"%>

        </div>
      </div>
    </div>


  </body>
</html>