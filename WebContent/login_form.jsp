<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログイン画面</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
	<%@ include file="header_login.jsp"%>
	<div class="center">
		<h1>ログイン画面</h1>

		<form action="UserManagementServlet" method="POST" autocomplete="off">
			ユーザー情報の入力<br>
			<table>
				<tr>
					<td><b>ユーザー名</b>:</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td><b>パスワード</b>:</td>
					<td><input type="password" name="password"></td>
				</tr>
			</table>
			<br>
			<button type="submit" name="ACTION" value="111">&ensp;ログイン&ensp;</button>
		</form>
		<br>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>