package edu.njust.controller;

import edu.njust.dao.CourseDAO;
import edu.njust.service.CourseService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Objects;


public class CourseController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String num = request.getParameter("num");
        String type = request.getParameter("type");
        int result = 3;        //有要素为空
        if (!Objects.equals(name, "") && !Objects.equals(num, "") && !Objects.equals(type, "")) {
            result = new CourseService().validateAddInfo( num, type);
            if (result == 0) {
                new CourseDAO().addCourseInf(name, num, type);
                request.getSession().setAttribute("status", "1");    // 新增成功
                response.sendRedirect("allCourse.jsp");
            } else if (result == 1) {
                request.setAttribute("error_code", "1");    //选课人数有误
                request.getRequestDispatcher("courseFailure.jsp").forward(request, response);
            } else if (result == 2) {
                request.setAttribute("error_code", "2");    //课程性质有误
                request.getRequestDispatcher("courseFailure.jsp").forward(request, response);
            }
        } else if (result == 3) {
            request.setAttribute("error_code", "3");    //有要素为空
            request.getRequestDispatcher("courseFailure.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
