<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>courseFailure</title>
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
        <% if (request.getAttribute("error_code") == "4") {%>
        未选择删除项
        <% }else if (request.getAttribute("error_code") == "3") {%>
        有要素为空
        <%} else if (request.getAttribute("error_code") == "2") {%>
        课程性质有误
        <%} else if (request.getAttribute("error_code") == "1") {%>
        选课人数有误
        <%} %>
        <br><br><br><br>
        <input type="button" onclick="window.location.href='allCourse.jsp';" value="返回" style="width:80px;height:30px;">
    </h1>
</div>
</body>
</html>