<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020-12-21
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="default/static/header.jsp"%>
</head>
<body>

<form action="userServlet" method="post">
    <input type="hidden" name="action" value="email">
    <input type="submit">

</form>
</body>
</html>
