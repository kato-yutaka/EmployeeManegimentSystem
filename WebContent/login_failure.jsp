<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログイン失敗</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>

	<%@ include file="header_login.jsp"%>
	<div class="center">
		<h1>
			ログイン失敗しました
		</h1>

		<p>
			<b><font color="red">ユーザID</font></b>または<b><font color="red">パスワード</font></b>が間違っています。<br>
			ログイン画面に戻り、もう一度入力してください。
		</p>
		<form action="UserManagementServlet" method="POST">
			<br> <button type="submit" name="ACTION" value="222">&ensp;ログイン画面へ&ensp;</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>