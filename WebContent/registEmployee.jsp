
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
<%-- 不正アクセス防止 --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>
<div class="center">

<h1>従業員登録</h1>

</div>
	<form action="RegistEmployeeServlet" method="POST"  autocomplete="off">
<table>
	<tr><td><b><font size="4">従業員情報</font></b></td></tr>
	<tr><td id="bg">従業員コード</td><td><input type = "text" name = "emp_code" maxlength='4'></td></tr>
	<tr><td id="bg">氏名</td><td>姓　　　:<input type = "text" name = "l_name" maxlength='10'>　</td><td>名　　　:<input type = "text" name = "f_name" maxlength='10'></td></tr>
	<tr><td id="bg">氏名（フリガナ）</td><td>姓(セイ):<input type = "text" name = "l_kana_name" maxlength='10'>　</td><td>名(メイ):<input type = "text" name = "f_kana_name" maxlength='10'></td></tr>
	<tr><td id="bg">性別</td><td><input type = "radio" name = "sex" value = "0">男　
						<input type = "radio" name = "sex" value = "1">女</td></tr>
	<tr><td id="bg">生年月日</td><td><input type="date" name="birth_day"  max=<%= (String)request.getAttribute("today")%>>（手入力例：2000-01-01）</td></tr>
	<tr><td id="bg">所属部署</td><td>
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
		<tr><td id="bg">入社日</td><td><input type="date" name="emp_date"
		 max= <%= (String)request.getAttribute("today")%>
		 >（手入力例：2000-01-01）</td></tr>
	</table>
	<br>
	<div class="center">
	<input type="submit" value="入力内容を登録" name="ACTION">
	</div>
	</form>
<%@ include file="footer.jsp" %>
</body>
</html>


