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
	<%-- �s���A�N�Z�X�h�~ --%>
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
	<h1>�]�ƈ����̓o�^�Ɏ��s���܂����B</h1>

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
		<button type="submit" name="ACTION" value="�]�ƈ��o�^">&ensp;�o�^��ʂ�&ensp;</button>
	</form>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>