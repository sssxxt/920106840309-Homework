<%@ page import="edu.njust.dao.CourseDAO" %><%--
  Created by IntelliJ IDEA.
  User: xxx
  Date: 2022/4/9
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>delCourse</title>
</head>
<body>
<%
    String[] s = request.getParameterValues("checkbox");
    System.out.println(s);
    if (s == null) {
        request.setAttribute("error_code", "4");    //没有选择删除项
        request.getRequestDispatcher("courseFailure.jsp").forward(request, response);
    } else if (s.length > 0) {
        new CourseDAO().deleteCourseInf(s);
%>
<br><br><br><br><br><br><br><br>
<h1>
    <div style="text-align: center">删除成功！</div>
</h1>
<br><br>
<div id="box" align="center"></div>
<%
    }
%>
</body>
<script>
    //5秒跳转页面
    var b = document.getElementById("box");
    b.innerHTML = "5秒跳转页面";
    var time = 5;
    //每隔一秒执行定时器
    var timer = setInterval(function () {
        if (time > 0) {
            time--;
            b.innerHTML = time + "秒跳转页面";
        } else {//终止定时器
            window.location.href = "http://localhost:8080/920106840309_Homework_war_exploded/allCourse.jsp";
            timer.clearInterval();
        }
    }, 1000);
</script>
</html>
