<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="/team/js/login.js" charset="UTF-8"></script>

</head>
<body>
<form id="login" name="login" method ="post" action="/team/loginFun.do">
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
				<h3 align="center">로그인</h3>
			</div>
		</div>
		<div class="col-sm-6 col-md-offset-3">
			
				<div class="form-group">
					<label for="inputName">ID</label> <input type="text"
						class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
				</div>
				
				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password" 
					class="form-control" name="password" id="password" placeholder="비밀번호를 입력해주세요">
				</div>
				
	   		
				<br>
				
				<div class="form-group text-center">
					<button type="button" id="loginsubmit" class="btn btn-primary" onclick="idcheck()">
						로그인<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" id="buttonMain" class="btn btn-warning">
						회원가입<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			
		</div>

	</article>
    </form>
    </body>
   </html>