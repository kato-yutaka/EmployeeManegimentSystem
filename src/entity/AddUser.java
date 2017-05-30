package entity;

import java.util.ArrayList;

import dao.UserDAO;

public class AddUser {
	public AddUser() {

	}

	public boolean addUser(String user_id, String password) {
		try {
			UserDAO dao = new UserDAO();
			boolean flag = dao.insertUser(user_id, password);
			return flag;
		} catch (Exception e) {
			return false;
		}
	}

	public boolean overlapError(String user_id) {
		UserDAO dao = new UserDAO();
		ArrayList<UserBean> list = new ArrayList<UserBean>();
		boolean error = false;
		list = dao.selectUser();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getUserId().equals(user_id)) {
				error = true;
			}
		}
		return error;

	}
}
