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

	<%@ include file="header.jsp"%>


<%-- 不正アクセス防止 --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>


	<div align="center">
		<h1>メニュー画面</h1>
		<table class="s-tbl"  >

			<tr bgcolor="blue">
				<th></th>
				<th width="300">タイトル</th>
				<th width="500">概要</th>
			</tr>

			<tr>
             <td><a href="employeelist.jsp"><img src="delete.png" width="70" height="70"></a></td>
             <td>従業員一覧・削除</td>
             <td>従業員の一覧を表示します。<br>従業員の削除をします。</td>
            </tr>

            <tr>
             <td><a href="registEmployee.jsp"><img src="regist.png" width="70" height="70"></a></td>
             <td>従業員登録</td>
             <td>従業員の登録を行います。</td>
            </tr>

            <tr>
             <td><a href="logout.jsp"><img src="logout.png" width="70" height="70"></a></td>
             <td>ログアウト</td>
             <td>ログアウトします</td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>