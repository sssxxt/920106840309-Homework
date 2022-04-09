<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>addCourse</title>
</head>
<body>
<br><br><br><br>
<h2>
    <center>新增课程信息</center>
</h2>
<br><br>
<form action="CourseController" method="post">
    <table align="center" valign="middle">
        <tr>
            <td width="80" height="50" align="center">课程名称：</td>
            <td width="80"><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td width="80" height="50" align="center">选课人数：</td>
            <td width="80"><input type="text" name="num"/></td>
        </tr>
        <tr>
            <td width="80" height="50" align="center">课程性质：</td>
            <td width="80"><input type="text" name="type"/></td>
        </tr>
    </table>
    <br><br>
    <center><input type="submit" value="确定" style="width:80px; height:30px;"></center>
</form>
</body>

</html>