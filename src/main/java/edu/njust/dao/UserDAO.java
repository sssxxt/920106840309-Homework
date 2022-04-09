package edu.njust.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.njust.entity.Login;

public class UserDAO {

    public List allUserInf() {
        List userList = new ArrayList();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/920106840309_jdbc";
            String username = "root";
            String password = "sxt20011203";
            conn = DriverManager.getConnection(url, username, password);

            pstmt = conn.prepareStatement("select * from user");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Login user = new Login();
                user.setName(rs.getString(2));
                user.setPwd(rs.getString(3));
                userList.add(user);
            }
            return userList;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null && conn.isClosed() == false) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
	
	
	

