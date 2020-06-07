
<%@page import="semicolon.com.bean.zipBean"%>
<%@page import="java.util.List"%>
<%@page import="semicolon.com.dao.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>주소검색</title>
<link href="/team/sist/css/common.css" rel="stylesheet" type="text/css" />
<link href="/team/sist/css/user.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="/team/js/cmember.js" charset="UTF-8"></script>
<style type="">
   .trStyle{
    text-align: center;
   }
</style>
</head>


<body>

	<form action="" name="searchFrm" method="post">
		<table width="400" height="380" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td valign="top" background="/team/sist/img/join_pop_bg1.gif">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="45" colspan="3"><img
								src="/team/sist/img/join_pop_title4.gif" width="115" height="20"></td>
						</tr>
						<tr>
							<td width="50" height="30">&nbsp;</td>
							<td>&nbsp;</td>
							<td width="50">&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="center" style="padding: 10">찾고자 하는 지역의
								&quot;읍,면,동&quot; 이름을 입력하세요.<br> 예: 구의동일 경우, '구의' 로 검색하세요.
							
							</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td></td>
							<td height="7"></td>
							<td></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="40" align="center" bgcolor="F5F5F5">주소검색 <input
								name="dong" id="dong" type="text" size="25" class="input"> <input id="searchDong"
									type="image" src="/team/sist/img/btn_search.gif" width="36"
									height="18" border="0" align="absmiddle"></td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td height="7">&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td style="padding: 1" bgcolor="#DDDDDD">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">

									<tr height="1" bgcolor="f4f4f4">
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr bgcolor="ddddddd">
										<td width="1" bgcolor="f4f4f4"></td>
										<td height="25" align="center" bgcolor="EEEEEE">해당
											주소를선택하세요.</td>
										<td width="1" bgcolor="f4f4f4"></td>
									</tr>
									<tr>

									</tr>
								</table>
								<div style="height: 120px; width: 300; overflow: auto;">
									<table width="100%" height="120" border="0" cellpadding="0"
										cellspacing="0" bgcolor="#FFFFFF" class="gray_blue">
										
								 	 <%if(dong!=null){ %>

										
										<%
										  for(int i = 0; i < list.size(); i++){
											  zipBean zb = new zipBean();
											  zb = list.get(i);
											  String addrr=zb.getZipcode().trim()+"-"+zb.getSido().trim()+zb.getGugun().trim()+zb.getDong().trim()+zb.getBunji().trim();
										%>
										<tr>
										   <td height="8"></td>
										</tr>
										<tr class="trStyle">
											<%-- <td><a href="#" name="addr"><%=zb.getZipcode() %></a></td>
											<td><a href="#" name="addr"><%=zb.getSido() %></a></td>
											<td><a href="#" name="addr"><%=zb.getGugun() %></a></td>
											<td><a href="#" name="addr"><%=zb.getDong() %></a></td>
											<td><a href="#" name="addr"><%=zb.getBunji() %></a></td> --%>
											<td><a href="#" name="addr"><%=addrr %></a></td>											
										</tr>
										<%
										  }
										 }
										%>  
									</table>
								</div>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
