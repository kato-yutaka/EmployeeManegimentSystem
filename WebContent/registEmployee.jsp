
<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>Insert title here</title>
</head>
<body>

<h1>�]�ƈ��o�^</h1>

<H2>�]�ƈ����</H2>
	<form action="EmployeeManagementServlet" method="POST" >
<table>
	<tr><td>�]�ƈ��R�[�h</td><td><input type = "text" name = "emp_code" ></td></tr>
	<tr><td>����</td><td>���F<input type = "text" name = "l_name" >���F<input type = "text" name = "f_name" ></td></tr>
	<tr><td>�����i�t���K�i�j</td><td>���i�Z�C�j�F<input type = "text" name = "l_kana_name" >���i���C�j�F<input type = "text" name = "f_kana_name" ></td></tr>
	<tr><td>����</td><td><input type = "radio" name = "sex" value = "0">�j
						<input type = "radio" name = "sex" value = "1">��</td></tr>
	<tr><td>���N����</td><td><input type="date" name="birth_day"></td></tr>
	<tr><td>��������</td><td>
		 <%
                ArrayList<EmployeeBean> section =
                        (ArrayList<EmployeeBean>) request.getAttribute("sectionList");
                if(section != null) {
                %>
                	<select name = "section_name">
                <%
                    for(int i = 0; i < section.size(); i++) {
                     EmployeeBean section_nam = section.get(i);%>
                    	<option value="<%=section_nam.getSection_name()%>"><%=section_nam.getSection_name()%></option>
                    <%}
                }%>

 	</select></td></tr>
	<tr><td>���Г�</td><td><input type="date" name="emp_date"></td></tr>

</table>
<input type="submit" value="���͓��e��o�^" name="ACTION">
	</form>

</body>

</html>


