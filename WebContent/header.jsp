<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="servlet.UserManagementServlet"%>

<!DOCTYPE html>
<html>
<head >
    <meta charset="Windows-31J">
    <title>HEADER</title>

</head>
<body>

	<%
	String id = (String) session.getAttribute("ACCESS");
	%>

	<div align="left" style="float:left;"  >
        <a href="menu.jsp" style="text-decoration:none;"><font size="6" color="blue">従業員管理システム</font></a>
    </div>
    <div align="right" style="float:right; margin-top:25px">
    	<font size="2">現在使用者(ユーザID)：<%=id %></font>
    </div>
	<hr style="clear:both;">
	<br>

</body>
</html>