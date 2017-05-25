package entity;

import Exception.DeleteException;
import dao.EmployeeDAO;

public class Remove {
	private String emp_code;

	public Remove(String emp_code){
		this.emp_code = emp_code;
	}

	public boolean removeEmployee(){
		boolean del_fin = true;

		try{
			EmployeeDAO dao = new EmployeeDAO();
			dao.deleteEmployee(emp_code);
		}catch(DeleteException del_fail){
			del_fin = del_fail.deleteException();
		}

		return del_fin;
	}
}
