<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"></script>
<script  src="/team/js/member.js" charset="UTF-8"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
                          
                            <a href="#">로그인</a>
                            <a href="#">마이 페이지</a>
                            <a href="#"></a>
                        </div>
                    </div>
                  
                </div>
            </div>
        
        <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="index.do"> <img src="/team/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
                                id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">상품목록</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#">커뮤니티</a>
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
<article class="">
		<div class="">
			<div class="col-md-6 col-md-offset-3">
				<h3 align="center">회원가입</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			<form action="signupProcess.do" name = "rfrm" method ="post">
			
				<div class="form-group">
					<label for="inputid">ID</label> <input type="text"
						class="" name="id" readonly="readonly" size=30>
				<span><a href="#" id="idcheck">중복체크</a></span></div>
				<div class="form-group">
					<label for="inputname">이름</label> <input type="text"
						class="form-control" name="name" id="inputname" placeholder="이름을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="inputnickname">닉네임</label> <input type="text"
						class="form-control" name = "nickname" id="inputnickname" placeholder="닉네임을 입력해 주세요">
				</div>
				<div class="form-group">
					<label for="inputpassword">비밀번호</label> <input type="password"
						class="form-control" name = "password1" id="password1" placeholder="비밀번호를 입력해주세요">
				</div>
				<div class="form-group">
					<label for="inputpasswordcheck">비밀번호확인</label> <input type="password"
						class="form-control" name = "password2" id="password2" placeholder="비밀번호 확인">
						<font id="chkNotice" size="2"></font>
						<input type="hidden" name="password" id="password">
				</div>
				<div class="form-group">
					<label for="inputgender">성별</label> 
				&nbsp&nbsp
				<input type="radio" name="gender" value="남자">남
				&nbsp&nbsp
				<input type="radio" name="gender" value="여자">여
				</div>
				<div class="form-group">
					<div><label for="inputtel">연락처</label></div> <input
						type="text" name = "tel1" class="" id="tels"
						placeholder="연락처를 입력하세요">&nbsp&nbsp-&nbsp&nbsp<input
						type="text" name = "tel2" class="" id="tels"
						placeholder="연락처를 입력하세요">&nbsp&nbsp-&nbsp&nbsp<input
						type="text" name = "tel3" class="" id="tels"
						placeholder="연락처를 입력하세요">
						<input type="hidden" name="tel" />
						
				</div>
				<div class="form-group">
					<div><label for="inputemail">이메일</label></div> 
					<input type="text" name = "email1" class="" id="email1"
						placeholder="이메일을 입력해주세요">
					@ <input type="text" name="email2" size="15" id="email2" placeholder="이메일을 입력해주세요" disabled="disabled"/>
                                        <select name="email3">
                                        <option selected="selected">선택하세요</option>
                                        <option value="naver.com">naver.com</option>
                                        <option value="daum.net">daum.net</option>
                                        <option value="gmail.com">gmail.com</option>
                                        <option value="hotmail.com">hotmail.com</option>
                                        <option id="dr">직접입력</option>
                                        <option></option>
                                        </select>
                                        <input type="hidden" name="email"/>
					<!-- <input
						type="text" name = "email2" class="" id="inputemail2"
						placeholder="이메일을 입력해주세요"> -->
				</div>
				<div class="form-group">
					<label for="inputaddress">주소</label>
					<input type="text" name="post1" class="inputText" size="10" /> - <input type="text" name="post2" class="inputText" size="10" /> <span class="buttonFuc"><a href="#" id="sendPost">우편번호</a></span>
					<input type="text" name="address1" class="inputText" size="50" readonly="readonly" />
					<input type="text" name="address2" class="inputText" size="50" />
					<input type="hidden" name="address"/>
					 <!-- <input type="tel" class="form-control" name = "address" id="inputaddress" placeholder="주소를 입력해 주세요"> -->
				</div>
	   		<li class="form-inline">
	   			<label for="inputbirthdate">생년월일</label>
	   			<input readonly="readonly" name = "birthdate" type="text" id="datepicker1">

	   		</li>
				<br>
				
				<div class="form-group text-center">
					<button type="button" id="join-submit" class="btn btn-primary">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" id="buttonMain" class="btn btn-warning">
						메인페이지<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

	</article>
</body>
</html>