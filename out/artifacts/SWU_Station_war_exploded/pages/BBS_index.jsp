<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>BBS</title>
    <%@ include file="../default/static/header.jsp"%>
</head>
<script type="text/javascript">
    $(function () {
/*        scrollTo(0,100);*/
        $(".templatemo-blue-button").click(function () {
            var articleId=$(this).attr("articleId");
            location.href=" bbs?action=getResponse&articleId="+articleId;
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
                                <img  style="display:inline;margin: auto;width:40px;height:40px;" src="iconServlet" alt="Profile Photo" class="img-responsive">

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
                            <img src="pages/bbs_bar.jpg" width="80%" height="80%" style="margin: auto">
                        </div>
                    </div>
                </div>
            </div>


<%--上面那一块--%>
<%--下面那一块--%>
       <%--     <div style="background-color: grey;border-radius: 10px;height: 50px;width: 100px">刷新</div>--%>

            <a href="bbs?action=showArticle"><button type="reset" class="templatemo-white-button" style="width: 200px;border-radius: 10px" href="">刷新</button></a>
            <a href="bbs?action=showMyArticle"><button type="reset" class="templatemo-white-button" style="width: 200px;border-radius: 10px" href="">只看我的</button></a>
            <a href="bbs?action=showArticle#page2"><button type="reset" class="templatemo-white-button" style="width: 200px;border-radius: 10px" href="">我要发帖！！！</button></a>





            <c:forEach var="article" items="${requestScope.articleList}" varStatus="index">
       <div class="templatemo-flex-row flex-content-row" style="padding-left:10px;white-space:normal;width: 100%;">
               <div class="templatemo-content-widget white-bg col-2" style="margin-left:0px;text-align: left">
                   <img style="display:inline;margin: auto;width:40px;height:40px;" src="iconServlet?articlePhotoId=${article.authorId}" alt="Profile Photo" class="img-responsive">
                   <div class="square" style="text-align:center;"> </div>
                    <c:if test="${article.authorId==sessionScope.user.id}">
                        <a href="bbs?action=deleteArticle&articleId=${article.id}"><i class="fa fa-times" goodItem="${carItem.key}">删除帖子</i></a>
                        <span class="badge">我的</span>
                    </c:if>


                   <h3 style="text-align: left;margin-left: 0px;" class="templatemo-inline-block">${article.date} </h3>
                   <a href=""><h3 style="text-align: left" class="templatemo-inline-block">${article.title}</h3></a><hr>
                   <div>${article.content.substring(0,5)}.....</div>

                   <button articleId="${article.id}" class="templatemo-blue-button width-100"  style="margin-top: 20px;width: 100px" onclick="disp()">评论</button>

                   <div id="${article.id}" >
                        <hr>
                   </div>
               </div>
       </div>
            </c:forEach>







<div id="page2"></div>
            <form method="post" action="bbs">
                <input type="hidden" name="action" value="addArticle">
                <div class="templatemo-flex-row flex-content-row" style="padding-left:10px;white-space:normal;width: 100%;border-radius: 10px;background-color: grey;">
                    <div class="templatemo-content-widget white-bg col-2" style="margin-left:0px;text-align: left">
                        <h3 style="text-align: left;margin-left: 0px;" class="templatemo-inline-block">${article.date} </h3>
                        楼主：${sessionScope.user.username}
                        <a href=""><h3 style="text-align: left" class="templatemo-inline-block">${article.title}</h3></a><hr>
                            标题：<input type="text" name="title">

                        <hr>

                        <textarea cols="170" rows="20" maxlength="500" placeholder="最大不超过五百字" name="content"></textarea>

                        <hr>
                        <button articleId="${article.id}" class="templatemo-blue-button width-100"  style="margin-left: 300px;width: 500px" onclick="disp()">我要发帖！！！</button>

                        <div id="${article.id}" >
                            <hr>
                        </div>
                    </div>
                </div>
            </form>



            <%--================================--%>

       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>

</html>