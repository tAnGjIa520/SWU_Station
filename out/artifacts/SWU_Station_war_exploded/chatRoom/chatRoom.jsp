<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.tangjia.service.impl.UserServiceImpl" %>
<%@ page import="com.tangjia.pojo.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>欢迎来到西大微店！！</title>
    <%@ include file="../default/static/header.jsp"%>
</head>
<style type="text/css">
      .talk_con {
          /*width: 600px;
          height: 500px;*/
          border: 1px solid #666;
          margin: 50px auto 0;
          background: #f9f9f9;
      }

    .talk_show {
        width: 720px;
        height: 420px;
        border: 1px solid #666;
        background: #edebee;
        margin: 10px auto 0;
        overflow: auto;
    }

    .talk_input {
        width: 580px;
        margin: 10px auto 0;
    }

    .whotalk {
        width: 80px;
        height: 30px;
        float: left;
        outline: none;
    }

    .talk_word {

        padding: 0px;
        float: left;

        outline: none;
        text-indent: 10px;
    }

    .talk_sub {
        width: 56px;
        height: 30px;
        float: left;
        margin-left: 10px;
    }

    .atalk {
        margin: 10px;
    }

    .atalk span {
        display: inline-block;
        background: #96ed6a;
        border-radius: 10px;
        color: black;
        border-color: #dedede;
        border-width: 2px;
        padding: 5px 10px;
    }

    .btalk {
        margin: 10px;
        text-align: right;
    }

    .btalk span {
        display: inline-block;
        background:  #dedede;
        border-radius: 10px;
        color:black;
        border-width: 2px;
        border-color: #dedede;
        padding: 5px 10px;
    }
</style>
<body>
    <!-- Main content -->
    <div class="templatemo-content col-1 light-gray-bg">
        <div style="width:70%;/*height:100px*/;text-align: center;margin: 0px auto;" >
        <br>
            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden" style="background-color: #329AA1;border-radius: 20px;margin-left:0px;text-align: left"> <!-- overflow hidden for iPad mini landscape view-->

                <div class="col-1 templatemo-overflow-hidden">

                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden" style="border-radius: 30px">
                        <div class="talk_con" style="border-color: darkgrey;">
                           <table width="100%" height="600px" style="border: none;border-radius: 20px">
                               <tr height="10px">
                                   <td colspan="2" height="10%" width="70%" style="border-top-left-radius: 20px;border-top-right-radius: 20px;background-color: #343338">
                                   <h4 style="color: #faf8f9;text-align: center" >${sessionScope.user.username}---电脑在线<span id="status"></span> </h4>

                                 </td>
                               </tr>

                               <tr>

                                   <td width="70%" height="50%">
                                       <div class="talk_show" id="words" style="border: none">
                                           <div class="atalk"><span>您的会话已经被建立起来，赶紧聊天吧！！</span></div>

                                       </div>
                                   </td>
                                   <td width="70%" height=40%">

                                   </td>
                               </tr>
                               <tr>
                                   <td width="70%" height="50%">
                                       <div>

                                           <textarea  <%--cols="88"--%> rows="12" style="width: 720px;border:none;background-color: #edebee;border-top-color: grey" class="talk_word" id="talkwords" maxlength="500" placeholder="最大不超过五百字" name="content">

                                           </textarea>
                                       </div>
                                   </td>
                                   <td width="70%" height=40%">
                                       <div><button style="height: 250px;width: 250px"  class="talk_sub" id="talksub" onclick="send()">发送消息</button></div>
                                   </td>
                               </tr>

                           </table>
                        </div>
                    </div>
                </div>
            </div>

            <%--=================================--%>
            <hr/>
       </div>
    <%@ include file="/default/static/footer.jsp"%>
    </div>
</body>
<script type="text/javascript">
    var websocket = null;
    var toname ="root";
    alert("您正在和"+toname+"交流")
    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('talk_show').innerHTML += innerHTML + '<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
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
            setMessageInnerHTML("WebSocket连接发生错误");
        };

        //连接成功建立的回调方法
        websocket.onopen = function () {
            alert("会话已经创立");
            setMessageInnerHTML("WebSocket连接成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {
         /*   if (event.data.startsWith("发送给")){
                var str=""
                str='<div class="talk"><span>'+ event.data+'</span></div>'
                //原有的内容+str,否则会覆盖掉原有内容
                $('#words').html($('#words').html()+str)
                //发送完数据后清空输入框
                $('#talkwords').val('')
            }*/
            B_talk(event.data);
            /* setMessageInnerHTML(event.data);*/
        }

        //连接关闭的回调方法
        websocket.onclose = function () {
            setMessageInnerHTML("WebSocket连接关闭");
        }

        //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
        window.onbeforeunload = function () {
            closeWebSocket();
        }
    })
</script>
<script>
    $(function(){
        A_talk=function(){
            //发送单击，获取用户输入的数据value属性值
            var vals=$('#talkwords').val()
            //如果输入的数据为空，则弹窗提示
            if (vals=='')
            {
                alert('请输入数据！')
                return
            }
            //条件下拉列表中的value值是0还是1

            var str=""
            //选择A发送还是B发送
                str='<div class="atalk"><span>A：'+ vals+'</span></div>'
               /* str='<div class="btalk"><span>B：'+ vals+'</span></div>'*/

            //原有的内容+str,否则会覆盖掉原有内容
            $('#words').html($('#words').html()+str)
            //发送完数据后清空输入框
            $('#talkwords').val('')
        }
        B_talk=function(string){


            var str=""
             str='<div class="btalk"><span>'+ string+'</span></div>'
            //原有的内容+str,否则会覆盖掉原有内容
            $('#words').html($('#words').html()+str)
            //发送完数据后清空输入框
            $('#talkwords').val('')
        }
        $('#talksub').click(function(){
            A_talk();
        })
    })
</script>
</html>