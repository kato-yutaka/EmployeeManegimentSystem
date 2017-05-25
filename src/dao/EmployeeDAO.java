package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.EmployeeBean;

public class EmployeeDAO {

	public void insertEmployee(EmployeeBean employeeBean){

		 ConnectionManager cm = ConnectionManager.getInstance();
		 try (Connection con = cm.getConnection(); Statement stmt = con.createStatement())
		 {
			 String emp_code  = employeeBean.getCode();
			 String l_name = employeeBean.getL_name();
			 String f_name = employeeBean.getF_name();
			 String l_kana_name = employeeBean.getL_kana_name();
			 String f_kana_name = employeeBean.getF_kana_name();
			 int sex = employeeBean.getSex();
			 String section_code = employeeBean.getSection_code();
			 Date emp_date = employeeBean.getEmp_date();
			 Date update_date = employeeBean.getEmp_date();
			 int count = stmt.executeUpdate("INSERT INTO VALUES(\'"+ emp_code + "\',\'"+ l_name +  "\',\'"+ f_name
					 + "\',\'"+ l_kana_name + "\',\'"+ f_kana_name + "\',\'"+ sex + "\',\'"+ section_code + "\',\'"+ emp_date
					 + "\',\'"+ update_date + "\'");

		 } catch(SQLException e) {
	            System.out.println("処理結果：異常が発生しました。");
	            e.printStackTrace();
	     }


	}

	public ArrayList<EmployeeBean> selectEmployee() {
		ConnectionManager cm = ConnectionManager.getInstance();

		ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try (Connection con = cm.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = stmt.executeQuery("SELECT * FROM emp_sys_db.m_employee t1 LEFT OUTER JOIN emp_sys_db.m_section  t2 ON  t1.section_code = t2.section_code ");

			while (res.next()) {
				EmployeeBean employee = new EmployeeBean();
				employee.setCode(res.getString("emp_code"));
				employee.setName(res.getString("l_name") + res.getString("f_name"));
				employee.setSex(res.getByte("sex"));
				employee.setName_kana(res.getString("l_kana_name") + res.getString("f_kana_name"));
				employee.setBirth_day(res.getDate("Birth_day"));
				employee.setSection_code(res.getString("section_name"));
				employee.setEmp_date(res.getDate("emp_date"));
				employeeList.add(employee);
			}
		} catch(SQLException e) {
            System.out.println("処理結果：異常が発生しました。");
            e.printStackTrace();
        }
        return employeeList;
		}

	@SuppressWarnings("finally")
	public boolean deleteEmployee(String emp_code, boolean del_fin) throws Exception {

		// データベースへの接続の取得
		ConnectionManager cm = ConnectionManager.getInstance();

		// データベースへの接続の取得、ステートメント取得
		try (Connection con = cm.getConnection();
			Statement stmt = con.createStatement();
			ResultSet res = stmt.executeQuery("SELECT * FROM m_employee WHERE emp_code = "+emp_code)){

			// 従業員削除
			if(res.next() == true){
				stmt.executeUpdate("DELETE FROM m_employee WHERE emp_code = "+emp_code);
				del_fin = true;
			}

		// 例外処理
		} catch (SQLException e){
			del_fin = false;

		} finally {
			return del_fin;
		}
	}

	public ArrayList<EmployeeBean> selectSection() {
		ConnectionManager cm = ConnectionManager.getInstance();

		ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try (Connection con = cm.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = stmt.executeQuery("SELECT section_name FROM m_section");

			while (res.next()) {
				EmployeeBean employee = new EmployeeBean();
				employee.setSection_name(res.getString("section_name"));
				employeeList.add(employee);
			}
		} catch(SQLException e) {
            System.out.println("処理結果：異常が発生しました。");
            e.printStackTrace();
        }
        return employeeList;
		}

}


