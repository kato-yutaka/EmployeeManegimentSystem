<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>従業員一覧画面</title>
<link rel="stylesheet" href="emp_sys.css" type="text/css">

<script type="text/javascript">
function DeleteCheck(){
	if(window.confirm('送信してよろしいですか？')){ <%--確認ダイアログを表示--%>
		return true;  <%--「OK」時は送信を実行 --%>
	}
	else{ <%--「キャンセル」時の処理 --%>
		window.alert('キャンセルされました'); <%-- 警告ダイアログを表示 --%>
		return false;  <%-- 送信を中止 --%>
	}
}
</script>

</head>
<body>
<%@ include file="header.jsp" %>
	<div class="center">
		<h1>従業員一覧画面</h1>

		<br>
		<table border="1">
			<tr>
				<th>従業員コード</th>
				<th>氏名</th>
				<th>氏名(フリガナ)</th>
				<th>性別</th>
				<th>生年月日</th>
				<th>所属部署</th>
				<th>入社日</th>
			</tr>
			<%
                ArrayList<EmployeeBean> employeList = (ArrayList<EmployeeBean>) request.getAttribute("employeList");
                if(employeList != null) {
                    for(int i = 0; i < employeList.size(); i++) {
                        EmployeeBean employee = employeList.get(i);
            %>
			<form action="/EmployeeManegimentSystem/EmployeeDeleteServlet" method="POST"  onSubmit="return DeleteCheck()">
				<tr>
					<td><%=employee.getCode()%></td>
					<td><%=employee.getName()%></td>
					<td><%=employee.getName_kana() %></td>

					<td>
						<% if(employee.getSex() == 0) { %>
						<%= "男" %>
						<% }else{ %>
						<%= "女" %>
					<% } %>
					</td>
					<td><%=employee.getBirth_day() %></td>
					<td><%=employee.getSection_code() %>
					<td><%=employee.getEmp_date() %>
					<td><button type="submit" name="ACTION" value=<%=employee.getCode()%>>削除</button></td>
				</tr>
			</form>
			<% } %>
		<% } %>
		</table>
		<br>
		<form action="menu.html" method="POST">
			<input type="submit" value="メニュー画面へ" name="ACTION">
		</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>