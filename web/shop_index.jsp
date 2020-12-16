<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>欢迎来到西大微店！！</title>
    <%@ include file="default/static/header.jsp"%>
</head>
<script type="text/javascript">
    $(function () {
/*        scrollTo(0,100);*/
        $("button.templatemo-blue-button").click(function () {
            var goodId= $(this).attr("goodId");
            location.href="carServlet?action=addItem&goodId="+goodId;

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
                <h1 style="float: left;font-family: 楷体;" >
                    西大微店--闲置物品一起换，低碳生活大家享
                </h1>
            </div>
            <div class="row" style="float: right;">
                <nav class="templatemo-top-nav col-lg-12 col-md-12" style="float: right;">
                    <ul class="text-uppercase">
                        <li>
                            <c:if test="${not empty sessionScope.user}">
                                <div class="templatemo-site-header" style="float:right;margin: auto">
                                    <div class="square" style="float: left;font-size: medium"></div>
                                    <h1 style="float:right;font-size: 180%">
                                        您好！！${sessionScope.user.username}
                                    </h1>
                                </div>
                                <div class="templatemo-site-header" style="float:right;margin: auto;">
                                    <h1 style="float:right;font-size: 80%">
                                        <a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a>
                                        <a href="tradehistory.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a>
<a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车
                                    <c:if test="${not (sessionScope.car.totalCount==0 || empty sessionScope.car)}">
                                        <div  class="set" >${sessionScope.car.totalCount}</div>
                                    </c:if>


</a>

                                    </h1>
                                    <h1 style="float:right;font-size: 80%">
                                        <a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a>
                                        <a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a>
                                        <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a>
                                    </h1>
                                </div>

                            </c:if>

                            <c:if test="${empty sessionScope.user}">
                                <a href="index.jsp" style="text-align: center;float: right"  class="active">登陆</a>
                                <a href="register.jsp" style="text-align: center;float: right"  class="active">注册</a>

                            </c:if>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    <%--上面的那一横条（结束）--%>
        <div style="width: 80%;text-align: center;margin: 0px auto;" >
   <%--         <div class="templatemo-content-container">



            </div> <!-- Second row ends -->--%>

            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden"> <!-- overflow hidden for iPad mini landscape view-->
                <div class="col-1 templatemo-overflow-hidden">
                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">

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


<%--上面那一块--%>
<%--下面那一块--%>


       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="0" end="2" items="${requestScope.allGood}">

               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">商品</h2><hr>

                       <img src="images/bicycle.jpg" style="float: left;" alt="Bicycle"><br>
                       <div  style="text-align: left;">商品id： ${good.id}<br>
                           商品名:${good.goodname}<br>
                           商品描述：${good.description}<br>
                           商品价格:${good.price}￥<br>
                       </div>

                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


               </div>

           </c:forEach>
       </div>

       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="3" end="5" items="${requestScope.allGood}">

               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">商品</h2><hr>

                   <img src="images/bicycle.jpg" style="float: left;" alt="Bicycle"><br>
                   <div  style="text-align: left;">商品id： ${good.id}<br>
                       商品名:${good.goodname}<br>
                       商品描述：${good.description}<br>
                       商品价格:${good.price}￥<br>
                   </div>
                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>

               </div>

           </c:forEach>
       </div>

       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="6" end="8" items="${requestScope.allGood}">

               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">商品</h2><hr>

                   <img src="images/bicycle.jpg" style="float: left;" alt="Bicycle"><br>
                   <div  style="text-align: left;">商品id： ${good.id}<br>
                       商品名:${good.goodname}<br>
                       商品描述：${good.description}<br>
                       商品价格:${good.price}￥<br>
                   </div>
                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>
               </div>

           </c:forEach>
       </div>
            <%--================================--%>

       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>

</html>