<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
<title>�ꗗ���</title>
</head>
<body>
    <div align="center">
        <font size="5" color="#000aff">�]�ƈ��ꗗ���</font>
    </div>
    <hr>
    <div align="center">
        <table border="1">
            <tr>
                <td>�]�ƈ��R�[�h</td>
                <td>���O</td>
                <td>�N��</td>
                <td>����</td>
            </tr>
            <%
                ArrayList<EmployeeBean> employeList =
                        (ArrayList<EmployeeBean>) request.getAttribute("employeList");
                if(employeList != null) {
                    for(int i = 0; i < employeList.size(); i++) {
                        EmployeeBean employee = employeList.get(i);
            %>
            <tr>
                <td><%=employee.getCode()%></td>
                <td><%=employee.getName()%></td>
                <td><%=employee.getSex()%></td>
                <td><%=employee.getName_kana()%></td>
                <td><%=employee.getBirth_day() %></td>
                <td><%=employee.getSection_code() %>
                <td><%=employee.getEmp_date() %>>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <br>
        <form action="employee" method="POST">
            <input type="submit" value="���j���[��ʂ�" name="ACTION">
        </form>
    </div>
</body>
</html>