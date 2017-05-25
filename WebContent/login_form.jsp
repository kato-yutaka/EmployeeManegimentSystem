<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ログイン画面</title>
	</head>
	<body>
		<h1>従業員管理システム</h1>
		<hr>
		<form action="UserManagementServlet" method="POST" >
		<input type="hidden" name="ACTION" value="111">
		ユーザー情報の入力<br>
			<table>
				<tr><td>UserName<input type="text" name="id"></td></tr>
				<tr><td>PassWord<input type="password" name="password"></td></tr>
				<tr><td><input type="submit" value="ログイン"></td></tr>
			</table>
		</form>
	</body>
</html>