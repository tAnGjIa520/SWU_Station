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
          <h1>您好！${sessionScope.root.username}管理员</h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li ><a href="rootServlet?action=userList" class="active"><i class="fa fa-home fa-fw"></i>管理用户</a></li>
<%--
            <li ><a href="" class="active"><i class="fa fa-home fa-fw"></i>管理商品</a></li>
--%>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-content-container">
        <div class="templatemo-flex-row flex-content-row">
              <div class="templatemo-content-widget white-bg col-2">
                <h2 class="templatemo-inline-block" style="padding-left:45%">用户列表</h2>
                <hr>
                  <table class="table table-striped table-bordered templatemo-user-table">

                      <thead>
                      <tr>
                          <td>用户id</td>
                          <td>用户名</td>
                          <td>密码</td>
                          <td>邮箱</td>
                          <td>操作</td>
                      </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${requestScope.userList}" var="user">
                          <tr>
                              <td>${user.id}</td>
                              <td>${user.username}</td>
                              <td>${user.password}</td>
                              <td>${user.email}</td>
                              <td><a href="rootServlet?action=deleteUesr&id=${user.id}">删除</a></td>
                          </tr>
                      </c:forEach>
                      </tbody>
                  </table>
              <%--  <table>
                      <tr>
                          <td>用户id</td>
                          <td>用户名</td>
                          <td>密码</td>
                          <td>邮箱</td>
                          <td>操作</td>
                      </tr>
                <c:forEach items="${requestScope.userList}" var="user">
                    <tr>
                        <td>${user.id}</td>
                        <td>${user.username}</td>
                        <td>${user.password}</td>
                        <td>${user.email}</td>
                        <td><a href="rootServlet/action=deleteUesr&id=${user.id}">删除</a></td>
                    </tr>
                </c:forEach>
                  </table>--%>
              </div>
        </div>
        <%@ include file="../default/static/footer.jsp"%>

        </div>
      </div>
    </div>
<script>
  $(function () {




  })

</script>

  </body>
</html>