<%@page import="semicolon.com.dao.SungsuDao"%>
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>IdCheck</title>
<link href="/team/sist/css/common.css" rel="stylesheet" type="text/css" />
<link href="/team/sist/css/user.css" rel="stylesheet" type="text/css" />
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"></script>
<script  src="/team/js/member.js" charset="UTF-8"></script>

</head>
<%
AppleDao appleDao = (AppleDao)request.getAttribute("appleDao");
TaehoonDao taehoonDao = (TaehoonDao)request.getAttribute("taehoonDao");
SungsuDao sungsuDao = (SungsuDao)request.getAttribute("sungsuDao");


    String id=request.getParameter("id");
    boolean state=false;
    if(id!=null){
    	state=taehoonDao.idcheckProcess(id);
    } 
    
%>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<form action="" name="idFrm" method="post">
<table width="400" height="289"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" background="/team/sist/img/join_pop_bg.gif"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="45" colspan="3"><img src="/team/sist/img/join_pop_title2.gif" width="130" height="20" /></td>
      </tr>
      <tr>
        <td width="50" height="60">&nbsp;</td>
        <td height="60">&nbsp;</td>
        <td width="50">&nbsp;</td>
      </tr>
   <%
     if(id!=null&& state){
   %>
     <tr>
        <td>&nbsp;</td>
        <td height="60" align="center" style="padding: 10 ">
          입력하신 아이디 <strong><%=id %></strong>은 이미 사용중인 ID 입니다.
          <p>다른 ID를 검색하여주세요. </p></td>
        <td>&nbsp;</td>
      </tr>  
    <%
     }else if(id!=null && state==false){
    %>      
      <tr>
        <td>&nbsp;</td>
        <td height="60" align="center" style="padding: 10 ">
         입력하신 아이디 <strong><%=id %></strong>은 사용가능한 ID 입니다.
           <p id="pid"><a href="#" id="pppphere" name="<%=id%>">여기를 Click하세요</a></p></td>
        <td>&nbsp;</td>
      </tr>     
    <%
     }
    %>  
        <tr>
          <td>&nbsp;</td>
          <td height="40" align="center" bgcolor="F5F5F5"><strong>ID</strong> 입력
            <input type="text" name="id" id="id" class="input" />
            <input id="idImg" type="image" src="/team/sist/img/btn_confirm_re.gif" width="59" height="18" border="0" align="absmiddle"  /></td>
          <td>&nbsp;</td>
        </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="20">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td></td>
        <td height="1" background="/team/sist/img/dotline_2px.gif"></td>
        <td></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
