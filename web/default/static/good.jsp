<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021-01-04
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="templatemo-content-widget white-bg col-2">

    <div class="square"></div>
    <h2 class="templatemo-inline-block">${good.goodname} <span style="color: grey">${good.price}￥</span><a href="chatRoom/chatRoom.jsp?${}" target="_blank"><span class="badge" >私聊卖家</span></a></h2><hr>

    <img src="photoServlet?icon=${good.id}" style="float: left;height: 200px;width: 200px" alt="Bicycle"><br>
    <div  >


        <h4 style="text-align: left">${good.description}<br></h4>


    </div>

    <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


</div>
<script type="text/javascript">


</script>