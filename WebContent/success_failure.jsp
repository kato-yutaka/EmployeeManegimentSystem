<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>���[�U�[���o�^���s</title>
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
        <h1>���[�U�[���̓o�^�Ɏ��s���܂���</font></h1>

	        <form action="EmployeeManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="���j���[��ʂ�">
	            <input type="submit" value="���j���[��ʂ�">
	        </form>
	    </div>
<%@ include file="footer.jsp" %>
</body>
</html>