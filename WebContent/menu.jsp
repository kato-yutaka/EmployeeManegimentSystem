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
<%-- �s���A�N�Z�X�h�~ --%>
<%
String access = (String)session.getAttribute("ACCESS");
if(access == null){
	response.sendRedirect("unauthorized_access.jsp");
}
%>
<%@ include file="header.jsp" %>

<form  method="POST" action="EmployeeSelectServlet" name = "a">
<input type="hidden" name="ACTION" value="�]�ƈ��ꗗ�E�폜">
</form>


<form  method="POST" action="RegistEmployeeServlet" name = "b">
<input type="hidden" name="ACTION" value="�]�ƈ��o�^">
</form>

<form  method="POST" action="EmployeeManagementServlet" name = "c">
<input type="hidden" name="ACTION" value="���O�A�E�g">
</form>

<form  method="POST" action="UserRegistServlet" name = "d">
<input type="hidden" name="ACTION" value="add_user">
</form>

	<div align="center">
		<h1>���j���[���</h1>

		<table class="s-tbl"  >

			<tr bgcolor="D3EDFB	">
				<th></th>
				<th width="200">�^�C�g��</th>
				<th width="300">�T�v</th>
			</tr>


			<tr >
             <td><a href= "javascript:document.forms['a'].submit();"><img src="delete.png" width="70" height="70"></a></td>
             <td align="center">�]�ƈ��ꗗ�E�폜</td>
             <td align="center">�]�ƈ��̈ꗗ��\�����܂��B<br>�]�ƈ��̍폜�����܂��B</td>
            </tr>

            <tr >
             <td><a href= "javascript:document.forms['b'].submit();"><img src="regist.png" width="70" height="70"></a></td>
             <td align="center">�]�ƈ��o�^</td>
             <td align="center">�]�ƈ��̓o�^���s���܂��B</td>
            </tr>

            <tr >
             <td><a href= "javascript:document.forms['c'].submit();"><img src="logout.png" width="70" height="70"></a></td>
             <td align="center">���O�A�E�g</td>
             <td align="center">���O�A�E�g���܂�</td>
			</tr>

			<tr >
             <td><a href= "javascript:document.forms['d'].submit();"><img src="logout.png" width="70" height="70"></a></td>
             <td align="center">���[�U�[���o�^�@�\</td>
             <td align="center">���[�U�[���o�^����@�\�ł��B</td>
			</tr>

		</table>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>