package edu.njust.service;

import edu.njust.dao.LoginDaoImpl;
import edu.njust.entity.Login;


public class LoginService {

    public LoginService() {

    }

    public int validateLoginInfo(Login login) {

        return new LoginDaoImpl().findByName(login);
    }
}
