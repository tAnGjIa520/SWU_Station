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
<%--上面的那一横条--%>
      <%--  <div class="templatemo-top-nav-container"style="background-color:/*white */ #1F2124;height: 70px;" >

            <div class="templatemo-site-header" style="margin: auto">


                   &lt;%&ndash; <h1 style="float: left;font-family: 楷体;" >
                       &lt;%&ndash; ${requestScope.responseList}&ndash;%&gt;



                        <div style="width:300px;margin: auto;float: right;margin-top: 0;padding-left: 200px;" >
                            <form style="padding-left: 30px;" role="search" action="searchServlet" method="post">
                                <input type="hidden" name="action" value="search">
                                <div class="input-group">
                                    <button type="submit" class="fa fa-search"></button>
                                    <input style="background-color: black;padding-left: 50px;width: 500px;" type="text" class="form-control" placeholder="Search" name="keyWords" id="srch-term" >
                                </div>
                            </form>
                        </div>
                </h1>&ndash;%&gt;
            </div>
            <div class="row" style="float: right;">

                <nav class="templatemo-top-nav col-lg-12 col-md-12" style="float: right;">

                </nav>
            </div>
        </div>--%>
    <%--上面的那一横条（结束）--%>
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

                                            <hr>

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