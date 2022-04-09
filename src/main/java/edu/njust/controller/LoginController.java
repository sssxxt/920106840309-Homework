package edu.njust.controller;

import java.io.IOException;
import edu.njust.entity.Login;
import edu.njust.service.LoginService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        //System.out.println(session);

        //String checkcode = (String)session.getAttribute("checkword");
        String checkcode = request.getParameter("checkword");
        //System.out.println(checkcode);

        int result = 3; //校验码不正确
        String name = request.getParameter("uname");
        String pwd = request.getParameter("upwd");
        String code = request.getParameter("checkcode");

        if (code != null && code.equals(checkcode)) {
            Login login = new Login(name, pwd);
            result = new LoginService().validateLoginInfo(login);

            if (result == 0) {
                session.setAttribute("status", "1");    //登录成功
                response.sendRedirect("main.jsp");
            } else if (result == 1) {
                request.setAttribute("error_code", "1");    //密码不正确
                request.getRequestDispatcher("loginFailure.jsp").forward(request, response);
            } else if (result == 2) {
                request.setAttribute("error_code", "2");    //用户不存在
                request.getRequestDispatcher("loginFailure.jsp").forward(request, response);
            }
        } else if (result == 3) {
            request.setAttribute("error_code", "3");    //校验码不正确
            request.getRequestDispatcher("loginFailure.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
