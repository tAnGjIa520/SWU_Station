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
       /* $(".fa-times").click(function () {
          location.href="carServlet?action=deleteItem";
        })
*/
      })


    </script>
  </head>
  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <h1>${sessionScope.user.username}的购物车</h1>
        </header>
        <div class="profile-photo-container">
          <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">
          <div class="profile-photo-overlay"></div>
        </div>      
        <!-- Search box -->
        <form class="templatemo-search-form" role="search">
          <div class="input-group">
              <button type="submit" class="fa fa-search"></button>
              <input type="text" class="form-control" placeholder="Search" name="srch-term" id="srch-term">           
          </div>
        </form>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <!--
            <li><a href="main_index.jsp" class="active"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp"><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="tradehistory.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
            <li><a href="goodServlet?action=list"><i class="fa fa-users fa-fw"></i>我的商品</a></li>
            <li><a href="person_setting.jsp"><i class="fa fa-sliders fa-fw"></i>设置</a></li>
            <li><a href="index.jsp"><i class="fa fa-eject fa-fw"></i>退出系统</a></li>
          -->
            <li><a href="main_index.jsp"><i class="fa fa-home fa-fw"></i>我的主页</a></li>
            <li><a href="car.jsp" class="active" ><i class="fa fa-sliders fa-fw"></i>购物车</a></li>
            <li><a href="tradehistory.jsp"><i class="fa fa-map-marker fa-fw"></i>交易记录</a></li>
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
                      <div  style="height: 0px"></div>
                      <h3 class="text-center margin-bottom-5">购物车中共有${sessionScope.car.totalCount}件商品，总价${sessionScope.car.totalPrice}软妹币</h3>
                        <%--  <a href="goodServlet?action=listAll"><p class="text-center">点我前往商城</p></a>--%>
                      <i class="fa fa-times" id="clearCar" style="float: bottom">清空购物车</i>
                    </div>
                  </div>
                </div>

              </div>
            </c:if>


            <%--========================================================================================--%>

<c:forEach var="carItem" items="${sessionScope.car.itemsMap}" varStatus="status">
            <div class="templatemo-flex-row flex-content-row">




              <div class="col-1">
                <div class="panel panel-default margin-10" style="height:600px;width: auto" >
                  <%--<div class="panel-heading"><h2>商品<1></h2>


                  </div>--%>
                    <div class="templatemo-content-widget white-bg col-2" style="height: 500px;width: 1000px" >
                      <i class="fa fa-times"></i>
                      <div class="square"></div>
                      <h2 class="templatemo-inline-block">商品<====${status.index+1}====></h2><hr>
                      <%--=================22222222222222222222222222222222222222222222222222222222222222--%>


                      <div class="panel-body">
                        <div id="vmap_africa" class="vmap">

                          <table border="1" style="border: none;margin: auto; width:900px; height:200px">
                            <tr>
                              <td rowspan="5" height="200px" width="150px">
                                图片
                              </td>
                              <td width="35%" >
                                  <%--=================================商品id==========================================--%>
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label  >商品id</label>
                                    <input type="text" disabled="disabled" class="form-control" disabled="disabled  "  placeholder="${carItem.key}" name="itemId">
                                  </div>
                                </div>


                              </td>

                            </tr>
                            <tr>
                                <%--=================================商品名==========================================--%>

                              <td width="35%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>商品名</label>
                                    <input type="text" disabled="disabled" class="form-control"  placeholder="${carItem.value.itemName}" name="itemName">
                                  </div>
                                </div>
                              </td>
                                <%--=================================出售时间==========================================--%>

                            </tr>
                              <%--=================================价格==========================================--%>

                            <tr>
                              <td width="35%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>单价</label>
                                    <input type="text" disabled="disabled" class="form-control"  placeholder="${carItem.value.itemPrice}" name="itemPrice">
                                  </div>
                                </div>
                              </td>
                            </tr>
                              <%--                          增加的一行--%>
                            <tr>
                              <td width="35%" >
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>数量</label>
                                    <input type="text" disabled="disabled" class="form-control"  placeholder="${carItem.value.totalItemCount}" name="itemCount">
                                  </div>
                                </div>
                              </td>
                            </tr>


                              <%--总价--%>
                            <tr>
                              <td width="35%">
                                <div class="row form-group">
                                  <div class="col-lg-6 col-md-6 form-group">
                                    <label>总价</label>
                                    <input type="text" disabled="disabled" class="form-control"  placeholder="${carItem.value.totalItemPrice}" name="totalItemPrice">
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
                <%--<i class="fa fa-times"  style="float: bottom">商品</i>--%>



              </div>
            </div>



