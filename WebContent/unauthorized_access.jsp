<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>�s���A�N�Z�X</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
	<%@ include file="header_login.jsp"%>
	<%
		request.setCharacterEncoding("Windows-31J");
		String emp_code = (String) request.getAttribute("CODE");
	%>
	<div class="center">
		<h1>�s���A�N�Z�X���</h1>

		<br> <font size="5" color="red">�s���ȃA�N�Z�X���s���܂����B<br>
			���K�̎葱���i���O�C���j���s���Ă��������B
		</font> <br> <br>
		<form action="UserManagementServlet" method="POST">
			<button type="submit" name="ACTION" value="222">���O�C����ʂ�</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>