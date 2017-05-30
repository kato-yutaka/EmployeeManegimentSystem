package entity;

import dao.EmployeeDAO;

public class Remove {
	// コンストラクタ
	public Remove() {

	}

	// 従業員削除
	@SuppressWarnings("finally")
	public boolean removeEmployee(String emp_code) {
		// 削除確認フラグ
		boolean del_fin = false;

		try {

			EmployeeDAO dao = new EmployeeDAO();
			del_fin = dao.deleteEmployee(emp_code, del_fin);

		} catch (Exception e) {
			del_fin = false;

		} finally {
			return del_fin;
		}

	}
}
