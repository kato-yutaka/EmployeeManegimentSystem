<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログアウト </title>
</head>
<body>
	<div align="center">
	        <font size="6">ログアウトしました</font>
	    </div>
	    <div align="center">
	    	システムを利用するには再度ログインしてください。
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="ログイン画面へ">
	        </form>
	    </div>
</body>
</html>