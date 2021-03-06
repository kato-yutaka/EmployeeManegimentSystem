<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>ログアウト</title>
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
	<%-- アクセス認証(セッション)破棄 --%>
	<%
	session.removeAttribute("ACCESS");
	session.invalidate();
	%>
	<%@ include file="header_login.jsp"%>

	<div class="center">
		<h1>ログアウトしました</h1>

		<p>システムを利用するには再度ログインしてください。</p>
		<form action="UserManagementServlet" method="POST">
			<br>
			<button type="submit" name="ACTION" value="222">&ensp;ログイン画面へ&ensp;</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>