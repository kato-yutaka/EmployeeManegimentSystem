<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
    <%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="Windows-31J">
	<title>�o�^���s���</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>
<%@ include file="header.jsp" %>
	<%
        request.setCharacterEncoding("Windows-31J");
        String emp_code = request.getParameter("CODE");
    %>

	<h1>�o�^���s���</h1>
	<hr>
	<br>

	<form action="registEmployee.jsp" method="POST">
		<p>�]�ƈ����̓o�^�Ɏ��s���܂����B</p>

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



		<input type="submit" name="ACTION" value="�o�^��ʂ�">
	</form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>