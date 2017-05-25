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

	        employeeBean.get

	        try(Connection con = cm.getConnection();
	                Statement stmt = con.createStatement()) {

	            ResultSet res = stmt.executeQuery("INSRT INTO VALUES(employees));

	            // 結果の取得
	            while(res.next()) {
	                EmployeeBean employee = new EmployeeBean();
	                employee.setCode(res.getString("code"));
	                employee.setName(res.getString("name"));
	                employee.setAge(res.getInt("age"));
	                employee.setSection(res.getString("section"));

	                employeeList.add(employee);
	            }

	        // SQLに関する例外処理
	        } catch(SQLException e) {
	            System.out.println("処理結果：異常が発生しました。");
	            e.printStackTrace();
	        }
	        return employeeList;

	}

}
