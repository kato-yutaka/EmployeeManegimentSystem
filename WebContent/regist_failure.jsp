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

	<h1>登録失敗画面</h1>
	<hr>
	<br>

	<form action="registEmployee.jsp" method="POST">
		<p>従業員情報の登録に失敗しました。</p>

		 <%
		 ArrayList<String> messageList =
         (ArrayList<String>) request.getAttribute("error_message");
		 ArrayList<Integer> numberList =
		         (ArrayList<Integer>) request.getAttribute("error_number");

		 for(int i = 0; i < numberList.size(); i++) {%>
		 <%= messageList.get(i)%><br>

         <% if(numberList.get(i) == 1){
         	ArrayList<String> nList =
                       (ArrayList<String>) request.getAttribute("nullList");

              for(int j = 0; j < nList.size(); j++) {
                  String nName = nList.get(j);%>
                  <%=nName %><br>
              <%}%>
            <%}%>
            <br>
		<%}%>


		<input type="submit" name="ACTION" value="登録画面へ">
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>