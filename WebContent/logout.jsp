<%@ page language="java" contentType="text/html; charset=Windows-31J"
    pageEncoding="Windows-31J"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="Windows-31J">
	<title>���O�A�E�g </title>
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
<%-- �A�N�Z�X�F��(�Z�b�V����)�j�� --%>
<%
session.removeAttribute("ACCESS");
session.invalidate();
%>
<%@ include file="header.jsp" %>
	<div class="center">
	        <h1>���O�A�E�g���܂���</h1>

	    	<p>�V�X�e���𗘗p����ɂ͍ēx���O�C�����Ă��������B</p>
	        <form action="UserManagementServlet" method="POST">
	            <br>
	            <input type="hidden" name="ACTION" value="222">
	            <input type="submit" value="���O�C����ʂ�">
	        </form>
	</div>
<%@ include file="footer.jsp" %>
</body>
</html>