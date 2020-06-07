
<%@page import="semicolon.com.dao.MyPageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semicolon.com.bean.SemiMemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

MyPageDao myPageDao = (MyPageDao) request.getAttribute("myPageDao");
	
request.setCharacterEncoding("UTF-8");
	SemiMemberBean bean=new SemiMemberBean();
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String nickname=request.getParameter("nickname");
	String password=request.getParameter("password");
	String gender=request.getParameter("gender");
	String tel=request.getParameter("tel");
	String email=request.getParameter("email");
	String address=request.getParameter("address");
	String birthdate=request.getParameter("birthdate");
	
	bean.setId(id);
	bean.setName(name);
	bean.setNickname(nickname);
	bean.setPassword(password);
	bean.setGender(gender);
	bean.setTel(tel);
	bean.setEmail(email);
	bean.setAddress(address);
	bean.setBirthdate(birthdate);
	
	out.println(bean);
	myPageDao.updateMember(bean);
	response.sendRedirect("myInfo.do?id="+id);
%>
</body>
</html>