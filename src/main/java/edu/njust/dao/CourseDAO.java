package edu.njust.dao;

import edu.njust.entity.Course;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public List allCourseInf() {
        List courseList = new ArrayList();
        Connection conn = null;
        ResultSet rs;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/920106840309_jdbc";
            String username = "root";
            String password = "sxt20011203";
            conn = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = conn.prepareStatement("select * from course");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt(1));
                course.setName(rs.getString(2));
                course.setNum(rs.getInt(3));
                course.setType(rs.getString(4));
                courseList.add(course);
            }
            return courseList;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    public void addCourseInf(String name, String num, String type) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/920106840309_jdbc";
            String username = "root";
            String password = "sxt20011203";
            conn = DriverManager.getConnection(url, username, password);
            String sql = "insert into course(cName, cNum, cType) values(" + "'" + name + "'," + Integer.parseInt(num) + ",'" + type + "')";
            Statement stmt = conn.createStatement();
            stmt.executeUpdate(sql);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public void deleteCourseInf(String[] s) {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/920106840309_jdbc";
            String username = "root";
            String password = "sxt20011203";
            conn = DriverManager.getConnection(url, username, password);
            Statement stmt = conn.createStatement();
            for (int i = 0; i < s.length; i++) {
                String sql = "delete from course where cId =" +Integer.parseInt(s[i]) + "";
                stmt.executeUpdate(sql);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && !conn.isClosed()) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
