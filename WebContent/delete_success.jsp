<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>�폜�������</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
	<%-- �s���A�N�Z�X�h�~ --%>
	<%
		String access = (String) session.getAttribute("ACCESS");
		if (access == null) {
			response.sendRedirect("unauthorized_access.jsp");
		}
	%>
	<%@ include file="header.jsp"%>
	<%
		request.setCharacterEncoding("Windows-31J");
		String emp_code = (String) request.getAttribute("CODE");
	%>
	<div class="center">
		<h1>�폜�������</h1>

		<br>
		<p>
			�]�ƈ��R�[�h�F<%=emp_code%>
			���폜���܂����B
		</p>
		<form action="EmployeeManagementServlet" method="POST">
			<button type="submit" name="ACTION" value="�]�ƈ��ꗗ��">&ensp;�]�ƈ��ꗗ��&ensp;</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>