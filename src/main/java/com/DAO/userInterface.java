package com.DAO;

import com.entity.User;

public interface userInterface {
	public boolean userRegister(User us);
	
	public User userLogin(User us);
	
	public User getUserByID(int id);
	
	public boolean userUpdate(User us);
	
}
