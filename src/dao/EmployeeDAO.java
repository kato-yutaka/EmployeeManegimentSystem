package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.EmployeeBean;

public class EmployeeDAO {

	public void insertEmployee(EmployeeBean employeeBean){




		 ConnectionManager cm = ConnectionManager.getInstance();


	     //       ResultSet res = stmt.executeQuery("INSRT INTO VALUES(employees"));

	}

	public ArrayList<EmployeeBean> selectEmployee() {
		ConnectionManager cm = ConnectionManager.getInstance();

		ArrayList<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();

		try (Connection con = cm.getConnection(); Statement stmt = con.createStatement()) {

			ResultSet res = stmt.executeQuery("SELECT * FROM m_employee");

			while (res.next()) {
				EmployeeBean employee = new EmployeeBean();
				employee.setCode(res.getString("code"));
				employee.setName(res.getString("name"));
				employee.setSex(res.getByte("sex"));
				employee.setName_kana(res.getString("name_kana"));
				employee.setBirth_day(res.getDate("Birth_day"));
				employee.setSection_code(res.getString("section_code"));
				employee.setEmp_date(res.getTimestamp("emp_data"));
				employeeList.add(employee);
			}
		} catch(SQLException e) {
            System.out.println("処理結果：異常が発生しました。");
            e.printStackTrace();
        }
        return employeeList;
		}
	}

