<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>�폜�������</title>
</head>
<body>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div>
	<h1>�폜�������</h1>
	<hr>
	<br>
	<form action="/EmployeeManegimentSystem/EmployeeManagementServlet" method="POST">
		<p><%=emp_code%>���폜���܂����B</p>
		<input type="submit" name="ACTION" value="�@�]�ƈ��ꗗ�ց@">
	</form>
	</div>
</body>
</html>