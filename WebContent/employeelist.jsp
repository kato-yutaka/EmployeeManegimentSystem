<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�ꗗ���</title>
</head>
<body>
	<div align="center">
		<font size="5" color="#000aff">�]�ƈ��ꗗ���</font>
		<hr>
	<br>
	</div>
	<div align="center">
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
				String emp_code;
                ArrayList<EmployeeBean> employeList = (ArrayList<EmployeeBean>) request.getAttribute("employeList");
                if(employeList != null) {
                    for(int i = 0; i < employeList.size(); i++) {
                        EmployeeBean employee = employeList.get(i);
                        emp_code = employee.getCode();
            %>
			<form action="/EmployeeManegimentSystem/EmployeeDeleteServlet" method="POST">
				<input type="hidden" name="ACTION" value="emp_code">
				<tr>
					<td><%=emp_code%></td>
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
					<td><input type="submit" value="�폜"></td>
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
</body>
</html>