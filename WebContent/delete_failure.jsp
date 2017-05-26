<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>削除失敗画面</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = (String)request.getAttribute("CODE");
    %>
	<div class="center">
	<h1>削除失敗画面</h1>
	<hr>
	<br>
	<p>従業員コード：<%=emp_code%> の従業員は存在しません。</p>
	<form action="/EmployeeManegimentSystem/EmployeeManagementServlet" method="POST">
		<input type="submit" name="ACTION" value="従業員一覧へ">
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>