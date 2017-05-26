package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.UserBean;


public class UserDAO {

	 public ArrayList<UserBean> selectUser() {
		 //String id=null;
		 //String pass=null;
		 //String user[] = new String[2];

		 ConnectionManager cm = ConnectionManager.getInstance();

		 ArrayList<UserBean> userList = new ArrayList<UserBean>();

		 try(Connection con = cm.getConnection();
	                Statement stmt = con.createStatement()) {

	            ResultSet res = stmt.executeQuery("SELECT * FROM m_user");

	            // 結果の取得
	            while(res.next()) {
	                UserBean user = new UserBean();
	                //id = res.getString("user_id");
	                //pass = res.getString("password");
	                //配列に格納
	                //user[0]=res.getString("user_id");
	                //user[1]=res.getString("password");

	                user.setUserId(res.getString("user_id"));
	                user.setPassword(res.getString("passward"));
	                user.setUpdatedata(res.getString("update_date"));

	                userList.add(user);

	            }

	        // SQLに関する例外処理
	        } catch(SQLException e) {
	            System.out.println("処理結果：異常が発生しました。");
	            e.printStackTrace();
	        }

		return userList;

	 }

	 public String userId() {
		 String id=null;
		 //String pass=null;
		 //String user[] = new String[2];

		 ConnectionManager cm = ConnectionManager.getInstance();

		 ArrayList<UserBean> userList = new ArrayList<UserBean>();

		 try(Connection con = cm.getConnection();
	                Statement stmt = con.createStatement()) {

	            ResultSet res = stmt.executeQuery("SELECT * FROM m_user");

	            // 結果の取得
	            while(res.next()) {
	                UserBean user = new UserBean();
	                id = res.getString("user_id");
	                //pass = res.getString("password");
	                //配列に格納
	                //user[0]=res.getString("user_id");
	                //user[1]=res.getString("password");

	                user.setUserId(res.getString("user_id"));
	                user.setPassword(res.getString("passward"));
	                user.setUpdatedata(res.getString("update_data"));

	                userList.add(user);

	            }

	        // SQLに関する例外処理
	        } catch(SQLException e) {
	            System.out.println("処理結果：異常が発生しました。");
	            e.printStackTrace();
	        }

		return id;

	 }

	 public String passWord() {
		 //String id=null;
		 String pass=null;
		 //String user[] = new String[2];

		 ConnectionManager cm = ConnectionManager.getInstance();

		 try(Connection con = cm.getConnection();
	                Statement stmt = con.createStatement()) {

	            ResultSet res = stmt.executeQuery("SELECT * FROM m_user");

	            // 結果の取得
	            while(res.next()) {

	                pass = res.getString("passward");


	            }

	        // SQLに関する例外処理
	        } catch(SQLException e) {
	            System.out.println("処理結果：異常が発生しました。");
	            e.printStackTrace();
	        }

		return pass;

	 }
}
