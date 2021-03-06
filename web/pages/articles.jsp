<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>欢迎来到西大微店！！</title>
    <%@ include file="../default/static/header.jsp"%>
</head>
<script type="text/javascript">
/*    $(function () {
/!*        scrollTo(0,100);*!/
        $(".templatemo-blue-button").click(function () {
            var articleId=$(this).attr("articleId");
            location.href=" bbs?action=getResponse&articleId="+articleId;
        })
    })*/


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

        <%--最上面那一个--%>
        <div class="templatemo-top-nav-container"style="background-color:  #1F2124;height: 70px;" >

            <div class="templatemo-site-header" style="margin: auto">
                <%-- <div class="square" style="float: right;"></div>--%>

                <h1 style="float: left;font-family: 楷体;" >
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
                                    <div class="square" style="float: left;font-size: medium"></div>
                                    <h1 style="float:right;font-size: 180%">
                                        <c:if test="${sessionScope.user.username.length()>=3}">您好！${sessionScope.user.username.substring(0,3)}...</c:if>
                                        <c:if test="${sessionScope.user.username.length()<3}">您好！${sessionScope.user.username}</c:if>

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
                                <a href="index.jsp" style="text-align: center;float: right" class="active">登陆</a>
                                <a href="register.jsp" style="text-align: center;float: right" class="active">注册</a>

                            </c:if>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        <%--最上面那一个结束--%>



        <div style="width:60%;/*height:100px*/;text-align: center;margin: 0px auto;" >

        <br>
            <div class="templatemo-content-widget white-bg col-2" style="margin-left:10px;text-align: left;">
                <img style="display:inline;margin-left: 0;width:50px;height:50px;" src="iconServlet" alt="Profile Photo" class="img-responsive">
                <span>楼主：${sessionScope.user.username}</span>&nbsp;&nbsp;&nbsp;<span>电子邮箱：${sessionScope.user.email}</span>
                <hr>
                <h3 style="text-align: left;margin-left: 0px;" class="templatemo-inline-block">${requestScope.article.title} </h3><hr>
                <div style="font-size:1em">${requestScope.article.content}</div>
                <div><hr></div>
            </div>

            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden" style="background-color: #329AA1;border-radius: 20px;margin-left:0px;text-align: left"> <!-- overflow hidden for iPad mini landscape view-->
                <div class="col-1 templatemo-overflow-hidden">

                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden">

                        <div class="templatemo-flex-row flex-content-row">


                            <div class="templatemo-flex-row flex-content-row" style="white-space:normal;width: 100%;display: block">





                                <c:forEach var="response" items="${requestScope.responseList}" varStatus="index">




                                    <div class="templatemo-flex-row flex-content-row" style="white-space:normal;width: 100%;display: block">
                                        <div class="templatemo-content-widget white-bg col-2" style="margin-left:0px;text-align: left">


                                            评论id：${response.id}&nbsp;&nbsp;&nbsp;&nbsp;
                                            ${response.date}

                                            <span class="badge">new</span>

                                            <div style="font-size:1em">${response.content}</div>
                                            <div  >
                                                <hr>
                                            </div>
                                        </div>
                                    </div>




                                </c:forEach>

                                <form class="subForm" method="post" action="bbs">
                                    <input hidden value="addResponse" name="action">
                                    <input hidden value="${requestScope.article.id}" name="articleId">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <button type="submit" class="templatemo-blue-button width-100" style="width: auto">评论</button>
                                            <input style="width: 500px;height: 3em" type="text" class="form-control" placeholder="留言区~~~~~~~~" name="response">
                                        </div>
                                    </div>
                                </form>
                            </div>





                        </div>
                    </div>
                </div>
            </div>


<%--上面那一块--%>
<%--下面那一块--%>









            <%--================================--%>

       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>

</html>