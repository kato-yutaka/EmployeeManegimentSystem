<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<%@ page import="servlet.UserManagementServlet"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>従業員一覧画面</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">

	<script type="text/javascript">
	function DeleteCheck() {
		<%--確認ダイアログを表示--%>
		if (window.confirm('削除してよろしいですか？')) {
			<%--「OK」時は送信を実行 --%>
			return true;
		}else { <%--「キャンセル」時の処理 --%>
			<%-- 警告ダイアログを表示 --%>
			window.alert('キャンセルされました');
			<%-- 送信を中止 --%>
			return false;
		}
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
		<h1>従業員一覧画面</h1>
		<table class="list">
			<tr bgcolor="#adff2f">
				<th>従業員コード</th>
				<th>氏名</th>
				<th>氏名(フリガナ)</th>
				<th>性別</th>
				<th>生年月日</th>
				<th>所属部署</th>
				<th>入社日</th>
				<th>削除</th>
			</tr>

			<%
				ArrayList<EmployeeBean> employeList = (ArrayList<EmployeeBean>) request.getAttribute("employeList");
				if (employeList != null) {
					for (int i = 0; i < employeList.size(); i++) {
						EmployeeBean employee = employeList.get(i);
			%>

			<form action="EmployeeDeleteServlet" method="POST"
				onSubmit="return DeleteCheck()">

				<%
					if (i % 2 == 0) {
				%>
				<tr bgcolor=" #EFEFEF">
					<%
						} else {
					%>

				<tr>
					<%
						}
					%>
					<td style="width: 130px"><%=employee.getCode()%></td>
					<%--従業員コードを出力 --%>
					<td style="width: 170px;"><%=employee.getName()%></td>
					<%--名前を出力: --%>
					<td style="width: 170px;"><%=employee.getName_kana()%></td>
					<%--名前(カナ)を出力 --%>
					<td style="width: 50px;">
						<%
						if (employee.getSex() == 0) {
						%> <%--性別を判定 --%> <%="男"%> <%--選択が0だったら男を出力 --%> <%
 						} else {
 						%> <%="女"%> <%--その他だったら女を出力--%> <%
 						}
 						%>
					</td>
					<td style="width: 130px;"><%=employee.getBirth_day()%></td>
					<%--生年月日を出力 --%>
					<td style="width: 100px"><%=employee.getSection_code()%></td>
					<%--所属部署を出力 --%>
					<td style="width: 130px;"><%=employee.getEmp_date()%></td>
					<%--入社日を出力 --%>
					<td class="q"><button type="submit" name="ACTION"
							value=<%=employee.getCode()%>>削除</button></td>
				</tr>

			</form>
			<%
				}
			%>
			<%
				}
			%>
		</table>
		<br>
		<br>
		<br>
		</div>
		<form style="position:fixed; top:150px; right:0; z-index:1;" action="EmployeeManagementServlet" method="POST" name="menu">
			<input type="hidden" value="メニュー画面へ" name="ACTION">
			<a href="javascript:document.forms['menu'].submit();"><img src="picture/menu01.png" width="80" height="50"></a>
		</form>
	<%@ include file="footer.jsp"%>
</body>
</html>