<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>menu</title>
<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body link="#000000">



	<%-- 不正アクセス防止 --%>
	<%
		String access = (String) session.getAttribute("ACCESS");
		if (access == null) {
			response.sendRedirect("unauthorized_access.jsp");
		}
	%>
	<%@ include file="header.jsp"%>

	<form method="POST" action="EmployeeSelectServlet" name="a">
		<input type="hidden" name="ACTION" value="従業員一覧・削除">
	</form>


	<form method="POST" action="RegistEmployeeServlet" name="b">
		<input type="hidden" name="ACTION" value="従業員登録">
	</form>

	<form method="POST" action="EmployeeManagementServlet" name="c">
		<input type="hidden" name="ACTION" value="ログアウト">
	</form>

	<form method="POST" action="UserRegistServlet" name="d">
		<input type="hidden" name="ACTION" value="add_user">
	</form>

	<div align="center">
		<h1>メニュー画面</h1>


		<table class="s-tbl">

			<tr bgcolor="#b0e0e6">
				<th></th>
				<th width="200">タイトル</th>
				<th width="300">概要</th>
			</tr>


			<tr>
				<td><a
					style="display: block; width: 100%; height: 73px; line-height: 150%"
					href="javascript:document.forms['a'].submit();"><img
						src="picture/userlist.png" width="70" height="70"></a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['a'].submit();">従業員一覧・削除</a></td>
				<td align="center"><a
					style="text-decoration: none; display: block; line-height: 73px"
					href="javascript:document.forms['a'].submit();">従業員の一覧を表示・削除を行います。
				</a></td>

			</tr>

			<tr>
				<td><a style="display: block; width: 100%; height: 73px;"
					href="javascript:document.forms['b'].submit();"><img
						src="picture/user.png" width="70" height="70"></a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['b'].submit();">従業員登録</a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['b'].submit();">従業員の登録を行います。</a></td>
			</tr>

			<tr>
				<td><a href="javascript:document.forms['d'].submit();"><img
						src="picture/user-add.png" width="70" height="70"></a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['d'].submit();">ユーザー情報登録</a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['d'].submit();">ユーザー情報登録を行います。</a></td>
			</tr>

			<tr>
				<td><a href="javascript:document.forms['c'].submit();"><img
						src="picture/logout.png" width="70" height="70"></a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['c'].submit();">ログアウト</a></td>
				<td align="center"><a
					style="top: 25%; text-decoration: none; display: block; width: 100%; height: 73px; line-height: 73px"
					href="javascript:document.forms['c'].submit();">ログアウトします</a></td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>