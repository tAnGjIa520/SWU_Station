<%--
  Created by IntelliJ IDEA.
  User: fffight
  Date: 2021-01-04
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    var iptGood=document.getElementById('txt-Good');
    var iptPrice=document.getElementById('txt-price');
    var tipGood=document.getElementById('tipGood');
    var tipPrice=document.getElementById('tipPrice');

    $("#txt-Good").blur(function () {
        setGood();
    })

    $("#txt-price").blur(function () {
        setPrice();
    })

    //设置商品
    function setGood() {
        var r=/^$/;
        var p=r.test(iptGood.value);
        if(p){
            tipGood.style.display="inline-block";
            iptGood.focus();
            return true;
        }
        else{
            tipGood.style.display="none";
            iptGood.focus();
            return false;
        }
    }


    //设置价格
    function setPrice(){
        var  r=/^[0-9]*[1-9][0-9]*$/;
        var  p=r.test(iptPrice.value);
        if (!p){
            tipPrice.style.display = 'inline-block';
            iptPrice.focus();
            return false;
        }
        else{
            tipPrice.style.display = 'none';
            iptPrice.focus();
            return true;
        }
    }



</script>
