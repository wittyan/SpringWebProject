<%@page import="semicolon.com.dao.MyPageDao"%>
<%@page import="semicolon.com.dao.AddressDao"%>
<%@page import="semicolon.com.dao.TaehoonDao"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiReserveBean"%>
<%@page import="semicolon.com.dao.SungsuDao"%>
<%@page import="semicolon.com.bean.SemiProductBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions"
	uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semicolon.com.dao.SuyeonSemiDao"%>
<%@page import="semicolon.com.bean.SemiReviewBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SEMI;LEISURE SPORTS</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min2.css">
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
    <link rel="stylesheet" href="css/infoStyle.css">
    <link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">

      <%
  	AppleDao appleDao = (AppleDao) request.getAttribute("appleDao");
  	TaehoonDao taehoonDao = (TaehoonDao) request.getAttribute("taehoonDao");
  	SungsuDao sungsuDao = (SungsuDao) request.getAttribute("sungsuDao");
  	SuyeonSemiDao suyeonSemiDao = (SuyeonSemiDao) request.getAttribute("suyeonSemiDao");
  	AddressDao addressDao = (AddressDao) request.getAttribute("addressDao");
  	MyPageDao myPageDao = (MyPageDao) request.getAttribute("myPageDao");
  	
      
        String id = request.getParameter("id");
		 int currentPage = 1;
		try{
		currentPage = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e){
			//e.printStackTrace();
		}
		int m =0;
		Calendar tDay = Calendar.getInstance();
		int y = tDay.get(Calendar.YEAR);
		if(currentPage==1){
		m = tDay.get(Calendar.MONTH);
		}else{
		m = (tDay.get(Calendar.MONTH)) + (currentPage-1);
		}
		int d = tDay.get(Calendar.DATE);
		//out.println(d);

		Calendar dSet = Calendar.getInstance();
		dSet.set(y, m, 1);
		int yo = dSet.get(Calendar.DAY_OF_WEEK);
		int last_day = tDay.getActualMaximum(Calendar.DATE); 
		
	
		SemiProductBean np = null;	
		
		
		
		/* 상품상세정보 가져오기 */
		
		
		SemiReserveBean srb = null;
		int pno1 = 0;
		
				 if(request.getParameter("pno")!=null){
				pno1 = Integer.parseInt(request.getParameter("pno"));
				
				}else{
					srb = (SemiReserveBean)session.getAttribute("semireservebean");
					pno1 = srb.getPno();
				} 
					np = sungsuDao.anselectProductFromPno(pno1); 
		
// 		System.out.println(srb);


//suyeon
		//String id="blue";
		ArrayList<SemiReserveBean>reList=null;
   		reList=(ArrayList<SemiReserveBean>)suyeonSemiDao.selectReserved(id);
   		String pno="";    // 여기를 해결 하면 됨
   		String cno="";
   		String rvid="";
   		
   		for(int i=0;i<reList.size();i++){
	   		pno=Integer.toString(reList.get(i).getPno());
	   		cno=Integer.toString(reList.get(i).getCno());
	   		rvid=reList.get(i).getId();
   		}
		
		int countReview=suyeonSemiDao.countReview(pno1);
	
		
		
		
	%>
<head>

<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script src="/team/js/infoEx.js" charset="UTF-8"></script>
 <script src="/team/js/custom.js"></script>
 <script type="text/javascript">

 </script>
 
 

</head>
<body>
<div id="wrap">
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
		<!-- test -->
      <div class="main_menu_iner">
            <div class="container">
                <div class="row align-items-center ">
                    <div class="col-lg-12">
                        <nav class="navbar navbar-expand-lg navbar-light justify-content-between">
                            <a class="navbar-brand" href="/team/index.do?id=<%=id%>"> <img src="/team/img/semi_logo.png" alt="logo" width="200" height="80"> </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse"
                                data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>

                            <div class="collapse navbar-collapse main-menu-item justify-content-center"
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
<%if(currentPage==1) {%>
    <!-- breadcrumb start-->
    <section class="breadcrumb breadcrumb_bg">
    	
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb_iner">
                        <div class="breadcrumb_iner_item text-center">
                            <h2>Reservation</h2>  	 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->
<%
}
%>

    <!--top place start-->
    <section class="event_part section_padding">
    	
	    	<div class="imgContainer">
	    		
<%
	if(np!=null){
		
%>
	<input type="hidden" value="<%=pno1%>" id="pno"/>
			<img id="img" alt="img"
				src="/team/semiupload/<%=np.getPfilename() %>"
				width="500" height="500">
<%
	}
