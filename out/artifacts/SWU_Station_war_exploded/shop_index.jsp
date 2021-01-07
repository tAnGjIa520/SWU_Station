<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>欢迎来到西大微店！！</title>
    <%@ include file="default/static/header.jsp"%>
    <%--玩成购物车特效--%>
    <script src="js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.animate_from_to-1.0.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        $("button.templatemo-blue-button").click(function () {
            $(this).parent().find('img').animate_from_to("#carIcon");
            $("#countNum").text(Number($("#countNum").text())+1)
              var Id = $(this).attr("goodId");

              $.get(
                  "carServlet",
                  {
                      action:"addItem",
                      goodId:Id
                  },//参数
                  function (data) {
                  },//调用成功的函数
                  "text"//返回值类型
              )
            })
    })

</script>
<style type="text/css">
    .set{
        text-align: center;
        color: white;
        float:right;
      /*  margin-bottom: 10px;*/
        height: auto;
        width: 30px;
        background-color: #329AA1;
        border-radius:15px;
    }
</style>
<body>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
<%--上面的那一横条--%>
        <div class="templatemo-top-nav-container"style="background-color:  #1F2124;height: 70px;" >

            <div class="templatemo-site-header" style="margin: auto">
                <%-- <div class="square" style="float: right;"></div>--%>
                    <h1 style="float: left;font-family: 楷体;" id="text">
                    西大微店-闲置物品一起换，低碳生活大家享
                        <div style="width:300px;margin: auto;float: right;margin-top: 0;padding-top: 0;" >
                            <form style="padding-left: 30px;" role="search" action="searchServlet" method="post">
                                <input type="hidden" name="action" value="search">
                                <div class="input-group">
                                    <button type="submit" class="fa fa-search"></button>
                                    <input style="background-color: black;padding-left: 50px;" type="text" class="form-control" placeholder="Search" name="keyWords" id="srch-term" >
                                </div>
                            </form>
                        </div>
                </h1>
                <%----%>
            </div>
            <div class="row" style="float: right;">



                <nav class="templatemo-top-nav col-lg-12 col-md-12" style="float: right;">
                    <ul class="text-uppercase">
                        <li>
                            <c:if test="${not empty sessionScope.user}">
                                <div class="templatemo-site-header" style="float:right;margin: auto">

                                    <h1 style="float:right;font-size: 180%">
                                        <c:if test="${sessionScope.user.username.length()>=3}">
                                            <img  style="display:inline;margin: auto;width:40px;height:40px;" src="iconServlet" alt="Profile Photo" class="img-responsive">
                                            您好！${sessionScope.user.username.substring(0,3)}...</c:if>
                                        <c:if test="${sessionScope.user.username.length()<3}">您好！${sessionScope.user.username}</c:if>
                                    </h1>
                                </div>
                                <div class="templatemo-site-header" style="float:right;margin: auto;">
                                    <h1 style="float:right;font-size: 80%">
                                        <a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a>
                                        <a href="tradehistory.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a>
                                    <a href="car.jsp"><i class="fa fa-sliders fa-fw" id="carIcon"></i>购物车
                                     <div  class="set" id="countNum">${sessionScope.car.totalCount}</div>
</a><%--==========================================================--%>
                                    </h1>
                                    <h1 style="float:right;font-size: 80%">
                                        <a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a>
                                        <a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a>
                                        <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a>
                                    </h1>
                                </div>

                            </c:if>

                            <c:if test="${empty sessionScope.user}">
                                <a href="index.jsp" style="text-align: center;float: right" class="active">登陆</a>
                                <a href="register.jsp" style="text-align: center;float: right" class="active">注册</a>
                            </c:if>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    <%--上面的那一横条（结束）--%>
        <div style="width: 80%;text-align: center;margin: 0px auto;" >
        <br>
            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
                <div class="col-1 templatemo-overflow-hidden">
                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">
                        <div class="templatemo-flex-row flex-content-row">
                        <img src="default/photo/bar.jpeg" width="1000px" height="350px">
                        </div>
                    </div>
                </div>
            </div>


<%--上面那一块--%>
<%--下面那一块--%>


       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="0" end="2" items="${requestScope.allGood}">

               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">${good.goodname} <span style="color: grey">${good.price}￥</span><a href="userServlet?action=chatWithSaler&salerId=${good.saler}" target="_blank"><span class="badge" >私聊卖家</span></a></h2><hr>

                   <img src="photoServlet?icon=${good.id}" style="height: 200px;width:200px" alt="Bicycle"><br>
                   <div  >
                       <h4 style="text-align: left">${good.description}<br></h4>
                   </div>

                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


               </div>
           </c:forEach>
       </div>

       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="3" end="5" items="${requestScope.allGood}">
               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">${good.goodname} <span style="color: grey">${good.price}￥</span><a href="userServlet?action=chatWithSaler&salerId="+${good.saler} target="_blank"><span class="badge" >私聊卖家</span></a></h2><hr>

                   <img src="photoServlet?icon=${good.id}" style="height: 200px;width:200px" alt="Bicycle"><br>
                   <div  >


                       <h4 style="text-align: left">${good.description}<br></h4>


                   </div>

                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


               </div>

           </c:forEach>
       </div>

       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="6" end="8" items="${requestScope.allGood}">
               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">${good.goodname} <span style="color: grey">${good.price}￥</span><a href="userServlet?action=chatWithSaler&salerId="+${good.saler} target="_blank"><span class="badge" >私聊卖家</span></a></h2><hr>

                   <img src="photoServlet?icon=${good.id}" style="height: 200px;width:200px" alt="Bicycle"><br>
                   <div  >


                       <h4 style="text-align: left">${good.description}<br></h4>


                   </div>

                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


               </div>
           </c:forEach>
       </div>
       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>
<script >

</script>
</html>