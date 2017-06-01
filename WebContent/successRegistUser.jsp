<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>ユーザ登録完了</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
	<%-- 不正アクセス防止 --%>
	<%
		String access = (String) session.getAttribute("ACCESS");
		if (access == null) {
			response.sendRedirect("unauthorized_access.jsp");
		}
	%>
	<%@ include file="header.jsp"%>
	<div class="center">


		<h1>ユーザ登録完了しました。</h1>


		<form action="EmployeeManagementServlet" method="POST">
			<button type="submit" value="メニュー画面へ" name="ACTION">&ensp;メニュー画面へ&ensp;</button>
		</form>
	</div>
</body>
</html>