%>
	    	</div>
	    
	        <div class="container" >
		        <div id="reserve">
		        	<div id="reserve_contents">
		        		<h5>예약하기</h5><br>
		                      <h2 style="font-family:'휴먼옛체'"><%=np.getPname() %></h2> <!-- 고객이 선택한 상품명 -->
		                      <!-- 달력 시작 -->              
		                        <table border="1">
		                 		<tr>
					            <td align="center" colspan="7">
					            <%
					            if (currentPage==1){
					            %>
					            <a id="monthid"><%=y%>년<%=(m+1)%>월</a> 달력
					            <a href="info.do?page=<%=currentPage + 1%>&id=<%=id%>&pno=<%=pno1%>">Next</a>
					            <%
					            }else if(currentPage>1&&currentPage<5){
					            %>
					            <a href="info.do?page=<%=currentPage - 1%>&id=<%=id%>&pno=<%=pno1%>">Before</a>
					            <a id="monthid"><%=y%>년<%=(m+1)%>월</a> 달력
					            <a href="info.do?page=<%=currentPage + 1%>&id=<%=id%>&pno=<%=pno1%>">Next</a>
					            <%
					            }else if(currentPage>4){
					            %>			         
					            <a href="info.do?page=<%=currentPage - 1%>&id=<%=id%>&pno=<%=pno1%>">Before</a>
					            <a id="monthid"><%=y%>년<%=(m+1)%>월</a> 달력
					            <%
					            }
					            %>   
					            </td>
		                		</tr>
				                <tr>
				             	<%
						         String[] a = { "sun", "mon", "tue", "wed", "thu", "fri", "sat" };
						         for (int i = 0; i < 7; i++) {%>
					            <td width="50" align="center"><%=a[i]%></td>
					            <%}%>
				                </tr>
				                <tr>
					            <%for (int k = 1; k < yo; k++) {%>
					            <td></td>
					            <%}%>
				             	<%for (int j = 1; j <= last_day; j++) {%>
					            <td align="center">
					            <%if( d <= j && currentPage==1){ %>
					            <a id="dayid"><%=j%></a>
						        <%
					            }else if(currentPage>1){
					            	d=1;
						        %>
						         <a id="dayid"><%=j%></a>
						        <%
					            }else{
					            %>
                                <%=j%>
					            <%
					            }
						        %>
						        <%if ((yo+j-1) % 7 == 0) {%>
						        </td></tr><tr>
					            <%}}for(int e=1;e<(7-yo);e++){%>
					            <td></td>
					            <%} %>
				                </tr>
			                    </table>
			                    <br>
			                    
			                    
		          <!-- 달력 끝 -->       
		          
		          
		          <p>예약날짜: <span id="dayid"><%=srb!=null?srb.getRdate().split(" ")[0]:""%></span> </p><br>
		              <p><span style="display:inline">이용시간 : <input readonly="readonly" name="timeFun" id="datepicker_2" value="<%=srb!=null?srb.getRdate().split(" ")[1]:""%>"style="display:inline; width:80%"/></span></p><br>
		                                        <p>상품가격: <span id="pprice">&nbsp;<%= np!=null?np.getpPrice():""%></span> </p><br>
		                                        <p>예약인원: <span>
		                                        <input type="text" name="pv" size="7" value="<%=srb!=null?srb.getRcount():""%>"/>
		                                        <select name="pv1">
		                                        <option selected="selected">선택하세요</option>
		                                        <option value="1">1</option>
		                                        <option value="2">2</option>
		                                        <option value="3">3</option>
		                                        <option value="4">4</option>
		                                        <option >직접입력</option>
		                                        <option></option>
		                                        </select><br>
		                                        </span> </p>
		                                        
		                             <a href="#" id="reservebtn" class="btn_1">예약하기</a> 
		                   </div>
		             </div>                      
	        </div>
        
    </section>
    <!--top place end-->
    
  <section id="productInfo">
    	<div>
    		<h1>상 품 상 세 정 보</h1>
    	</div>
    </section>
    
    <section id="productReview">
    	<div id="review">
    		<div id="reviewTop">
    			<h2>상품리뷰</h2>
    			<p>상품을 구매하신 분들이 작성하신 리뷰입니다.</p>
    		</div>
    		
	    		
	    	<%
		    	ArrayList<SemiReviewBean>list2=null;
				list2=(ArrayList<SemiReviewBean>)suyeonSemiDao.selectReview(pno1);
  				
			%>
				
		    	<div class="sortReview">
		    		<ul id="sortReview">
		    			<li class="liFirst">리뷰 <%=countReview%>건</li>
		    			<li><a href="#">최신순</a></li>
		    			<li><a href="#">평점높은순</a></li>
		    			<li><a href="#">평점낮은순</a></li>
		    		</ul>
	    		</div>
	    		<!-- <ul class="reviewUl1">
	    				<li>
	    					<div class="rating">
                                <div class="place_review">
                                   <a class="a1"><i class="fas fa-star"></i></a>
	                               <a class="a2"><i class="fas fa-star"></i></a>
	                               <a class="a3"><i class="fas fa-star"></i></a>
	                               <a class="a4"><i class="fas fa-star"></i></a>
	                               <a class="a5"><i class="fas fa-star"></i></a>
                                </div>
	                         </div>
	    				</li>
	    				<li class="rvGrade">1</li>
	    			</ul> -->
	    		
	    		
	    		<%
	    		if(list2!=null){
 					for(SemiReviewBean bean:list2){
	    		%>
	    		
		    		<div id="reviewUl">
		    			<ul class="reviewUl1">
		    				<li>
		    					<div class="rating">
	                                <div class="place_review">
	                                   <a class="a1"><i class="fas fa-star"></i></a>
		                               <a class="a2"><i class="fas fa-star"></i></a>
		                               <a class="a3"><i class="fas fa-star"></i></a>
		                               <a class="a4"><i class="fas fa-star"></i></a>
		                               <a class="a5"><i class="fas fa-star"></i></a>
	                                </div>
		                         </div>
		    				</li>
		    				<li class="rvGrade"><%=bean.getRvgrade() %></li>
		    			</ul>
		    			<%
		    				int rpno=bean.getPno();
		    				String pname=suyeonSemiDao.selectProductName(rpno);
		    			%>
		    			
		    			<ul class="reviewUl2">
		    				<li class="rvid">아이디 : <%=bean.getId() %></li>
		    				<li class="rvdate">작성일 : <%=bean.getRvdate() %></li>
		    				<li class="rvpname">상품명 : <%=pname %></li>
		    			</ul>
		    			<ul class="reviewUl3">
		    				<li class="reviewContents"><%=bean.getRvcontents() %></li>
		    				<li class="reviewImage">
		    					<img src="/team/semiupload/<%=bean.getRvfilename()%>" >	    					
		    				</li>
		    				
		    			</ul>
		    			<%
		    					} 
		    				}
		    			%>
	
		    		</div>
		    	
	    		
	    		<div id="reviewPaging">
	    			<!-- <a href="#"><img alt="preBtn" src=""></a> -->
	    			<ul>
		    			<li class="pagingli_f"><a href="#"><i>1</i></a></li>
		    			<li class="pagingli_s"><a href="#"><i>2</i></a></li>
		    			<li class="pagingli_t"><a href="#"><i>3</i></a></li>	    			
	    			</ul>
	    		</div>
	    		
	    		<div id="frmDiv">
	    			<h6><b>REVIEW</b>상품평을 남겨주세요.</h6>

	    			<form action="registerReview.do?pno=<%=pno1%>&id=<%=rvid %>" id="reviewFrm" name="reviewFrm" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
	    				<table>
	    					<tr>
	    						<td>
	    							<ul class="reviewUl1">
					    				<li>
					    					<div class="rating">
				                                <div class="place_review">
				                                   <a class="a1F"><i id="f_s" class="fas fa-star"></i></a>
					                               <a class="a2F"><i id="2_s" class="fas fa-star"></i></a>
					                               <a class="a3F"><i id="3_s" class="fas fa-star"></i></a>
					                               <a class="a4F"><i id="4_s" class="fas fa-star"></i></a>
					                               <a class="a5F"><i id="5_s" class="fas fa-star"></i></a>
				                                </div>
					                         </div>
					    				</li>
				    				</ul>
	    						</td>
	    					</tr>
	    					
		    				<tr>
		    					<td id="rvcontents">
				    				<textarea rows="10" cols="80" name="rvcontents" id="rvcontents"></textarea>	    						
		    					</td>
		    				</tr>
		    				<tr>
		    					<td id="rvfilename">
		    						<input type="file" name="rvfilename" id="rvfilename">
		    					</td>
		    				</tr>
	    				</table>
	    			
	    				<input type="submit" value="등록" id="send">
	    			</form>
	    		</div>

	    	</div>
	   
    </section>


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
                            <form target="_blank"
                                action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                                method="get" class="form-inline">
                                <input class="form-control" name="EMAIL" placeholder="Your Email Address"
                                    onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '"
                                    required="true" type="email">
                                <button class="click-btn btn btn-default text-uppercase"> <i class="far fa-paper-plane"></i>
                                </button>
                                <div style="position: absolute; left: -5000px;">
                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value=""
                                        type="text">
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
                        <p>4156, New garden, New York, USA
                                +880 362 352 783</p>
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
</div><!-- wrap end-->

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