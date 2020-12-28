<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>购物车</title>
    <%@ include file="default/static/header.jsp"%>
    <script type="text/javascript">
      $(function () {

        $("#clearCar").click(function () {
            location.href="carServlet?action=clearCar";
        })

        $(".fa:contains('删除商品')").click(function () {
          location.href="carServlet?action=deleteItem&itemId="+$(this).attr("goodItem");

        })

        $("input[name='itemCount']").change(function () {
          var b = confirm("您确定要修改商品吗");
          if (b){
            location.href="carServlet?action=setItem&goodId="+$(this).attr("goodId")+"&newCount="+this.value
       /*     alert("carServlet?action=setItem&goodId="+$(this).attr("goodId")+"&newCount="+this.value);*/
          }else {
            this.value=this.defaultValue;
          }
        })

      })


    </script>
    <style type="text/css">
      .set{
        text-align: center;
        padding-left: 10px;
        color: white;
        padding-right:10px;
        float:right;
        margin-bottom: 10px;
        height: auto;
        width: 50px;
        background-color: #329AA1;
        border-radius:15px;
      }

    </style>
  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>${sessionScope.user.username}的购物车</h1>
        </header>
        <%@include file="default/static/icon.jsp"%>
        <%@include file="default/static/search_bar.jsp"%>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>

            <li><a href="message?action=messageList"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp" class="active" ><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="orderItemServlet?action=showOrderForSaler"><i class="fa fa-map-marker fa-fw"></i>出售记录</a></li>
            <li><a href="orderItemServlet?action=showOrderForUser"><i class="fa fa-map-marker fa-fw"></i>购买记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li> <a href="userServlet?action=logout"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->


      <div class="templatemo-content col-1 light-gray-bg">
        <%@include file="default/static/shop_bar.jsp"%>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">

              <h2 class="margin-bottom-10">${sessionScope.user.username}的购物车</h2>

            <c:if test="${ empty sessionScope.car || sessionScope.car.totalCount==0}">
              <div class="panel panel-default no-border">
                <div class="panel-body">
                  <div class="templatemo-flex-row flex-content-row">
                    <div class="col-1">
                      <div  style="height: 100px"></div>
                      <h3 class="text-center margin-bottom-5">  购物车空空如也</h3>
                      <a href="goodServlet?action=listAll"><p class="text-center">点我前往商城</p></a>
                    </div>
                  </div>
                </div>

              </div>
            </c:if>
            <c:if test="${not (empty sessionScope.car || sessionScope.car.totalCount==0)}">
              <div class="panel panel-default no-border">
                <div class="panel-body">
                  <div class="templatemo-flex-row flex-content-row">
                    <div class="col-1">
                      <div  style="height: 0px"></div>&nbsp;
                      <h3 class="text-center margin-bottom-5">购物车中共有${sessionScope.car.totalCount}件商品，总价${sessionScope.car.totalPrice}软妹币&nbsp;&nbsp;&nbsp;&nbsp;<a href="orderItemServlet?action=createOrder">>>>>去结算</a></h3>
                        <%--  <a href="goodServlet?action=listAll"><p class="text-center">点我前往商城</p></a>--%>
                      <i class="fa fa-times" id="clearCar" style="float: bottom">清空购物车</i>
                    </div>
                  </div>
                </div>

              </div>
            </c:if>


            <%--========================================================================================--%>

<c:forEach var="carItem" items="${sessionScope.car.itemsMap}" varStatus="status">
            <div class="templatemo-flex-row flex-content-row" style="height: auto">




              <div class="col-1">
                <div class="panel panel-default margin-10" style="height:240px;width: auto; border-color:#329AA1;border-width: 2px;"  >
                  <%--<div class="panel-heading"><h2>商品<1></h2>


                  </div>--%>
                    <div class="templatemo-content-widget white-bg col-2" style="height: 220px;width: 1000px" >
                      <i class="fa fa-times" goodItem="${carItem.key}">删除商品</i>

                      <div class="square" style="text-align:center;"> </div>
                      <h2 class="templatemo-inline-block">商品<====${status.index+1}====></h2><hr>


                    <%--=================22222222222222222222222222222222222222222222222222222222222222--%>


                      <div class="panel-body">
                        <div id="vmap_africa" class="vmap">

                          <table border="1" style="border: none;margin: auto; width:900px; height:50px">
                            <tr>

                              <td width="20%" >
                                  <%--=================================商品id==========================================--%>
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label  >商品id</label>

                                    <input type="text" disabled="disabled" style="width: auto;" class="form-control" disabled="disabled  "  placeholder="${carItem.key}" name="itemId">
                                  </div>
                                </div>


                              </td>



                                <%--=================================商品名==========================================--%>

                              <td width="20%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>商品名</label>
                                    <input type="text" disabled="disabled" style="width: auto;"  class="form-control"  placeholder="${carItem.value.itemName}" name="itemName">
                                  </div>
                                </div>
                              </td>
                                <%--=================================出售时间==========================================--%>


                              <%--=================================价格==========================================--%>


                              <td width="20%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>单价</label>
                                    <input type="text" disabled="disabled" style="width: auto;"  class="form-control"  placeholder="${carItem.value.itemPrice}" name="itemPrice">
                                  </div>
                                </div>
                              </td>

                              <%--                          增加的一行--%>

                              <td width="20%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>数量</label>
                                    <input type="text"  style="width: auto;" goodId="${carItem.key}"  class="form-control"  placeholder="${carItem.value.totalItemCount}" name="itemCount">
                                  </div>
                                </div>
                              </td>


                              <%--总价--%>

                              <td width="20%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>总价</label>
                                    <input type="text" disabled="disabled" style="width: auto;"  class="form-control"  placeholder="${carItem.value.totalItemPrice}" name="totalItemPrice">
                                  </div>
                                </div>
                              </td>

                            </tr>
                          </table>

                        </div>
                      </div>
                    </div>



                  <%--==============--%>
                    </div>

              </div>
            </div>



</c:forEach>





          </div>
          </div>
          <%@ include file="/default/static/footer.jsp"%>
        </div>
      </div>
    </div>


  </body>
</html>