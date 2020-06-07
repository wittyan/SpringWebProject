
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script>

</script>
<body>

<jsp:useBean id="appleDao" class ="semicolon.com.dao.AppleDao"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pageData = request.getParameter("page");
	String type = request.getParameter("type");
	
	if(type.equals("qna")){
// 		AppleDao appleDao = (AppleDao)request.getAttribute("appleDao");
		appleDao.deleteQna(no);
		/* 부모의 REPLY값 변화*/
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("num", request.getParameter("pno"));
		map.put("mode", "del");
		
		appleDao.updateReply(map);
		
		response.sendRedirect("communityList.do?type="+type+"&page="+pageData);
	}else if(type.equals("notice")){
		appleDao.deleteNotice(no);
		
		response.sendRedirect("communityList.do?type="+type+"&page="+pageData);
		
	}else if(type.equals("event")){
		appleDao.deleteEvent(no);
	
		response.sendRedirect("communityList.do?type="+type+"&page="+pageData);
		
	}
%>
</body>
</html>