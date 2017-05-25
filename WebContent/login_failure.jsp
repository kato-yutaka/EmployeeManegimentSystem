<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログイン失敗</title>
</head>
<body>
	<div align="center">
	        <font size="6">ログイン失敗しました</font>
	    </div>
	    <div align="center">
	    	UserIdまたはPassWordが間違っています。<br>
	    	ログイン画面に戻り、もう一度入力してください。
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="ログイン画面へ">
	        </form>
	    </div>
</body>
</html>