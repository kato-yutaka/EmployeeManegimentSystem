
<%@ page language="java" contentType="text/html; charset=Windows-31J"
	pageEncoding="Windows-31J"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="entity.EmployeeBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-31J">
	<title>Insert title here</title>
	<link rel="stylesheet" href="emp_sys.css" type="text/css">
	<script type="text/javascript">
	function checkForm($this) {
		var str = $this.value;
		while (str.match(/[^A-Z^a-z\d\-]/)) {
			str = str.replace(/[^A-Z^a-z\d\-]/, "");
		}
		$this.value = str;
	}
	</script>
</head>
<body>
	<%-- 不正アクセス防止 --%>
	<%
		String access = (String) session.getAttribute("ACCESS");
		if (access == null) {
			response.sendRedirect("unauthorized_access.jsp");
		}
	%>
	<%@ include file="header.jsp"%>
	<div class="center">

		<h1>従業員登録</h1>
		<%--<%= tips.contains(0) ? "bg-red":"bg-blue"--%>
		<%
			HttpSession reg_session = request.getSession();

			String section_name = (String) reg_session.getAttribute("section_name");
			String sex_str = (String) reg_session.getAttribute("sex_str");
			//String emp_code  = (String)reg_session.getAttribute("emp_code");

			ArrayList<Integer> tips = new ArrayList<Integer>();//tipsにnullが入っているとtips.contains()でエラーが起きるため先に宣言
			//error_tipsをnullチェック
			if ((ArrayList<Integer>) reg_session.getAttribute("error_tips") != null) {
				tips = (ArrayList<Integer>) reg_session.getAttribute("error_tips");
				out.print(
						"<font color = \"red\"><img src=\"picture/Warning.png\" width=\"14\" height=\"14\">警告：エラー項目があります</font>");
			}
		%>
	</div>
	<form action="RegistEmployeeServlet" method="POST" autocomplete="off">
		<table>
			<tr>
				<td><b><font size="4">従業員情報</font></b></td>
			</tr>

			<tr>
				<td id=<%=tips.contains(0) ? "bg-red" : "bg-blue"%>>従業員コード(半角)<%=tips.contains(0) ? "<img src=\"Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td><input type="text" name="emp_code" maxlength='4' onInput="checkForm(this)"
					<%=(String) reg_session.getAttribute("emp_code") != null
					? " value = " + (String) reg_session.getAttribute("emp_code") : ""%>></td>
			</tr>


			<tr>
				<td id=<%=tips.contains(1) ? "bg-red" : "bg-blue"%>>氏名<%=tips.contains(1) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td>姓 <input type="text" name="l_name" maxlength='16'
					<%=(String) reg_session.getAttribute("l_name") != null
					? " value = " + (String) reg_session.getAttribute("l_name") : ""%>>
					名 <input type="text" name="f_name" maxlength='16'
					<%=(String) reg_session.getAttribute("f_name") != null
					? " value = " + (String) reg_session.getAttribute("f_name") : ""%>></td>
			</tr>
			<tr>
				<td id=<%=tips.contains(2) ? "bg-red" : "bg-blue"%>>氏名（フリガナ）<%=tips.contains(2) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td>姓(セイ)<input type="text" name="l_kana_name" maxlength='16'
					<%=(String) reg_session.getAttribute("l_kana_name") != null
					? " value = " + (String) reg_session.getAttribute("l_kana_name") : ""%>>
					名(メイ)<input type="text" name="f_kana_name" maxlength='16'
					<%=(String) reg_session.getAttribute("f_kana_name") != null
					? " value = " + (String) reg_session.getAttribute("f_kana_name") : ""%>></td>
			</tr>
			<tr>
				<td id=<%=tips.contains(3) ? "bg-red" : "bg-blue"%>>性別<%=tips.contains(3) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td><input type="radio" name="sex" value="0"
					<%="0".equals(sex_str) ? " checked=\"checked\"" : ""%>>男
					<input type="radio" name="sex" value="1"
					<%="1".equals(sex_str) ? " checked=\"checked\"" : ""%>>女</td>
			</tr>
			<tr>
				<td id=<%=tips.contains(4) ? "bg-red" : "bg-blue"%>>生年月日<%=tips.contains(4) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td><input type="date" name="birth_day"
					max=<%=(String) request.getAttribute("today")%>
					<%=(String) reg_session.getAttribute("birth_day_str") != null
					? " value = " + (String) reg_session.getAttribute("birth_day_str") : ""%>>（手入力例：2000-01-01）</td>
			</tr>
			<tr>
				<td id=<%=tips.contains(5) ? "bg-red" : "bg-blue"%>>所属部署<%=tips.contains(5) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td>
					<%
						ArrayList<EmployeeBean> section = (ArrayList<EmployeeBean>) request.getAttribute("sectionList");
						if (section != null) {
					%> <select name="section_name">
						<%
							for (int i = 0; i < section.size(); i++) {
									EmployeeBean section_nam = section.get(i);
						%>
						<option value="<%=section_nam.getSection_name()%>"
							<%=section_nam.getSection_name().equals(section_name) ? " selected=\"selected\"" : ""%>>
							<%=section_nam.getSection_name()%>
						</option>

						<%=(String) reg_session.getAttribute("emp_code") != null
							? " value = " + (String) reg_session.getAttribute("emp_code") : ""%>
						<%
							}
							}
						%>
				</select>
				</td>
			</tr>
			<tr>
				<td id=<%=tips.contains(6) ? "bg-red" : "bg-blue"%>>入社日<%=tips.contains(6) ? "<img src=\"picture/Warning.png\" width=\"14\" height=\"14\">" : ""%></td>
				<td><input type="date" name="emp_date"
					max=<%=(String) request.getAttribute("today")%>
					<%=(String) reg_session.getAttribute("emp_date_str") != null
					? " value = " + (String) reg_session.getAttribute("emp_date_str") : ""%>>（手入力例：2000-01-01）</td>
			</tr>
		</table>
		<br>
		<div class="center">
			<input type="submit" value="入力内容を登録" name="ACTION">
		</div>
	</form>
	<form action="EmployeeManagementServlet" method="POST"">
		<div class="center">
			<input type="submit" value="メニュー画面へ" name="ACTION">
		</div>
	</form>
	<%@ include file="footer.jsp"%>
</body>
</html>


