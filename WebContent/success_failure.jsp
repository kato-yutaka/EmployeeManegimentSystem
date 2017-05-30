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
		String access = (String) session.getAttribute("ACCESS");
		if (access == null) {
			response.sendRedirect("unauthorized_access.jsp");
		}
	%>

	<%@ include file="header.jsp"%>
	<div class="center">
		<h1>ユーザー情報の登録に失敗しました</h1>
		<br>
		<p>ユーザIDまたはパスワードが未入力か、既存のIDが入力されました。</p>
		<br>
		<form action="UserRegistServlet" method="POST">
			<button type="submit" name="ACTION" value="add_user">ユーザ登録画面へ</button>
		</form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>