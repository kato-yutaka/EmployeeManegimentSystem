package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.EmployeeBean;

public class EmployeeDAO {

	public void insertEmployee(EmployeeBean employeeBean){



		 /*int count = stmt.executeUpdate("INSERT INTO m_employee VALUES(\'"+ emp_code + "\',\'"+ l_name +  "\',\'"+ f_name
				 + "\',\'"+ l_kana_name + "\',\'"+ f_kana_name + "\',"+ sex + ",\'"+ birth_day + "\',\'"+ section_code + "\',\'"+ emp_date
				 + "\',CURRENT_TIMESTAMP");*/
		 ConnectionManager cm = ConnectionManager.getInstance();
		 try (Connection con = cm.getConnection();
				 Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO m_employee VALUES(?, ?, ?, ?, ? ,?, ?, ?, ?, ?)"))

					{
			 String emp_code  = employeeBean.getCode();
			 String l_name = employeeBean.getL_name();
			 String f_name = employeeBean.getF_name();

			 String l_kana_name = employeeBean.getL_kana_name();
			 String f_kana_name = employeeBean.getF_kana_name();
			 byte sex = employeeBean.getSex();
			 Date birth_day = employeeBean.getBirth_day();
			 String section_name = employeeBean.getSection_name();
			 String section_code = null;
			 System.out.println(emp_code);
  			System.out.println(l_name);
  			System.out.println(f_name);
  			System.out.println(sex);
  			System.out.println(l_kana_name);
  			System.out.println(f_kana_name);
  			System.out.println(birth_day);
  			System.out.println(section_name);
			 ResultSet res = stmt.executeQuery("SELECT section_code FROM m_section where section_name =\'" + section_name+ "\'");
			 System.out.println("result");
			 while (res.next()) {
			 section_code = res.getString("section_code");
			 System.out.println(section_code);
			 }

			 System.out.println("result2");
			 Date emp_date = employeeBean.getEmp_date();



			 //更新日時の定義
		     java.util.Date date = new java.util.Date();
		     java.sql.Timestamp update_date = new java.sql.Timestamp(date.getTime());
		     System.out.println(update_date);

						// プレースホルダの値を設定
						pstmt.setString(1, emp_code);
						pstmt.setString(2, l_name);
						pstmt.setString(3, f_name);
						pstmt.setString(4, l_kana_name);
						pstmt.setString(5, f_kana_name);
						pstmt.setByte(6, sex);
						pstmt.setDate(7, birth_day);
						pstmt.setString(8, section_code);
						pstmt.setDate(9, emp_date);
						pstmt.setTimestamp(10, update_date);

						// SQLステートメントの実行（更新系）
						try{
						int count = pstmt.executeUpdate();
						System.out.println(count + "件のデータを挿入しました。");
						// ファイルに関する例外処理
						}catch(SQLException e){
							System.out.println("以下のレコードを挿入できません。");
						}



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


