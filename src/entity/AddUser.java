package entity;

import dao.UserDAO;

public class AddUser {
	public AddUser(){

	}

	public boolean addUser(){
		try{
			UserDAO dao = new UserDAO();
	        boolean flag = dao.insertUser();
	        return flag;
		}catch(Exception e){
			return false;
		}
	}
}
