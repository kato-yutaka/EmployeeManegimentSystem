<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>削除完了画面</title>
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
	<%
		request.setCharacterEncoding("Windows-31J");
		String emp_code = (String) request.getAttribute("CODE");
	%>
	<div class="center">
		<h1>削除完了画面</h1>

		<br>
		<p>
			従業員コード：<%=emp_code%>
			を削除しました。
		</p>
		<form action="EmployeeManagementServlet" method="POST">
			<button type="submit" name="ACTION" value="従業員一覧へ">&ensp;従業員一覧へ&ensp;</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>