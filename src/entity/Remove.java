package entity;

import Exception.DeleteException;
import dao.EmployeeDAO;

public class Remove {
	// 従業員コード
	private String emp_code;

	// コンストラクタ
	public Remove(String emp_code){
		this.emp_code = emp_code;
	}

	// 従業員削除
	@SuppressWarnings("finally")
	public boolean removeEmployee(){
		// 削除確認フラグ
		boolean del_fin = true;

		try{

			EmployeeDAO dao = new EmployeeDAO();
			dao.deleteEmployee(emp_code);
		
		// 例外処理（削除対象がない時）
		} catch (DeleteException del_fail){
			// 削除失敗時、false
			del_fin = del_fail.deleteException();

		} finally {
			return del_fin;
		}

	}
}
