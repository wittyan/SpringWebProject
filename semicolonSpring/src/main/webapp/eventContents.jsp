<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiEventBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
</script>

<style>
table tr td{
	text-align:left;
}
	.contents{
		margin: 50px auto;
		width: 60%; height: 700px;
		text-align: center;
	}
	.btnGroup{
		float: right;
		margin-bottom: 50px;
	}
	.table, tr, .th, td{
		border-top: #000;
		border: 1px solid #000;
		
	}
		.ftr{
			border-top: 1px solid black;
		}
		.th{
			width: 10%;
		}
		.content th,.content td {
			height: 300px;
			line-height: 300px;
		}
		.imgFile th{
			height: 100px;
			line-height: 100px;
		}
			.imgFile img{
				display: block;
				width: 100px; height: 100px;
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
    
    <div class="contents">
    	<div class="btnGroup">
    	<button class="back"><a id="aback" href="communityList.do?type=event&no=${no }&page=${pageData}">목록</a></button>
    	
    	
    	<c:if test="${(seb.id eq id) or (id eq 'admin') }">
    		<button class="mod"><a id="aedit" href="eventForm.do?type=event&mode=modify&page=${pageData }&no=${no }">수정</a></button>
    		<button class="del"><a id="adelete" href="delete.do?type=event&no=${no }">삭제</a></button>
    		
    		</c:if>
  
  
	  <c:if test="${id eq 'admin' }">
    		<button class="del"><a id="ainsert" href="insert.do?type=eprogress&no=${no }&page=${pageData }>">마감</a></button>
  		</c:if>
    	</div>
    	<div>
    		<table class="table">
    			<tr class="ftr">
    				<th class="th">글번호</th>
    				<td>${seb.eno }</td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">작성일</th>
    				<td>${seb.edate }</td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">작성자</th>
    				<td>${seb.id }</td>
    			</tr>
    			<tr class="ftr">
    				<th class="th">제목</th>
    				<td>${seb.etitle }</td>
    			</tr>
    			<tr class="content">
    				<th class="th">내용</th>
    				<td>${seb.econtents }</td>
    			</tr>
    			<tr class="imgFile">
    				<th class="th">첨부파일</th>
    				<td>
    					<img src="/team/semiupload/${seb.efilename }" alt="testimg" >
    				</td>
    			</tr>
    		</table>
    	</div>
    </div>
    
    	<!-- footer part start-->
	<footer class="footer-area">
		<div class="container">
			<div class="row justify-content-between">
				<div class="col-sm-6 col-md-5">
					<div class="single-footer-widget">
						<h4>레저스포츠 타입으로 검색</h4>
						<!-- 혹은 이벤트? -->
						<ul>
							<li><a href="#">수상스키</a></li>
							<li><a href="#">하이킹</a></li>
							<li><a href="#">London, UK</a></li>
							<li><a href="#">Saintmartine, Bangladesh</a></li>
							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
							<li><a href="#">Miami, USA</a></li>
							<li><a href="#">California, USA</a></li>
							<li><a href="#">London, UK</a></li>
							<li><a href="#">Saintmartine, Bangladesh</a></li>
							<li><a href="#">Mount Everast, India</a></li>
							<li><a href="#">Sidney, Australia</a></li>
						</ul>

					</div>
				</div>

				<div class="col-sm-6 col-md-3">
					<div class="single-footer-widget footer_icon">
						<h4>Contact Us</h4>
						<!--                         <p>4156, New garden, New York, USA
                                +880 362 352 783</p> -->
						<span>contact@martine.com</span>
						<div class="social-icons">
							<a href="#"><i class="ti-facebook"></i></a> <a href="#"><i
								class="ti-twitter-alt"></i></a> <a href="#"><i
								class="ti-pinterest"></i></a> <a href="#"><i
								class="ti-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="copyright_part_text text-center">
						<p class="footer-text m-0">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="ti-heart" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- footer part end-->
	<a style="display:scroll;position:fixed;bottom:40px;right:10px; width:50px; height:50px" href="#" title=”맨위로"><img src="/team/semiupload/img_top.png"></a>
    </body>
    </html>