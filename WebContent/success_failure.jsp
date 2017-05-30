<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ユーザー情報登録失敗</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%-- 不正アクセス防止 --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>

<%@ include file="header.jsp" %>
	<div class="center">
        <h1>ユーザー情報の登録に失敗しました</font></h1>

	        <form action="EmployeeManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="メニュー画面へ">
	            <input type="submit" value="メニュー画面へ">
	        </form>
	    </div>
<%@ include file="footer.jsp" %>
</body>
</html>