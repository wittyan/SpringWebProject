<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("EUC-KR");
		String com = request.getParameter("select1");
		String pro = request.getParameter("select2");
		String dataFun = request.getParameter("dataFun");
		String timeFun = request.getParameter("timeFun");
		String countFun = request.getParameter("countFun");
		out.println(com + " " + pro + " " + dataFun + " " + timeFun + " " + countFun);
	%>
	<table border="1">
		<thead>
			<tr>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
			</tr>
		</tbody>
	</table>

</body>
</html>