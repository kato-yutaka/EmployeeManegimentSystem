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
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="center">
		<h1>従業員一覧画面</h1>
		<hr>
		<br>
		<table border="1">
			<tr>
				<td>従業員コード</td>
				<td>氏名</td>
				<td>氏名(フリガナ)</td>
				<td>性別</td>
				<td>生年月日</td>
				<td>所属部署</td>
				<td>入社日</td>
			</tr>
			<%
                ArrayList<EmployeeBean> employeList = (ArrayList<EmployeeBean>) request.getAttribute("employeList");
                if(employeList != null) {
                    for(int i = 0; i < employeList.size(); i++) {
                        EmployeeBean employee = employeList.get(i);
            %>
			<form action="/EmployeeManegimentSystem/EmployeeDeleteServlet" method="POST">
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
					<td><%=employee.getEmp_date() %>>
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