<%@page import="java.util.HashMap"%>
<%@page import="semicolon.com.bean.SemiQnaBean"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문의사항등록하기</title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("select[name=selectproduct]").change(function(){
			$("input[name=product]").val($("#select option:selected").text());
		});
		
		$("#regiBtn").click(function(){
			if($("select[name=selectproduct]").val()=='empty'){
				alert('상품목록을 선택하세요');
			}else
			  if($("input[name=title]").val().length==0 ||
			  $("textarea[name=contents]").val().length==0){
				  alert('빈칸을 입력하세요')
			  }else{
				document.qnaFrm.submit();
				}
		});
		
		  $('input[type=file]').change(function(){
			  $("input[name='fileField']").prop("disabled",false);
			  $("input[name='fileField']").val($('input[type=file]')[0].files[0].name);
			  
		  });
		  
		  
		  
		  
		  
		  
	});
	
	
	
	function init(){
		
	}
</script>

<style>
	
	table{
		margin: 50px auto;
		width: 60%; height: auto;
	}
		
	label{
		text-align: center;
		font-weight: bold;
		size: 60px;
		padding: 8px;
	}
	
	#btnDiv{
		width: 100px; height: 50px;
		margin: 0 auto;
	}
	#txtarea{
		width: 700px; height: 300px;
		resize: none;
	}
</style>

</head>
<body>
   <!--::header part start::-->
  <header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6"></div>
				</div>
				<div class="col-lg-6 col-sm-12 col-md-6">
					<div class="sub_menu_right_content">

						
						<c:choose>
						<c:when test="${id ne null}">
						<span>${id }님 안녕하세요</span> <a href="loginMain.jsp">로그아웃</a> <a
							href="myInfo.do?id=${id }">마이 페이지</a>
						<c:if test="${id eq 'admin'}">
						<a href="admincontrolMain.do">관리자페이지</a>
						</c:if>
						</c:when>
						<c:otherwise>
						
						<span>비회원</span> <a href="loginMain.jsp">로그인</a> <a href="#">마이
							페이지</a> <a href="mypage.do"></a>
						
						</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
		</div>

		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="/team/index.do"> <img
								src="/team/img/semi_logo.png" alt="logo" width="200" height="80">
							</a>
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>

							<div
								class="collapse navbar-collapse main-menu-item justify-content-center"
								id="navbarSupportedContent">
								<ul class="navbar-nav">
									<li class="nav-item"><a class="nav-link"
										href="/team/index.do?id=${id }">Home</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/team/list.do?page=1&id=${id }">상품목록</a></li>
									<li class="nav-item"><a class="nav-link"
										href="/team/communityList.do?id=${id }">커뮤니티</a></li>

								</ul>
							</div>
							<a href="#" class="btn_1 d-none d-lg-block">book now</a>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
    <!-- Header part end-->
    
    <div id="qnaRegi">
    	<h1 align="center" style="font-weight: bold; size: 50px; margin-top: 50px;">문의사항등록</h1>
    	<form action="insert.do?mode=${mode }&type=qna&page=${pageData}" name="qnaFrm" method="POST" enctype="multipart/form-data" accept-charset="utf-8">
    		<table>
    			<tr>
    				<td>
    					<label>제목</label>
    				</td>
    				<td>
    					<input type="text" name="title" value="${sqb ne null ? sqb.qtitle: ''}" size="93">
    				</td>
    			</tr>
				<tr>
    				<td>
    					<label>상품명</label>
    				</td>
    				<td>
    					<input type="text" readonly="readonly" value="${sqb ne null ? pname: ''}" name = "product" size="20">
    					<select id = "select" name="selectproduct">
    						<option selected="selected" value="empty">선택하세요</option>
    					<c:if test="${list ne null}">
    					
						<c:forEach var="i" items="${list }"> 
							<option value="${i.pno }">${i.pname }</option>
						</c:forEach>
						</c:if>
    					</select>
    				
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<label>내용</label>
    				</td>
    				<td>
    					<textarea id="txtarea" name="contents">${sqb ne null ? sqb.qcontents: ''}</textarea>
    				</td>
    			</tr>
    			<tr>
    				<td><label>첨부파일</label></td>
    				<td>
    					<input type="text" size="20" readonly ="readonly" name = "fileField"value= "${sqb ne null ? seb.qfilename: ''}"disabled="disabled">
    					<input type="file" name="file" >
    				</td>
    			</tr>
    		</table>
							<input  type="hidden" name="id" value="${id }"/>
						    
							<c:if test="${(mode ne null) and (mode eq 'reply')}">
								<input  type="hidden" name="ref" value="${ref }"/>
								<input  type="hidden" name="step" value="${step }"/>
								<input  type="hidden" name="lev" value="${lev }"/>
								<input  type="hidden" name="pnum" value="${pnum }"/>
							</c:if>
    			<input type="hidden" name="no" value="${mode eq 'modify'?sqb.qno:''}">
	    		<div id="btnDiv">
	    			<input id="regiBtn" type="button" value="등록하기" >    		
    			</div>
    	</form>
    </div>
</body>
</html>