package edu.njust.dao;

import edu.njust.entity.Login;

public interface ILoginDao {
	public int findByName(Login login);
}
