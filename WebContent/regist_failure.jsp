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
	<%-- 不正アクセス防止 --%>
	<%
	String access = (String)session.getAttribute("ACCESS");
	if(access == null){
		response.sendRedirect("unauthorized_access.jsp");
	}
	%>
	<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>
	<div class="center">
	<h1>従業員情報の登録に失敗しました。</h1>

	<form action="RegistEmployeeServlet" method="POST">

		 <%
		 ArrayList<String> messageList =
         (ArrayList<String>) request.getAttribute("error_message");
		 ArrayList<Integer> numberList =
		         (ArrayList<Integer>) request.getAttribute("error_number");

		 for(int i = 0; i < numberList.size(); i++) {%>
		 <B><font color = "red"><%= messageList.get(i)%></font></B><br>

         <% if(numberList.get(i) == 1){
         	ArrayList<String> nList =
                       (ArrayList<String>) request.getAttribute("nullList");

              for(int j = 0; j < nList.size(); j++) {
                  String nName = nList.get(j);%>
                  <font color = "red"><%=nName %></font><br>
              <%}%>
            <%}%>
            <br>
		<%}%>

		<br>
		<button type="submit" name="ACTION" value="従業員登録">&ensp;登録画面へ&ensp;</button>
	</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>