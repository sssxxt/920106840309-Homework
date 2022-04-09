package edu.njust.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import edu.njust.entity.Login;

public class LoginDaoImpl implements ILoginDao {
    public LoginDaoImpl() {

    }

    public int findByName(Login login) {
//		int result = 2; 				//用户不存在
//		Map<String, Object> map = null;
//		Map<String, Object> whereMap = new HashMap<>();
//		whereMap.put("name", login.getName());
//		try {
//		   List<Map<String, Object>> list = DBUtil.query("users",whereMap);
//		   int size = list.size();
//		   if(size == 1){
//			   map = list.get(0);
//			   result = 1; //用户存在
//			   if(map.get("pwd").equals(login.getPwd())){
//		    		 result = 0; //用户存在,密码正确
//		       }
//		   }

        int result = 2;                //用户不存在
        List<Login> list = new UserDAO().allUserInf();
        for (int i = 0; i < list.size(); i++) {
            Login us = (Login) list.get(i);
            if (us.getName().equals(login.getName())) {
                result = 1; //用户存在
                if (us.getPwd().equals(login.getPwd())) result = 0; //用户存在,密码正确
            }
        }
//	     } catch (SQLException e) {
//	         e.printStackTrace();
//	     } catch (Exception e){
//	         e.printStackTrace();
//	     }		
        return result;
    }

    // do unit test here
//	public static void main(String[] args) {
//		LoginDaoImpl dao = new LoginDaoImpl();
//		Login login = new Login("Ruth Wright","RHnBv48GNQ");
//		int result = dao.findByName(login);
//		System.out.println("用户信息验证结果："+result);
//	}    
}

