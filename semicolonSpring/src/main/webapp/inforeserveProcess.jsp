<%@page import="semicolon.com.dao.MyPageDao"%>
<%@page import="semicolon.com.dao.AddressDao"%>
<%@page import="semicolon.com.dao.SuyeonSemiDao"%>
<%@page import="semicolon.com.dao.SungsuDao"%>
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiReserveBean"%>
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
AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
	
	SungsuDao sungsuDao = (SungsuDao) request.getAttribute("sungsuDao");

	String date = request.getParameter("date");
	String count = request.getParameter("count");
	String pno = request.getParameter("pno");
	String id =(String)session.getAttribute("id");
	
	if(id==null){
		id="DOE";
	}
	
	out.println("date:"+date+" count:"+count+" pno:"+pno);
	
	
	if(date!=null||count!=null||pno!=null||id!=null){
	SemiReserveBean srb = new SemiReserveBean();
	int cno = appleDao.getCnoFromPno(Integer.parseInt(pno));
	
	srb.setId(id);
	srb.setCno(cno);
	srb.setPno(Integer.parseInt(pno));
	srb.setRcount(Integer.parseInt(count));
	srb.setRdate(date);
	
	sungsuDao.anInsertsemireserve(srb);
	}
	response.sendRedirect("/team/myReservation.do?id="+id+"&pno="+pno+"");
%>
<script type="text/javascript">
alert('예약완료');
</script>
</body>

</html>