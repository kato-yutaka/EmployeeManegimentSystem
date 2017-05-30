
<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>ユーザー情報登録</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
	<script type="text/javascript">
	function checkForm($this) {
		var str = $this.value;
		while (str.match(/[^A-Z^a-z\d\-]/)) {
			str = str.replace(/[^A-Z^a-z\d\-]/, "");
		}
		$this.value = str;
	}
	</script>
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
		<h1>ユーザー情報登録</h1>
	</div>
	<form action="UserRegistServlet" method="POST" autocomplete="off">
		<table>
			<tr>
				<td><b><font size="4">従業員情報</font></b></td>
			</tr>
			<tr>
				<td id="bg-blue">ユーザーID:</td>
				<td><input type="text" name="ID" maxlength='24'  onInput="checkForm(this)"></td>
			</tr>
			<tr>
				<td id="bg-blue">パスワード:</td>
				<td><input type="text" name="PASS" maxlength='32'  onInput="checkForm(this)"></td>
			</tr>
		</table>
		<br>
		<div class="center">
			<button type="submit" value="regist" name="ACTION">ユーザ登録</button>
		</div>
	</form>
	<br>
	<form action="EmployeeManagementServlet" method="POST">
		<div class="center">
			<input type="submit" value="メニュー画面へ" name="ACTION">
		</div>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>
