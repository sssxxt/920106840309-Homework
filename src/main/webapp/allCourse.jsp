<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.*, edu.njust.entity.Course,edu.njust.dao.CourseDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>allCourse</title>
</head>
<body>
<br>
<h1>
    <div style="text-align: center;">课程信息</div>
</h1>
<br>
<form action="delCourse.jsp" method="post">
    <table bgcolor="white" width="500" height="300" border="1" align="center">
        <tr>
            <td align="center"></td>
            <td align="center">序号</td>
            <td align="center">课程名称</td>
            <td align="center">选课人数</td>
            <td align="center">课程性质</td>
        </tr>
        <%
            List<Course> list = new CourseDAO().allCourseInf();
            for (Course course : list) {
        %>
        <tr>
            <td align="center"><label for="<%=course.getId()%>"></label><input type="checkbox"
                                                                               name="checkbox"
                                                                               style="height: 18px;width: 18px;"
                                                                               value="<%=course.getId()%>">
            </td>
            <td align="center"><%= course.getId() %>
            </td>
            <td align="center"><%= course.getName() %>
            </td>
            <td align="center"><%= course.getNum() %>
            </td>
            <td align="center"><%= course.getType() %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
<br><br><br>
<table align="center">
    <tr>
        <td align="center" width="200"><input type="button" onclick="window.location.href='addCourse.jsp';" value="新增"
                                              style="width:80px;height:30px;"></td>
        <td align="center" width="200"><input type="submit" onclick="window.location.href='delCourse.jsp';" value="删除"
                                              style="width:80px;height:30px;"></td>
    </tr>
</table>
</form>
</body>
</html>