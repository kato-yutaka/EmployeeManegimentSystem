<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="Windows-31J">
<title>menu</title>
<link rel="stylesheet" href="emp_sys.css" type="text/css">
</head>
<body>

	<%@ include file="header.jsp"%>


<%-- �s���A�N�Z�X�h�~ --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>


	<div align="center">
		<h1>���j���[���</h1>
		<table class="s-tbl"  >

			<tr bgcolor="blue">
				<th></th>
				<th width="300">�^�C�g��</th>
				<th width="500">�T�v</th>
			</tr>

			<tr>
             <td><a href="employeelist.jsp"><img src="delete.png" width="70" height="70"></a></td>
             <td>�]�ƈ��ꗗ�E�폜</td>
             <td>�]�ƈ��̈ꗗ��\�����܂��B<br>�]�ƈ��̍폜�����܂��B</td>
            </tr>

            <tr>
             <td><a href="registEmployee.jsp"><img src="regist.png" width="70" height="70"></a></td>
             <td>�]�ƈ��o�^</td>
             <td>�]�ƈ��̓o�^���s���܂��B</td>
            </tr>

            <tr>
             <td><a href="logout.jsp"><img src="logout.png" width="70" height="70"></a></td>
             <td>���O�A�E�g</td>
             <td>���O�A�E�g���܂�</td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>