<%@page import="semicolon.com.dao.MyPageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="semicolon.com.bean.SemiMemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Info</title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<script	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
 <script src="/team/js/myPage.js" charset="UTF-8"></script>
 
  
<%

MyPageDao myPageDao = (MyPageDao) request.getAttribute("myPageDao");
	
	request.setCharacterEncoding("UTF-8");
	String id=(String)request.getSession().getAttribute("id");
	
// 	id="DOE";	//테스트
	
	SemiMemberBean memberBean=myPageDao.selectMember(id);
	if(id==null || memberBean==null){
		response.sendRedirect("loginMain.do");
	}
%>
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
						 
                            <%if(id!=null){ %>                              
                            <span><%=id %>님 안녕하세요</span>                          
                            <a href="logout.do">로그아웃</a>
                            <a href="#">마이 페이지</a>
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

<!-- 	<section id="myInfoSection">
			<div class="container">
				<h2>내 회원정보</h2>
			</div>
	</section> -->

<nav class="navbar navbar-expand-sm bg-light navbar-light" id="navbar">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="#">회원정보변경</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="myReservation.do?id=<%=id%>">예약내역</a>
    </li>
  </ul>
</nav>

	<section id="myInfoSection">
			<div class="container">
				<h2>내 회원정보</h2>
			</div>
	</section>

	<form id="myInfo" action="myInfoProcess.do?id=<%=id %>" method="post">

		<div class="col-sm-6 col-md-offset-3">
				
				<div class="form-group">
					<h4>ID: <%= id %></h4>
				<div class="form-group">
					<label for="inputname">이름</label> <input type="text"
						class="form-control" name="name" id="name" value="<%= memberBean.getName()%>">
				</div>
				<%
					String nickname=memberBean.getNickname();
					String gender=memberBean.getGender();
					String[] tel=memberBean.getTel().split("-");
					String[] email=memberBean.getEmail().split("@");
//					String address=memberBean.getAddress();

					//@ splits post/address
					//- splits post
					//# splits address
					String post1;
					String post2;
					String address1;
					String address2;
					if(memberBean.getAddress().contains("@")){
						String post=memberBean.getAddress().split("@")[0];
						String address=memberBean.getAddress().split("@")[1];
						post1=post.split("-")[0];
						post2=post.split("-")[1];
						address1=address.split("#")[0];
						address2=address.split("#")[1];						
// 						String post1=post.split("-")[0];
// 						String post2=post.split("-")[1];
// 						String address1=address.split("#")[0];
// 						String address2=address.split("#")[1];						
					}else{
						post1="123";
						post2="456";
						address1="경기도 안양시 동안구";
						address2="비산동";
					}
					String birthdate=memberBean.getBirthdate();
				%>
				<div class="form-group">
					<label for="inputnickname">닉네임</label> <input type="text"
						class="form-control" name = "nickname" id="nickname" value="<%=nickname %>">
				</div>
				<div class="form-group">
					<label for="inputpassword">비밀번호</label> <input type="password"
						class="form-control" name = "password1" id="password1" >
				</div>
				<div class="form-group">
					<label for="inputpassword2">비밀번호확인</label> <input type="password"
						class="form-control" name = "password2" id="password2">
						<font id="chkNotice" size="2"></font>
						<input type="hidden" name="password" id="password">
				</div>
				
				<div class="form-group">
					<label for="inputgender">성별</label> 
				
				<%
				
				if(gender.equals("남자"))
				{
					%>
					&nbsp&nbsp
				<input type="radio" id="male" name="gender" value="male" checked>남
				&nbsp&nbsp
				<input type="radio" id="female" name="gender" value="female">여
					<%
				}
				else if(gender.equals("여자")){
					%>
					&nbsp&nbsp
				<input type="radio" id="male" name="gender" value="male" >남
				&nbsp&nbsp
				<input type="radio" id="female" name="gender" value="female" checked>여
					<%
				}else{
				
					%>
					&nbsp&nbsp
				<input type="radio" id="male" name="gender" value="male" >남
				&nbsp&nbsp
				<input type="radio" id="female" name="gender" value="female">여
					<%
				}
				%>
				
				</div>
				<div class="form-group">
					<div><label for="inputtel">연락처</label></div> <input
						type="text" name = "tel1" class="" id="tel1"	value="<%=tel[0]%>">&nbsp&nbsp-&nbsp&nbsp<input
						type="text" name = "tel2" class="" id="tel2"	value="<%=tel[1]%>">&nbsp&nbsp-&nbsp&nbsp<input
						type="text" name = "tel3" class="" id="tel3"	value="<%=tel[2]%>">						
						<input type="hidden" name="tel" id="tel">
				</div>
				<div class="form-group">
					<div><label for="inputemail">이메일</label></div> 
					<input type="text" name = "email1" class="" id="email1"
						value="<%=email[0]%>">
					@ <input type="text" name="email2" size="15" id="email2" value="<%=email[1]%>"/>
                                        <select name="email3">
                                        <option selected="selected">선택하세요</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option >직접입력</option>
                                        <option></option>
                                        </select>
                     <input type="hidden" name="email" id="email">
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<label for="inputaddress">주소</label> <input type="tel" -->
<%-- 						class="form-control" name = "address" id="inputaddress" value="<%=address%>"> --%>
<!-- 					<input type="hidden" name="address" id="address"/> -->
<!-- 				</div> -->
				<div class="form-group">
					<label for="inputaddress">주소</label><br>
					<input type="text" name="post1" class="inputText" size="10" value="<%=post1%>"/> - <input type="text" name="post2" class="inputText" value="<%=post2%>" size="10" /> <span class="buttonFuc"><a href="#" id="sendPost">우편번호</a></span><br>
					<input type="text" name="address1" class="inputText" value="<%=address1%>" size="50" readonly="readonly" />
					<input type="text" name="address2" class="inputText" value="<%=address2%>" size="50" />
					<input type="hidden" name="address"/>
				</div>
	   		<li class="form-inline">
	   			<label for="inputbirthdate">생년월일</label>
	   			<input readonly="readonly" name = "birthdate" type="text" id="datepicker1" value="<%=birthdate %>">

	   		</li>
				<br>
			<input type="button" id="saveInfoBtn" value="저장">
		</div>
	</div>
	</form>


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