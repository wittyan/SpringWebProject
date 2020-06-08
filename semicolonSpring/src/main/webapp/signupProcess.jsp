
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>체크</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
  $(function(){
	  
  });
</script>
<%request.setCharacterEncoding("EUC-KR"); %>

<jsp:useBean id="member" class="semicolon.com.bean.SemiMemberBean" scope="session"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
</head>
<body>
<%-- <%=member %> --%>



<%

TaehoonDao taehoonDao = (TaehoonDao) request.getAttribute("taehoonDao");

   //out.println(member);
    taehoonDao.insertMember(member);
    out.println("<script>alert('회원가입 되었습니다'); location.href='index.do';</script>");
  
%>

</body>
</html>