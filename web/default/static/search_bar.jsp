<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2020-12-21
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="templatemo-search-form" role="search" action="searchServlet" method="post">
    <input type="hidden" name="action" value="search"><%--隐藏--%>
    <div class="input-group">
        <button type="submit" class="fa fa-search"></button>
        <input type="text" class="form-control" placeholder="Search" name="keyWords" id="srch-term" >
    </div>
</form>