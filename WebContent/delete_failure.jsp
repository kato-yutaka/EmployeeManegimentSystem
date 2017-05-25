<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>削除失敗画面</title>
</head>
<body>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div>
	<h1>削除失敗画面</h1>
	<hr>
	<br>
	<form action="/EmployeeManegimentSystem/EmployeeManagementServlet" method="POST">
		<p><%=emp_code%>を削除できませんでした。</p>
		<input type="submit" name="ACTION" value="　従業員一覧へ　">
	</form>
	</div>
</body>
</html>