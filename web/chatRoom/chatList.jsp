<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
  <head>
    <title>${sessionScope.user.username}的主页</title>
    <%@ include file="../default/static/header.jsp"%>
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
        <%@include file="../default/static/icon.jsp"%>

        <!-- Search box -->
        <%@include file="../default/static/search_bar.jsp"%>


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

        <%@include file="../default/static/shop_bar.jsp"%>

        <div class="templatemo-content-container" id="list">
<%--=====================--%>
          <div class="templatemo-flex-row flex-content-row" style="white-space:normal;width: 100%;display: block">
            <div class="templatemo-content-widget white-bg col-2" style="margin-left:0px;text-align: left">

              <div style="font-size:1em">
                <div class="form-group" style="width: 200px;float: right">
                 <a href="chatRoom/chatRoom.jsp" > <button type="submit"  class="templatemo-blue-button width-100">查看详情</button></a>
                </div>

              </div>
              <div >
               来自用户<span></span> 的对话
              </div>
            </div>
          </div>

        <%@ include file="/default/static/footer.jsp"%>

        </div>
      </div>
    </div>
    <script type="text/javascript">
      var websocket = null;
      var toname ="root";
      alert("您已经进入聊天室，请文明发言！！！")
      //将消息显示在网页上
      function setMessageInnerHTML(innerHTML) {
        document.getElementById('talk_show').innerHTML += innerHTML + '<br/>';
      }

      //关闭WebSocket连接
      function closeWebSocket() {
        websocket.close();
      }

      //发送消息（这里不会用到）
      function send() {
        alert("正在发送:123");
        var fromname =${sessionScope.user.username};
        alert("正在发送"+$("#talkwords").val());

        alert("您正在和"+toname+"交流")
        var message = $("#talkwords").val();
        websocket.send(fromname+','+toname+','+message);
      }

      $(function () {
        websocket = new WebSocket("ws://localhost:8080/SWU_Station/websocket");
        //连接发生错误的回调方法
        websocket.onerror = function () {
          alert("链接错误");
          SYS_talk("WebSocket连接发生错误");
        };

        //连接成功建立的回调方法
        websocket.onopen = function () {
          alert("会话已经创立");
          SYS_talk("WebSocket连接成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {

          if (event.data=="该好友未登录！"){
            SYS_talk("该好友未登录！");
          }else {
            B_talk(event.data);

          }
          /* setMessageInnerHTML(event.data);*/
        }

        //连接关闭的回调方法
        websocket.onclose = function () {
          SYS_talk("WebSocket连接关闭");
        }

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
          closeWebSocket();
        }
      })
    </script>
    <script>
      $(function(){
        B_talk=function(user){
          var str=""
          str='<div class="btalk"><span>'+ string+'</span></div>'
          str=' <div class="templatemo-flex-row flex-content-row" style="white-space:normal;width: 100%;display: block">\n' +
                  '            <div class="templatemo-content-widget white-bg col-2" style="margin-left:0px;text-align: left">\n' +
                  '\n' +
                  '              <div style="font-size:1em">\n' +
                  '                <div class="form-group" style="width: 200px;float: right">\n' +
                  '                 <a href="chatRoom/chatRoom.jsp?username='+user+'"> <button type="submit"  class="templatemo-blue-button width-100">查看详情</button></a>\n' +
                  '                </div>\n' +
                  '\n' +
                  '              </div>\n' +
                  '              <div >\n' +
                  '               来自用户<span id="usernameBox"></span> 的对话\n' +
                  '              </div>\n' +
                  '            </div>\n' +
                  '          </div>';
          $('#list').html($('#list').html()+str);

        }

        $('#talksub').click(function(){
          A_talk();
        })
      })
    </script>

  </body>
</html>