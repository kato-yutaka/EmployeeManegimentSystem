<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�]�ƈ��ꗗ���</title>
<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<div class="center">
		<h1>�]�ƈ��ꗗ���</h1>
		<hr>
		<br>
		<table border="1">
			<tr>
				<td>�]�ƈ��R�[�h</td>
				<td>����</td>
				<td>����(�t���K�i)</td>
				<td>����</td>
				<td>���N����</td>
				<td>��������</td>
				<td>���Г�</td>
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
						<%= "�j" %>
						<% }else{ %>
						<%= "��" %>
					<% } %>
					</td>
					<td><%=employee.getBirth_day() %></td>
					<td><%=employee.getSection_code() %>
					<td><%=employee.getEmp_date() %>>
					<td><button type="submit" name="ACTION" value=<%=employee.getCode()%>>�폜</button></td>
				</tr>
			</form>
			<% } %>
		<% } %>
		</table>
		<br>
		<form action="menu.html" method="POST">
			<input type="submit" value="���j���[��ʂ�" name="ACTION">
		</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>