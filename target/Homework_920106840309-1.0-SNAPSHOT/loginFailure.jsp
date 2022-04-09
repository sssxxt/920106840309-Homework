<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginFailure</title>
    <style>
        div {
            text-align: center;
            vertical-align: middle
        }
    </style>
</head>
<body>
<br><br><br><br><br><br><br><br>
<div>
    <h1>
        <% if (request.getAttribute("error_code") == "1") {%>
        密码不正确
        <%} else if (request.getAttribute("error_code") == "2") {%>
        用户不存在
        <%} else if (request.getAttribute("error_code") == "3") {%>
        校验码不正确
        <%} %>
        <br><br><br><br>
        <input type="button" onclick="window.location.href='login.jsp';" value="重新登录" style="width:80px;height:30px;">
    </h1>
</div>
</body>
</html>