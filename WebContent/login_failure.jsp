<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>���O�C�����s</title>
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
	        <h1>���O�C�����s���܂���</h1>

	    	<p>UserId�܂���PassWord���Ԉ���Ă��܂��B<br>
	    	���O�C����ʂɖ߂�A������x���͂��Ă��������B</p>
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="���O�C����ʂ�">
	        </form>
	    </div>
<%@ include file="footer.jsp" %>
</body>
</html>