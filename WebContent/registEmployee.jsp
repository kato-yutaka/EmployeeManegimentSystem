
<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>Insert title here</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%-- �s���A�N�Z�X�h�~ --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>
<div class="center">

<h1>�]�ƈ��o�^</h1>

</div>
	<form action="RegistEmployeeServlet" method="POST"  autocomplete="off">
<table>
	<tr><td><b><font size="4">�]�ƈ����</font></b></td></tr>
	<tr><td id="bg">�]�ƈ��R�[�h</td><td><input type = "text" name = "emp_code" maxlength='4'></td></tr>
	<tr><td id="bg">����</td><td>���@�@�@:<input type = "text" name = "l_name" maxlength='10'>�@</td><td>���@�@�@:<input type = "text" name = "f_name" maxlength='10'></td></tr>
	<tr><td id="bg">�����i�t���K�i�j</td><td>��(�Z�C):<input type = "text" name = "l_kana_name" maxlength='10'>�@</td><td>��(���C):<input type = "text" name = "f_kana_name" maxlength='10'></td></tr>
	<tr><td id="bg">����</td><td><input type = "radio" name = "sex" value = "0">�j�@
						<input type = "radio" name = "sex" value = "1">��</td></tr>
	<tr><td id="bg">���N����</td><td><input type="date" name="birth_day"  max=<%= (String)request.getAttribute("today")%>>�i����͗�F2000-01-01�j</td></tr>
	<tr><td id="bg">��������</td><td>
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
		<tr><td id="bg">���Г�</td><td><input type="date" name="emp_date"
		 max= <%= (String)request.getAttribute("today")%>
		 >�i����͗�F2000-01-01�j</td></tr>
	</table>
	<br>
	<div class="center">
	<input type="submit" value="���͓��e��o�^" name="ACTION">
	</div>
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>


