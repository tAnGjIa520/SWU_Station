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

    .systalk {
      margin: 10px;
      text-align: center;
    }

    .systalk span {
      display: inline-block;
      background:  #d5d5d5;
      border-radius: 10px;
      color:#f7f7f7;
      border-width: 2px;
        font-size: smaller;
      border-color: #dedede;
      padding: 5px 10px;
    }




    .btalk {
        margin: 10px;
        text-align: right;
    }

    .btalk span {
        display: inline-block;
        background:  #fefefe;
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
            <div class="templatemo-flex-row flex-content-row templatemo-overflow-hidden" style="border-radius: 20px;margin-left:0px;text-align: left"> <!-- overflow hidden for iPad mini landscape view-->

                <div class="col-1 templatemo-overflow-hidden">

                    <div class="templatemo-content-widget white-bg templatemo-overflow-hidden" style="border-radius: 30px">
                        <div class="talk_con" style="border-color: darkgrey;">
                           <table width="100%" height="600px" style="border: none;border-radius: 20px">
                               <tr height="10px">
                                   <td colspan="2" height="10%" width="70%" style="border-top-left-radius: 20px;border-top-right-radius: 20px;background-color: #343338">
                                   <h4 style="color: #faf8f9;text-align: center" >${sessionScope.user.username}---电脑在线 正在和<span id="who"></span>聊天</h4>

                                 </td>
                               </tr>

                               <tr>

                                   <td width="420px" height="420px">
                                       <div style="display: none;" id="showBox">
                                            <div class="talk_show" id="words" style="border: none;" >
                                                <div class="systalk"><span>您的会话已经被建立起来，赶紧聊天吧！！</span></div>
                                            </div>
                                       </div>
                                   </td>
                                   <td width="70%" height=40%" style="margin-top: 0px;top: 0;">
                                       <div class="talk_show" style="width: 250px;border-color: white"><div class="systalk">消息列表</div>
                                           <ul id="userList">
                                               <%--<li onclick='showChat("root")'>
                                                       <div class="panel panel-default margin-10" style="height:40px;width:240px; border-color:#329AA1;border-width: 2px;text-align: center;vertical-align:center "  >
                                                           <h4>root</h4>

                                               </div>
                                               </li>--%>

                                           </ul>
                                       </div>
                                   </td>
                               </tr>
                               <tr>
                                   <td width="70%" height="50%">
                                       <div>

                                           <textarea  rows="12" style="width: 720px;border:none;background-color: #edebee;border-top-color: grey" class="talk_word" id="talkwords" maxlength="500" placeholder="最大不超过五百字" name="content">

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
<%--websocket--%>
<script type="text/javascript">
    var userList=[];
    var fromname="${sessionScope.user.username}";
    var websocket = null;
    var toname ="root";
    /*alert("您正在和"+toname+"交流")*/

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
        document.getElementById('talk_show').innerHTML += innerHTML + '<br/>';
    }

    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function    send() {
        alert("正在发送:123");

        var fromname ="${sessionScope.user.username}";
        alert("正在发送"+$("#talkwords").val());

        alert("您正在和"+toname+"交流")

        var message = $("#talkwords").val();
        websocket.send(fromname+','+toname+','+message);
    }

    messageContent=function(string){
        var splitElement = string.split(":")[1];
        return splitElement;
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
            /*websocket.send(fromname+','+toname+','+"试图与您建立会话");*/
            SYS_talk("WebSocket连接成功");
        }

        //接收到消息的回调方法
        websocket.onmessage = function (event) {

             if (event.data.startsWith("$[登录异常]")){
                 SYS_talk(SYS_content(event.data));
                 SYS_talk("<a onclick='remind()'>提醒他！！！</a>")
             }else if (event.data.startsWith("$[加入会话]")){
                 SYS_talk(SYS_content(event.data));

             }else if (event.data.startsWith("$[增加好友]")){
                 var splitElement = event.data.split(":")[1];
                 var number = refresh(splitElement);

                 if (number==0){
                     SYS_talk("您的好友"+splitElement+"已经上线！！");
                 }

             } else {
                 B_talk(event.data);
                 var splitElement = event.data.split("|")[1];
                 refresh(splitElement);

             }
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
<script type="text/javascript">
    $(function(){

        A_talk=function(){

            var vals=$('#talkwords').val()
            if (vals=='')
            {
                alert('请输入数据！')
                return
            }
            var str=""
            //选择A发送还是B发送
                str='<div class="atalk"><span>A：'+ vals+'</span></div>'

            //原有的内容+str,否则会覆盖掉原有内容
            $('#words').html($('#words').html()+str)
            var item = sessionStorage.getItem(toname);
            if (item!=null){
                str=item+str;
            }
            sessionStorage.setItem(toname,str);

            //发送完数据后清空输入框
            $('#talkwords').val('')
        }

        B_talk=function(string){


            var str=""
            str='<div class="btalk"><span>'+ string+'</span></div>'

            var splitElement = string.split("|")[1];
            var item = sessionStorage.getItem(splitElement);
            if (item!=null){
                str=item+str;
            }
            if (splitElement==toname){
                //原有的内容+str,否则会覆盖掉原有内容
                $('#words').html($('#words').html()+str)
                //发送完数据后清空输入框
                $('#talkwords').val('')
            }
            sessionStorage.setItem(splitElement,str);

            //发送完数据后清空输入框

        }

        SYS_talk=function(string){


            var str=""
            str='<div class="systalk"><span>'+ string+'</span></div>'
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
<script type="text/javascript">
    showChat=function (name) {
        toname=name

        $("#who").text(name);
        $("#showBox").css("display","block");
        var history = sessionStorage.getItem(toname);
        if (history==null){

        }else {
            $("#words").html(history);
        }

    }

    refresh=function (user) {
        var flag=0;
        if (user==fromname){
            return 3;
        }
        for(var j = 0; userList[j]!=null; j++) {
            if (userList[j]==user ){
                flag=1;
            }
        }
        if (flag==1){
            return 0;
        }else {
            alert("好友列表里没有"+user);

            userList.push(user);
            var str="  <li onclick='showChat(\""+user+"\")'>\n" +
                "                                                   <div class=\"panel panel-default margin-10\" style=\"height:40px;width:240px; border-color:#329AA1;border-width: 2px;text-align: center;vertical-align:center \"  >\n" +
                "                                                       <h4>"+user+"</h4>\n" +
                "\n" +
                "                                           </div>\n" +
                "                                           </li>\n";

            $("#userList").html($("#userList").html()+str)
            return 1;
        }
    }

    SYS_content=function(string){
        var split = string.split(":")[1];
        return split;
    }

    remind=function () {
        $.get(
            "userServlet",
            {   action:"remind",
                username:toname
            },
            function (result) {
                if (result="1"){
                    alert("成功通过邮箱提醒用户:"+toname);
                }
            },"text"
        )
    }
</script>
</html>