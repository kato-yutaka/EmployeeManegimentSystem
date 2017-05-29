<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログイン失敗</title>
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
	        <h1>ログイン失敗しました</h1>

	    	<p>UserIdまたはPassWordが間違っています。<br>
	    	ログイン画面に戻り、もう一度入力してください。</p>
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="ログイン画面へ">
	        </form>
	    </div>
<%@ include file="footer.jsp" %>
</body>
</html>