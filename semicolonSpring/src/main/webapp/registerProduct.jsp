<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semicolon.com.bean.SemiCompanyBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품등록</title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<script src="/team/js/register.js" charset="UTF-8"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("input#regiBtn").click(function(){
		if($("select[name=selectProducttf] option:selected").val()=='empty'){
			alert('옵션 선택하세요');
			return false;
		}
		if($("select[name=cno] option:selected").val()=='empty'){
			alert('옵션 선택하세요');
			return false;
		}
		if($("input[name=name]").val().length==0 || $("input[name=price]").val().length==0){
			alert('빈칸을 입력하세요');
			return false;
		}
			$("form").submit();
		});
		
		$("select[name=selectProductse]").change(function(){
			
			if($("select[name=selectProductse]").val()=='direct'){
				$("input[name=selectProducttf]").val('');
				$("input[name=selectProducttf]").prop("disabled",false);
				$("input[name=selectProducttf]").prop("readonly",false);
			}else{

				$("input[name=selectProducttf]").prop("readonly",true);
				$("input[name=selectProducttf]").prop("disabled",false);
				$("input[name=selectProducttf]").val($("select[name=selectProductse] option:selected").text());
			}
		});
		  $('input[type=file]').change(function(){
			  $("input[name='fileField']").prop("disabled",false);
			  $("input[name='fileField']").val($('input[type=file]')[0].files[0].name);
			  
		  });
		  
		  
	});
</script>
<style>
table {
	margin: 50px auto;
	width: 55%;
	height: auto;
}

label {
	text-align: center;
	font-weight: bold;
	size: 20px;
	padding: 8px;
}

#btnDiv {
	width: 100px;
	height: 50px;
	margin: 0 auto;
}
</style>
<%
AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
	String id= request.getParameter("id");
%>
</head>
<body>
	 <!--::header part start::-->
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
                <div class="row">
                  <div class="col-lg-6 col-sm-12 col-md-6">                   
                        </div>
                    </div>
                    <div class="col-lg-6 col-sm-12 col-md-6">
                        <div class="sub_menu_right_content">
                            
                          
                            <%if(id!=null){ %>                              
                            <span><%=id %>님 안녕하세요</span>                          
                            <a href="logout.do">로그아웃</a>
                            <a href="myInfo.do?id=<%=id%>">마이 페이지</a>
                            <%if(id.equals("admin")){ %>
                            <a href="admincontrolMain.do">관리자페이지</a>
                            <%
                            }
                            %>
                             <%
                            }else{
                            %>
                             <span>OO님 안녕하세요</span>
                            <a href="loginMain.do">로그인</a>
                            <a href="#">마이 페이지</a>
                            <a href="#"></a>
                            <%
                            }
                            %>                                              
                        </div>
                    </div>
                  
                </div>
            </div>
        
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.do?id=<%=id %>"> <img src="/team/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.do?id=<%=id %>">Home</a>
                                    </li>
                                   <!--  <li class="nav-item">
                                        <a class="nav-link" href="#">예약</a>
                                        
                                    </li> -->
                                    <li class="nav-item">
                                        <a class="nav-link" href="admincontrolMain.do?id=<%=id %>">관리자페이지</a>
                                    </li>                          
                                </ul>
                            </div>
                           
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header part end-->

	<!-- PNO	CNO	PNAME	PPRICE	PTYPE	PFILENAME -->
	<div id="registerProPart">
		<h1 align="center"
			style="font-weight: bold; size: 50px; margin-top: 50px;">상품등록</h1>
		<form action="registerProcess.do?type=product&id=<%=id %>" name="rcfrm" method="POST" enctype="multipart/form-data">
			<table>
				<tr>
					<td><label>상품명</label></td>
					<td><input type="text" name="name" size="40"></td>
				</tr>
				<tr>
					<td><label>상품가격</label></td>
					<td><input type="text" name="price" size="40"> 원</td>
				</tr>
				<tr>
					<td><label>회사명</label></td>
					<td><select name="cno">
							<option value="empty" selected="selected">선택하세요</option>
							<%
							ArrayList<SemiCompanyBean> scb = (ArrayList<SemiCompanyBean>)appleDao.selectCompany();
							for(int i = 0; i<scb.size();i++){
						%>
							<option value="<%=scb.get(i).getCno()%>"><%=scb.get(i).getCname() %></option>
						<%
							}
						%>
					</select></td>
				</tr>
				<tr>
					<td><label>상품유형</label></td>
					<td><input id="pType" type="text" name="selectProducttf"
						size="15" disabled="disabled"> 
						<select name="selectProductse">
							<option value="empty" selected="selected">선택하세요</option>
							<option value="지상레포츠">지상레포츠</option>
							<option value="해상레포츠">해상레포츠</option>
							<option value="항공레포츠">항공레포츠</option>
							<option value="direct">직접입력</option>
					</select></td>
				</tr>
				<tr>
					<td><label>상품이미지</label></td>
					<td><input type="text" name="fileField" size="30" disabled="disabled" readonly="readonly">
						<input type="file" name="file"></td>
				</tr>
				<tr>
					<td><label>상품수량</label></td>
					<td><input type="text" name="pstock" size="10"/></td>
				</tr>
			</table>
			<div id="btnDiv">
				<input id="regiBtn" type="button" value="등록하기">
			</div>

		</form>
	</div>
</body>
</html>