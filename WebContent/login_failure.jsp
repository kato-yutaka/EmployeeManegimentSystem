<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>���O�C�����s</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>

	<%@ include file="header_login.jsp"%>
	<div class="center">
		<h1>
			���O�C�����s���܂���
		</h1>

		<p>
			<b><font color="red">���[�UID</font></b>�܂���<b><font color="red">�p�X���[�h</font></b>���Ԉ���Ă��܂��B<br>
			���O�C����ʂɖ߂�A������x���͂��Ă��������B
		</p>
		<form action="UserManagementServlet" method="POST">
			<br> <button type="submit" name="ACTION" value="222">&ensp;���O�C����ʂ�&ensp;</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>