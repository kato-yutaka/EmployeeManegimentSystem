<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>�o�^���s���</title>
</head>
<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div>
	<center>
	<h1>�o�^���s���</h1>
	<hr>
	<br>

	<form action="registEmployee.jsp" method="POST">
		<p>�]�ƈ����̓o�^�Ɏ��s���܂����B</p>
		<input type="submit" name="ACTION" value="�o�^��ʂ�">
	</form>
	</center>
	</div>
</body>
</html>