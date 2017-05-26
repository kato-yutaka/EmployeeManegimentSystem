
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

<h1>従業員登録</h1>

<H2>従業員情報</H2>
	<form action="EmployeeManagementServlet" method="POST" >
<table>
	<tr><td>従業員コード</td><td><input type = "text" name = "emp_code" ></td></tr>
	<tr><td>氏名</td><td>姓：<input type = "text" name = "l_name" >名：<input type = "text" name = "f_name" ></td></tr>
	<tr><td>氏名（フリガナ）</td><td>姓（セイ）：<input type = "text" name = "l_kana_name" >名（メイ）：<input type = "text" name = "f_kana_name" ></td></tr>
	<tr><td>性別</td><td><input type = "radio" name = "sex" value = "0">男
						<input type = "radio" name = "sex" value = "1">女</td></tr>
	<tr><td>生年月日</td><td><input type="date" name="birth_day"></td></tr>
	<tr><td>所属部署</td><td>
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
	<tr><td>入社日</td><td><input type="date" name="emp_date"></td></tr>

</table>
<input type="submit" value="入力内容を登録" name="ACTION">
	</form>

</body>

</html>


