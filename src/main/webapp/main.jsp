<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>loginSuccess</title>
</head>
<body>
<br><br><br><br><br><br><br><br>
<h1>
    <div style="text-align: center;">登录成功！</div>
</h1>
<br><br>
<div id="box" align="center"></div>
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