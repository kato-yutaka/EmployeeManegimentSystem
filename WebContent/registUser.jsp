
<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>Insert title here</title>
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

<div class="center">
<h1>���[�U�[���o�^</h1>
</div>

<table>
	<tr><td><b><font size="4">�]�ƈ����</font></b></td></tr>
	<tr><td>���[�U�[ID</td><td><input type = "text" name = "emp_code" maxlength='4' ></td></tr>
	<tr><td>�p�X���[�h</td><td><input type = "text" name = "emp_code" maxlength='4'> </td></tr>
	</table>
<br>
<form action="EmployeeManagementServlet" method="POST">
	<div class="center">
		<input type="submit" value="�o�^" name="ACTION">
	</div>
	</form>
<br>
	<form action="EmployeeManagementServlet" method="POST">
	<div class="center">
		<input type="submit" value="���j���[��ʂ�" name="ACTION">
	</div>
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>
