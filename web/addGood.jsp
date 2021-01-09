<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html lang="en">
<head>
    <title>ADDGood</title>
    <%@ include file="default/static/header.jsp"%>
    <style type="text/css">
        .classA{position: relative; left: 80px;}
        span{color: red;font-size: 12px; display: none;}
    </style>

</head>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>添加商品</h1>
    </header>

    <form action="goodServlet?action=addGood" class="templatemo-login-form" method="post">
        <input type="hidden" name="action" value="addGood">
        <!--===商品名字=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">商品名&nbsp</div>
                <input type="text" class="form-control" name="goodname" id="txt-Good">
            </div>
            <span class="classA" id="tipGood">商品名不能为空！</span>
        </div>
        <!--===价格=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">价格&nbsp&nbsp&nbsp&nbsp</div>
                <input type="text" class="form-control" name="price" id="txt-price">
            </div>
            <span id="tipPrice" class="classA">价格不能为空且必须为数字！</span>
        </div>
        <!--===描述=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">描述&nbsp&nbsp&nbsp&nbsp</div>
                <input type="text" class="form-control" name="description">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">增加商品</button>
        </div>
    </form>
    <!--表单部分结束-->
</div>
<%@ include file="/default/static/footer.jsp"%>
</body>

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
</html>