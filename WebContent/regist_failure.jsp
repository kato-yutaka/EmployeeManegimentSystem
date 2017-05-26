<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>登録失敗画面</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div class="center">
	<h1>登録失敗画面</h1>

	<form action="RegistEmployeeServlet" method="POST">
		<p>従業員情報の登録に失敗しました。</p>

		 <%
		 String mes =
         (String)request.getAttribute("error_message");
         int number =
         (int)request.getAttribute("error_number");%>
		 <%=mes%><%=number %><br>

         <% if(number == 1){
         	ArrayList<String> nList =
                       (ArrayList<String>) request.getAttribute("nullList");

              for(int i = 0; i < nList.size(); i++) {
                  String nName = nList.get(i);%>
                  <%=nName %><br>
              <%}%>
            <%}%>


		<br>
		<button type="submit" name="ACTION" value="従業員登録">登録画面へ</button>
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>