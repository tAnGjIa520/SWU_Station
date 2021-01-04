<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html lang="en">
<head>
    <title>SETGood</title>
    <style type="text/css">
        span{color: red;font-size: 12px;display:none;}
        .set_class{position: relative; left: 80px;}
    </style>
    <%@ include file="default/static/header.jsp"%>
</head>
<body class="light-gray-bg">
<div class="templatemo-content-widget templatemo-login-widget white-bg">
    <header class="text-center">
        <div class="square"></div>
        <h1>修改商品</h1>
    </header>

    <form action="goodServlet?" class="templatemo-login-form" method="get">
        <input type="hidden" name="action" value="updateGood">
        <input type="hidden" name="goodid" value="${requestScope.good.id}">
        <!--===商品名字=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">商品名&nbsp</div>

                <input type="text" class="form-control" id="txt-Good" name="goodname" placeholder="${requestScope.good.goodname}" value="${requestScope.good.goodname}">
            </div>
            <span id="tipGood" class="set_class">商品名不能为空！</span>
        </div>
        <!--===价格=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">价格&nbsp&nbsp&nbsp&nbsp</div>

                <input type="text" class="form-control" id="txt-price" name="price" value="${requestScope.good.price}">
            </div>
            <span id="tipPrice" class="set_class">价格不能为空且必须为数字！</span>
        </div>
        <!--===描述=============================-->
        <div class="form-group">
            <div class="input-group">
                <div class="input-group-addon">描述&nbsp&nbsp&nbsp&nbsp</div>
                <input type="text" class="form-control" name="description" value="${requestScope.good.description}">
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="templatemo-blue-button width-100">确认修改</button>
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