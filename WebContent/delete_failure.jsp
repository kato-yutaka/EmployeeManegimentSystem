<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>�폜���s���</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = (String)request.getAttribute("CODE");
    %>
	<div class="center">
	<h1>�폜���s���</h1>
	<hr>
	<br>
	<p>�]�ƈ��R�[�h�F<%=emp_code%> �̏]�ƈ��͑��݂��܂���B</p>
	<form action="/EmployeeManegimentSystem/EmployeeManagementServlet" method="POST">
		<input type="submit" name="ACTION" value="�]�ƈ��ꗗ��">
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>