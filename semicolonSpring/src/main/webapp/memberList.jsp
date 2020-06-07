<!doctype html>
<%@page import="semicolon.com.dao.SuyeonSemiDao"%>
<%@page import="semicolon.com.dao.SungsuDao"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@page import="semicolon.com.bean.SemiList1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<html lang="UTF-8">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%

AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
TaehoonDao taehoonDao = (TaehoonDao) request.getAttribute("taehoonDao");
SungsuDao sungsuDao = (SungsuDao) request.getAttribute("sungsuDao");
SuyeonSemiDao suyeonSemiDao = (SuyeonSemiDao) request.getAttribute("suyeonSemiDao");

  String id = (String)session.getAttribute("id");
  
  /* try{
       if(!id.equals("admin")){
	   response.sendRedirect("loginMain.do");
   }
  }catch(Exception e){
	  response.sendRedirect("loginMain.do");
  } */
   
%>
<style>
table {
  text-align: center;
  border:2px;
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
}

.allPri{
   font-size: 24px;;
}
.searchfun{
  font-size: 18px;
}

tr:hover {background-color:#f5f5f5;}
</style>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript"></script>
<script  src="/team/js/memberList1.js" charset="UTF-8"></script>
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
                            
                            <%
                            if(id!=null){
                            %>                    
                            <span><%=id %>님 안녕하세요</span>   
                            <%
                            }else{
                            %>
                            <span>OOO님 안녕하세요</span>
                            <%
                            }
                            %>
                            <a href="logout.do">로그아웃</a>                  
                            <a href="admincontrolMain.do?id=<%=id %>">관리자페이지</a>                                                   
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

    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
      <div class="container">
            <div class="row">
                  <div class="col-lg-12">
                        <div class="breadcrumb_iner">
                              <div class="breadcrumb_iner_item text-center">
                                    <h2>Reservation List</h2>
                                    <p>Check Reservation</p>
                              </div>
                        </div>
                  </div>
            </div>
      </div>
      </section>
      <!-- breadcrumb start-->

    <!--================Blog Area =================-->
    
  <table>
    <caption></caption>
		<colgroup>
		<col width="150" />
		<col width="395" />
		<col width="95" />
		<col />
		</colgroup>
	<tbody>
		<tr>
			<th class="searchfun">검색</th>
			<td>
			<select id="sel11" name="sel11">
			<option selected="selected">선택하세요</option>
			<option value="1">구매횟수</option>
			<option value="2">구매금액</option>
			<option value="3">전체리스트</option>
			</select>
<!-- 			<input type="hidden" name="" class="inputText" size="30" disabled="disabled"/>
			<input type="button" id="btn1" name="btn1" value="검색"> --> 
		    </td>
		</tr>
		<tr>
		   <th class="allPri" id="priceall1">총 매출</th>
		   <%
		     int sum = taehoonDao.selePriceSum();
		     DecimalFormat form = new DecimalFormat("###,###");
		   %>
		   <td class="allPri" id="priceall1"><%=form.format(sum)%>원</td>
		</tr>
		
	</tbody>
  </table>   
  <table id="mbltb1">
  <thead id="mbltb1">
  <tr>
  <th>NO</th>
  <th>ID</th>
  <th>업체명</th>
  <th>상품명</th>
  <th>예약인원수</th>
  <th>가격</th>
  <th>예약날짜</th>
  </tr>
  </thead>
  <tbody id="mbltb1">
  <%
    List<SemiList1>list= taehoonDao.SeleMbltall();
    for(int i = 0; i <list.size(); i++){
    SemiList1 sm = list.get(i);
  %>
    <tr>
    <td><%=i+1 %></td>
    <td><%=sm.getId() %></td>
    <td><%=sm.getCname() %></td>
    <td><%=sm.getPname() %></td>
    <td><%=sm.getRcount() %></td>
    <td><%=form.format(sm.getPprice()) %>원</td>
    <td><%=sm.getRdate() %></td>
    </tr>
    <%
    }
    %>
  </tbody>
</table>   
<br><br><br><br><br>
    <!--================ Blog Area end =================-->

    <!-- footer part start-->
    <footer class="footer-area">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-sm-6 col-md-5">
                    <div class="single-footer-widget">
                        <h4>Discover Destination</h4>
                        <ul>
                            <li><a href="#">Miami, USA</a></li>
                            <li><a href="#">California, USA</a></li>
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
                <div class="col-sm-6 col-md-4">
                    <div class="single-footer-widget">
                        <h4>Subscribe Newsletter</h4>
                        <div class="form-wrap" id="mc_embed_signup">
                            <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" required="" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                </div>

                                <div class="info"></div>
                            </form>
                        </div>
                        <p>Subscribe our newsletter to get update news and offers</p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="single-footer-widget footer_icon">
                        <h4>Contact Us</h4>
                        <p>4156, New garden, New York, USA +880 362 352 783</p>
                        <span>contact@martine.com</span>
                        <div class="social-icons">
                            <a href="#"><i class="ti-facebook"></i></a>
                            <a href="#"><i class="ti-twitter-alt"></i></a>
                            <a href="#"><i class="ti-pinterest"></i></a>
                            <a href="#"><i class="ti-instagram"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <div class="copyright_part_text text-center">
                        <p class="footer-text m-0"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
    <!-- jquery plugins here-->
    <script src="js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>
    <script src="js/contact.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
</body>

</html>