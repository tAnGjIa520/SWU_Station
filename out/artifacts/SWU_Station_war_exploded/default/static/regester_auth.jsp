<%--
  Created by IntelliJ IDEA.
  User: fffight
  Date: 2021-01-04
  Time: 0:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    var iptName=document.getElementById('txt-name');
    var iptPwd=document.getElementById('pwd');
    var iptPwd2=document.getElementById('pwd2');
    var iptMailbox=document.getElementById('email');
    var tipName=document.getElementById('tip-name');
    var tipPwd=document.getElementById('tip-pwd');
    var tipPwd2=document.getElementById('tip-pwd2');
    var tipMailbox=document.getElementById('tip-Mailbox');

/*
    //对用户名和密码进行校验
    function valForm(){
        return valUserName()&&valPwd()&&valMailbox();
    }
*/
    $("#txt-name").blur(function () {
        valUserName();
    })

    $("#pwd").blur(function () {
        valPwd();
    })

    $("#pwd2").blur(function () {
        valPwd2();
    })

    $("#email").blur(function () {
        valMailbox();
    })


    //校验用户名
    function valUserName() {
        var p=/^\w\w{7,11}$/;//用户名必须为8-12为字母或数字
        var r=p.test(iptName.value);//校验
        if(!r){
            //校验不通过
            tipName.style.display='inline-block';//显示
            iptName.focus();
            return false;
        }
        else{
            tipName.style.display='none';
            return true;
        }
    }

    //校验密码
    function valPwd(){
        var p=/^\w\w{7,11}$/;//6位数字
        var r=p.test(iptPwd.value);//校验
        if(!r){
            tipPwd.style.display='inline-block';
            iptPwd.focus();//获取焦点
            return false;
        }
        else{
            tipPwd.style.display='none';
            return true;
        }
    }
//确认密码
    function valPwd2(){

       /* alert($("#pwd2").val());*/
       if($("#pwd2").val()==$("#pwd").val()){
           tipPwd2.style.display='none';
           return true;
       }
       else{
           tipPwd2.style.display='inline-block';
           tipPwd2.focus();
           return false;
       }
    }

    function valMailbox(){
        var reg = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
        var r=reg.test(iptMailbox.value);
        if(!r){
            tipMailbox.style.display='inline-block';
            iptMailbox.focus();
            return false;
        }
        else{
            tipMailbox.style.display='none';
            return true;
        }
    }

</script>
