<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>���O�C�����s</title>
</head>
<body>
	<div align="center">
	        <font size="6">���O�C�����s���܂���</font>
	    </div>
	    <div align="center">
	    	UserId�܂���PassWord���Ԉ���Ă��܂��B<br>
	    	���O�C����ʂɖ߂�A������x���͂��Ă��������B
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="���O�C����ʂ�">
	        </form>
	    </div>
</body>
</html>