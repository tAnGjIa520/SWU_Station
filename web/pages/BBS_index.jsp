<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>欢迎来到西大微店！！</title>
    <%@ include file="../default/static/header.jsp"%>
</head>
<script type="text/javascript">
   /* $(function () {
/!*        scrollTo(0,100);*!/
        $("button.templatemo-blue-button").click(function () {
            var goodId= $(this).attr("goodId");
            location.href="carServlet?action=addItem&goodId="+goodId;

        })
    })
*/
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
        <div class="templatemo-top-nav-container"style="background-color:/*white */ #1F2124;height: 70px;" >

            <div class="templatemo-site-header" style="margin: auto">
                <%-- <div class="square" style="float: right;"></div>--%>

                    <h1 style="float: left;font-family: 楷体;" >
                    西大微店——专用论坛
                        <div style="width:300px;margin: auto;float: right;margin-top: 0;padding-left: 200px;" >
                            <form style="padding-left: 30px;" role="search" action="searchServlet" method="post">
                                <input type="hidden" name="action" value="search">
                                <div class="input-group">
                                    <button type="submit" class="fa fa-search"></button>
                                    <input style="background-color: black;padding-left: 50px;width: 500px;" type="text" class="form-control" placeholder="Search" name="keyWords" id="srch-term" >
                                </div>
                            </form>
                        </div>
                </h1>
                <%----%>
            </div>
            <div class="row" style="float: right;">

                <nav class="templatemo-top-nav col-lg-12 col-md-12" style="float: right;">

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
                            <img src="pages/bbs_bar.jpg" width="80%" height="80%" style="margin: auto">
                        </div>
                    </div>
                </div>
            </div>


<%--上面那一块--%>
<%--下面那一块--%>
<%--

       <div class="templatemo-flex-row flex-content-row" style="white-space:normal;">
           <c:forEach var="good" begin="0" end="2" items="${requestScope.allGood}">

               <div class="templatemo-content-widget white-bg col-2">

                   <div class="square"></div>
                   <h2 class="templatemo-inline-block">商品</h2><hr>

                       <img src="photoServlet?icon=${good.id}" style="float: left;height: 200px;width: 200px" alt="Bicycle"><br>
                       <div  style="text-align: left;">商品id： ${good.id}<br>
                           商品名:${good.goodname}<br>
                           商品描述：${good.description}<br>
                           商品价格:${good.price}￥<br>
                       </div>

                   <button goodId="${good.id}"  class="templatemo-blue-button width-100" style="margin-top: 20px">加入购物车！</button>


               </div>

           </c:forEach>
       </div>


--%>






            <%--================================--%>

       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>

</html>