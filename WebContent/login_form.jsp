<%@ page language="java" contentType="text/html; charset=Windows-31J"
pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
	<head>
    	<meta charset="Windows-31J">
		<title>���O�C�����</title>
		<link rel="stylesheet" href="emp_sys.css" type="text/css">
	</head>
	<body>
		<%@ include file="header.jsp" %>
		<div class="center">
		<h1>���O�C�����</h1>

		<form action="UserManagementServlet" method="POST" autocomplete="off">
		<input type="hidden" name="ACTION" value="111">
		���[�U�[���̓���<br>
			<table>
				<tr><td><b>���[�U�[��</b>:</td><td><input type="text" name="id"></td></tr>
				<tr><td><b>�p�X���[�h</b>:</td><td><input type="password" name="password"></td></tr>
			</table>
			<br>
			<input type="submit" value="���O�C��" >
		</form>
		<br>
		</div>
		<%@ include file="footer.jsp" %>
	</body>
</html>