</c:forEach>





          </div>
          </div>
          <%@ include file="/default/static/footer.jsp"%>
        </div>
      </div>
    </div>

    <!-- JS -->
   <%-- <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script type="text/javascript" src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>

      var gaugeChart;
      var gaugeData;
      var gaugeOptions;
      var timelineChart;
      var timelineDataTable;
      var timelineOptions;
      var areaData;
      var areaOptions;
      var areaChart;

      /* Gauage
      --------------------------------------------------*/
      google.load("visualization", "1", {packages:["gauge"]});
      google.setOnLoadCallback(drawGauge);
      google.load("visualization", "1", {packages:["timeline"]});
      google.setOnLoadCallback(drawTimeline);
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });
        } else {
          $(window).resize(function(){
            drawCharts();
          });
        }
      });

      function drawGauge() {

        gaugeData = google.visualization.arrayToDataTable([
          ['Label', 'Value'],
          ['Memory', 80],
          ['CPU', 55],
          ['Network', 68]
        ]);

        gaugeOptions = {
          redFrom: 90, redTo: 100,
          yellowFrom:75, yellowTo: 90,
          minorTicks: 5
        };

        gaugeChart = new google.visualization.Gauge(document.getElementById('gauge_div'));
        gaugeChart.draw(gaugeData, gaugeOptions);

        setInterval(function() {
          gaugeData.setValue(0, 1, 40 + Math.round(60 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 13000);
        setInterval(function() {
          gaugeData.setValue(1, 1, 40 + Math.round(60 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 5000);
        setInterval(function() {
          gaugeData.setValue(2, 1, 60 + Math.round(20 * Math.random()));
          gaugeChart.draw(gaugeData, gaugeOptions);
        }, 26000);
      } // End function drawGauage

      /* Timeline
      --------------------------------------------------*/
      function drawTimeline() {
        var container = document.getElementById('timeline_div');
        timelineChart = new google.visualization.Timeline(container);
        timelineDataTable = new google.visualization.DataTable();
        timelineDataTable.addColumn({ type: 'string', id: 'Room' });
        timelineDataTable.addColumn({ type: 'string', id: 'Name' });
        timelineDataTable.addColumn({ type: 'date', id: 'Start' });
        timelineDataTable.addColumn({ type: 'date', id: 'End' });
        timelineDataTable.addRows([
          [ 'Magnolia Room',  'CSS Fundamentals',    new Date(0,0,0,12,0,0),  new Date(0,0,0,14,0,0) ],
          [ 'Magnolia Room',  'Intro JavaScript',    new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Magnolia Room',  'Advanced JavaScript', new Date(0,0,0,16,30,0), new Date(0,0,0,19,0,0) ],
          [ 'Gladiolus Room', 'Intermediate Perl',   new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
          [ 'Gladiolus Room', 'Advanced Perl',       new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Gladiolus Room', 'Applied Perl',        new Date(0,0,0,16,30,0), new Date(0,0,0,18,0,0) ],
          [ 'Petunia Room',   'Google Charts',       new Date(0,0,0,12,30,0), new Date(0,0,0,14,0,0) ],
          [ 'Petunia Room',   'Closure',             new Date(0,0,0,14,30,0), new Date(0,0,0,16,0,0) ],
          [ 'Petunia Room',   'App Engine',          new Date(0,0,0,16,30,0), new Date(0,0,0,18,30,0) ]]);

        timelineOptions = {
          timeline: { colorByRowLabel: true },
          backgroundColor: '#ffd'
        };

        timelineChart.draw(timelineDataTable, timelineOptions);
      } // End function drawTimeline

      /* Area Chart
      --------------------------------------------------*/
      function drawChart() {
        areaData = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2013',  1000,      400],
          ['2014',  1170,      460],
          ['2015',  660,       1120],
          ['2016',  1030,      540]
        ]);

        areaOptions = {
          title: 'Company Performance',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        areaChart = new google.visualization.AreaChart(document.getElementById('area_chart_div'));
        areaChart.draw(areaData, areaOptions);
      } // End function drawChart

      function drawCharts () {
          gaugeChart.draw(gaugeData, gaugeOptions);
          timelineChart.draw(timelineDataTable, timelineOptions);
          areaChart.draw(areaData, areaOptions);
      }

    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->--%>
  </body>
</html>