package entity;

import dao.UserDAO;

public class AddUser {
	public AddUser(){

	}

	public boolean addUser(String user_id, String password){
		try{
			UserDAO dao = new UserDAO();
	        boolean flag = dao.insertUser(user_id, password);
	        return flag;
		}catch(Exception e){
			return false;
		}
	}
}
