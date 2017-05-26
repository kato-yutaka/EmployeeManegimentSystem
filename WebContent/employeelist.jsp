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
			<form action="EmployeeDeleteServlet" method="POST"  onSubmit="return DeleteCheck()">
				<tr>
					<td><%=employee.getCode()%></td>         <%--従業員コードを出力 --%>
					<td><%=employee.getName()%></td>         <%--名前を出力: --%>
					<td><%=employee.getName_kana() %></td>   <%--名前(カナ)を出力 --%>
					<td>
						<% if(employee.getSex() == 0) { %>  <%--性別を判定 --%>
						<%= "男" %>                              <%--選択が0だったら男を出力 --%>
						<% }else{ %>
						<%= "女" %>                               <%--その他だったら女を出力--%>
					<% } %>
					</td>
					<td><%=employee.getBirth_day() %></td>   <%--誕生日を出力 --%>
					<td><%=employee.getSection_code() %></td>     <%--所属部署を出力 --%>
					<td><%=employee.getEmp_date() %>  </td>       <%--入社日を出力 --%>

					<td><button type="submit" name="ACTION" value=<%=employee.getCode()%>>削除</button></td>
				</tr>
			</form>
			<% } %>
		<% } %>
		</table>
		<br>
		<form action="menu.jsp" method="POST">
			<input type="submit" value="メニュー画面へ" name="ACTION">
		</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>