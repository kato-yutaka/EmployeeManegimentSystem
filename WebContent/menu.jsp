<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="Windows-31J">
<title>menu</title>
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

<form  method="POST" action="EmployeeSelectServlet" name = "a">
<input type="hidden" name="ACTION" value="従業員一覧・削除">
</form>


<form  method="POST" action="RegistEmployeeServlet" name = "b">
<input type="hidden" name="ACTION" value="従業員登録">
</form>

<form  method="POST" action="EmployeeManagementServlet" name = "c">
<input type="hidden" name="ACTION" value="ログアウト">
</form>

<form  method="POST" action="UserRegistServlet" name = "d">
<input type="hidden" name="ACTION" value="add_user">
</form>

	<div align="center">
		<h1>メニュー画面</h1>

		<table class="s-tbl"  >

			<tr bgcolor="D3EDFB	">
				<th></th>
				<th width="200">タイトル</th>
				<th width="300">概要</th>
			</tr>


			<tr >
             <td><a href= "javascript:document.forms['a'].submit();"><img src="delete.png" width="70" height="70"></a></td>
             <td align="center">従業員一覧・削除</td>
             <td align="center">従業員の一覧を表示します。<br>従業員の削除をします。</td>
            </tr>

            <tr >
             <td><a href= "javascript:document.forms['b'].submit();"><img src="regist.png" width="70" height="70"></a></td>
             <td align="center">従業員登録</td>
             <td align="center">従業員の登録を行います。</td>
            </tr>

            <tr >
             <td><a href= "javascript:document.forms['c'].submit();"><img src="logout.png" width="70" height="70"></a></td>
             <td align="center">ログアウト</td>
             <td align="center">ログアウトします</td>
			</tr>

			<tr >
             <td><a href= "javascript:document.forms['d'].submit();"><img src="logout.png" width="70" height="70"></a></td>
             <td align="center">ユーザー情報登録機能</td>
             <td align="center">ユーザー情報登録する機能です。</td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>