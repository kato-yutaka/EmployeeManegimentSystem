<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="Windows-31J">
	<title>menu</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%-- �s���A�N�Z�X�h�~ --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>
	<div align="center">
		<h1>���j���[���</h1>
		<table>
		<form action="EmployeeSelectServlet" method="POST">
				<tr><td><input type="submit" value="�]�ƈ��ꗗ�E�폜" name="ACTION"></td></tr>
		</form>
		<form action="RegistEmployeeServlet" method="POST">
				<tr><td><input type="submit" value="�]�ƈ��o�^" name="ACTION"></td></tr>
		</form>
		<form action="EmployeeManagementServlet" method="POST">
				<tr><td><input type="submit" value="���O�A�E�g" name="ACTION"></td></tr>
		</form>
		</table>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>