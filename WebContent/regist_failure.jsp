<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>登録失敗画面</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div class="center">
	<h1>登録失敗画面</h1>
	<hr>
	<br>

	<form action="registEmployee.jsp" method="POST">
		<p>従業員情報の登録に失敗しました。</p>
		<input type="submit" name="ACTION" value="登録画面へ">
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>