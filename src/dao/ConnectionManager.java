package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

	private final static String URL = "jdbc:mysql://localhost/emp_sys_db";
	private final static String USER = "root";
	private final static String PASSWORD = "root";

	private Connection connection = null;

	private static ConnectionManager instance = new ConnectionManager();

	private ConnectionManager() {
	}

	public static synchronized ConnectionManager getInstance() {
		return instance;
	}

	// throws Exception
	public Connection getConnection() {

		String drv = "com.mysql.jdbc.Driver";
		try {
			// JDBCドライバのロード
			Class.forName(drv);
		} catch (ClassNotFoundException e) {
			System.out.println("ドライバがありません" + e.getMessage());
		}

		try {
			if (connection == null || connection.isClosed()) {
				connection = DriverManager.getConnection(URL, USER, PASSWORD);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			connection = null;
		}
		return connection;
	}

	/**
	 * DBの切断.
	 */
	public void closeConnection() {
		try {
			if (connection != null) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			connection = null;
		}
	}
}