<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>不正アクセス</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
	<%@ include file="header_login.jsp"%>
	<%
		request.setCharacterEncoding("Windows-31J");
		String emp_code = (String) request.getAttribute("CODE");
	%>
	<div class="center">
		<h1>不正アクセス画面</h1>

		<br> <font size="5" color="red">不正なアクセスが行われました。<br>
			正規の手続き（ログイン）を行ってください。
		</font> <br> <br>
		<form action="UserManagementServlet" method="POST">
			<button type="submit" name="ACTION" value="222">ログイン画面へ</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>