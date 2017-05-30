<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="servlet.UserManagementServlet"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
    <title>HEADER</title>
</head>
<body>
	<%
	String id = (String) session.getAttribute("ACCESS");
	%>
	<div align="left">
        <a href="menu.jsp" style="text-decortion:none;"><font size="6" color="blue">従業員管理システム</font></a>
    </div>
    <div align="right">
    	<font size="2">現在使用者(ユーザID)：<%=id %></font>
    </div>
	<hr>
	<br>
</body>
</html>