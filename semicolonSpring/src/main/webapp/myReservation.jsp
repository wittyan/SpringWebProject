<%@page import="semicolon.com.dao.MyPageDao"%>
<%@page import="semicolon.com.dao.AddressDao"%>
<%@page import="semicolon.com.dao.SuyeonSemiDao"%>
<%@page import="semicolon.com.dao.SungsuDao"%>
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="semicolon.com.bean.SemiCompanyBean"%>
<%@page import="semicolon.com.bean.SemiProductBean"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="semicolon.com.bean.SemiReserveBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Reservation</title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		
	});
</script>
<style type="text/css">

</style>
</head>
<body>
<%
AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
	TaehoonDao taehoonDao = (TaehoonDao) request.getAttribute("taehoonDao");
	SungsuDao sungsuDao = (SungsuDao) request.getAttribute("sungsuDao");
	SuyeonSemiDao suyeonSemiDao = (SuyeonSemiDao) request.getAttribute("suyeonSemiDao");
	AddressDao addressDao = (AddressDao) request.getAttribute("addressDao");
	MyPageDao myPageDao = (MyPageDao) request.getAttribute("myPageDao");
	
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	
 	//id="hh";	//테스트
	
	List<SemiReserveBean> reserveList=myPageDao.selectReserve(id);

	if(id==null || reserveList==null ){
		response.sendRedirect("loginMain.do");
	}
%>
	<!--::header part start::-->
	<header class="main_menu">
		<div class="sub_menu">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-sm-12 col-md-6"></div>
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
		</div>
		<div class="main_menu_iner">
			<div class="container">
				<div class="row align-items-center ">
					<div class="col-lg-12">
						<nav
							class="navbar navbar-expand-lg navbar-light justify-content-between">
							<a class="navbar-brand" href="index.do?id=<%=id%>"> <img
								src="/team/img/semi_logo.png" alt="logo" width="200"
								height="80">
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
									<li class="nav-item">
                                        <a class="nav-link" href="/team/index.do?id=<%=id %>">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/team/list.do?page=1&id=<%=id %>">상품목록</a>
                                        
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="/team/communityList.do?id=<%=id %>">커뮤니티</a>
                                    </li>

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

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>MyPage</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

 	<!-- 사이드메뉴 -->
<!--<div class="list-group" id="myMenu">
  <a href="myInfo.do" class="list-group-item list-group-item-action active">회원정보변경</a>
  <a href="#" class="list-group-item list-group-item-action">예약내역</a>
</div> -->

<nav class="navbar navbar-expand-sm bg-light navbar-light" id="navbar">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="myInfo.do">회원정보변경</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">예약내역</a>
    </li>
  </ul>
</nav>

<!-- 예약내역 -->
<div class="container" id="myReserveTable">
  <h2>내 예약내역</h2>            
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>예약번호</th>
        <th>업체명</th>
        <th>상품명</th>
        <th>상품가격</th>
        <th>인원수</th>
        <th>예약날짜</th>
      </tr>
    </thead>
    <tbody>
    <%
    for(SemiReserveBean bean:reserveList){
    	int pno=bean.getPno();
    	int cno=bean.getCno();
    	//out.println(reserveList);
    	if(reserveList!=null&&bean!=null){
			SemiProductBean pBean=myPageDao.selectProduct(pno);
			SemiCompanyBean cBean=myPageDao.selectCompany(cno);
    %>
      <tr>
       <td><a href="#"><%=bean.getRno() %></a></td>
       <td><%=cBean.getCname() %></td>
       <td><%=pBean.getPname() %></td>
       <td><%=pBean.getpPrice() %></td>
       <td><%=bean.getRcount() %></td>
       <td><%=bean.getRdate() %></td>
      </tr>
    <%
    	}
    }
    %>
      
    </tbody>
  </table>
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