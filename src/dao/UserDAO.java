package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import entity.UserBean;

public class UserDAO {

	public ArrayList<UserBean> selectUser() {
		ConnectionManager cm = ConnectionManager.getInstance();
		ArrayList<UserBean> userList = new ArrayList<UserBean>();
		try (Connection con = cm.getConnection(); Statement stmt = con.createStatement()) {
			ResultSet res = stmt.executeQuery("SELECT * FROM m_user");
			// 結果の取得
			while (res.next()) {
				UserBean user = new UserBean();
				user.setUserId(res.getString("user_id"));
				user.setPassword(res.getString("passward"));
				user.setUpdatedate(res.getString("update_date"));
				userList.add(user);
			}
			// SQLに関する例外処理
		} catch (SQLException e) {
			System.out.println("処理結果：異常が発生しました。");
			e.printStackTrace();
		}
		return userList;
	}

	public boolean insertUser(String user_id, String password) throws Exception {
		ConnectionManager cm = ConnectionManager.getInstance();
		try (Connection con = cm.getConnection();
				Statement stmt = con.createStatement();
				PreparedStatement pstmt = con.prepareStatement("INSERT INTO m_user VALUES(?, ?, ?)")) {
			// 更新日時の定義
			java.util.Date date = new java.util.Date();
			java.sql.Timestamp update_date = new java.sql.Timestamp(date.getTime());

			// プレースホルダの値を設定
			pstmt.setString(1, user_id);
			pstmt.setString(2, password);
			pstmt.setTimestamp(3, update_date);

			// SQLステートメントの実行（更新系）
			pstmt.executeUpdate();
			return true;

		// ファイルに関する例外処理
		} catch (SQLException e) {
			return false;
		}

	}

}
