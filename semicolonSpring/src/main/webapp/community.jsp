<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="semicolon.com.bean.SemiNoticeBean"%>
<%@page import="semicolon.com.bean.SemiEventBean"%>
<%@page import="semicolon.com.dao.AppleDao"%>
<%@page import="semicolon.com.bean.SemiQnaBean"%>

<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>COMMUNITYPAGE</title>
<link rel="shortcut icon" type="image/x-icon"
	href="/team/img/semi_logo.png">
<link href="/team/css/layout.css" rel="stylesheet" type="text/css"
	media="all">
<link rel="stylesheet" href="/team/css/bootstrap.min.css">
<link rel="stylesheet" href="/team/css/style.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.0.min.js"></script>
<link rel="stylesheet" href="/team/css/jquery-ui.css">

<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
	
</script>
<script>
	$(function() {
		var id = '${id }';

		/* 초기에 선택되는 탭 결정 */
		var type = '${type }';
		var selectIndex;
		if (type == 'qna') {
			selectIndex = 0;

			$(".comm_btn").hide();
			$("#awrite").attr("href",
					'/team/qnaForm.do' + $("input#qna").attr("value"));
			if (id != null) {
				$(".comm_btn").show();
			}

		} else if (type == 'notice') {
			selectIndex = 1;
			$(".comm_btn").hide();
			$("#awrite").attr("href",
					'/team/noticeForm.do' + $("input#notice").attr("value"));
			if (id != null && id == 'admin') {
				$(".comm_btn").show();
			}
		} else if (type == 'event') {
			selectIndex = 2;
			$(".comm_btn").hide();
			$("#awrite").attr("href",
					'/team/eventForm.do' + $("input#event").attr("value"));
			if (id != null && id == 'admin') {
				$(".comm_btn").show();
			}
		}

		$("#tabs").tabs({
			active : selectIndex
		});

		/* 탭이 클릭되면 선택된 탭에 따라 글쓰기 버튼의 href 변경 */
		$('#tabs').click(
				'tabsselect',
				function(event, ui) {
					var selectedTab = $("#tabs").tabs('option', 'active');
					if (selectedTab == 0) {
						$(".comm_btn").hide();
						$("#awrite").attr(
								"href",
								'/team/qnaForm.do'
										+ $("input#qna").attr("value"));
						if (id != null) {
							$(".comm_btn").show();
						}

					} else if (selectedTab == 1) {
						$(".comm_btn").hide();
						$("#awrite").attr(
								"href",
								'/team/noticeForm.do'
										+ $("input#notice").attr("value"));
						if (id != null && id == 'admin') {
							$(".comm_btn").show();
						}
					} else if (selectedTab == 2) {
						$("#awrite").attr(
								"href",
								'/team/eventForm.do'
										+ $("input#event").attr("value"));
						$(".comm_btn").hide();
						if (id != null && id == 'admin') {
							$(".comm_btn").show();
						}

					}
					;
				});
		$('a[href="#"]').click(function(e) {
			e.preventDefault();
		});
		$(".comm_btn").click(function() {
			$("#awrite").get(0).click();
		});

	});
</script>
<style>
#tabs {
	margin: 0 auto;
	width: 1300px;
	height: 500px;
}

ul.tabs_ul {
	text-align: center;
	postion: relative;
	z-index: 1;
}

#tabs .tabs_table {
	width: 80%;
	margin: 40px auto;
	font-size: 20px;
	text-align: center;
}

#tabs .tabs_table th {
	padding: 10px 50px;
}

#tabs h2 {
	font-size: 50px;
	font-weight: bold;
	text-align: center;
	margin-top: 20px;
}

button.comm_btn {
	float: right;
	position: relative;
	z-index: 2;
	width: 100px;
	height: 50px;
	margin: 20px 100px;
	padding: 0;
	border: none;
	border-radius: 0;
	background-color: #fe5c24;
	transition: 0.5s;
}

button.comm_btn:hover {
	background-color: #007bff;
	transition: 0.5s;
}

button.comm_btn>a {
	color: #fff;
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

	<!-- breadcrumb start-->
	<section class="breadcrumb breadcrumb_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb_iner">
						<div class="breadcrumb_iner_item text-center">
							<h2>COMMUNITY</h2>
							<p>문의사항 공지사항 이벤트</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- breadcrumb start-->

	<div class="comm_section">



		<input type="hidden" id="qna"
			value="?type=qna&mode=new&page=${pageBean.qnacurrentPage }">
		<input type="hidden" id="notice"
			value="?type=notice&mode=new&page=${pageBean.noticecurrentPage }">
		<input type="hidden" id="event"
			value="?type=event&mode=new&page=${pageBean.eventcurrentPage }">



		<c:if test="${id ne null}">
			<button class="comm_btn">
				<a id="awrite"
					href="/team/qnaForm.do?type=qna&mode=new&page=${pageBean.qnacurrentPage }">글쓰기</a>
			</button>
		</c:if>
		<div id="tabs">
			<ul class="tabs_ul">
				<li><a href="#tabs-1">문의사항</a></li>
				<li><a href="#tabs-2">공지사항</a></li>
				<li><a href="#tabs-3">이벤트</a></li>
			</ul>
			<div id="tabs-1">
				<h2>문의사항</h2>
				<table class="table" border="1px solid black">
					<colgroup>
						<col width="140" />
						<col width="600" />
						<col width="200" />
						<col width="200" />
						<col width="200" />
						<col width="200" />
					</colgroup>
					<tr style="background-color: #dcdcdc">
						<th style="text-align: center;" scope="col">번호</th>
						<th style="text-align: center;" scope="col">제목</th>
						<th style="text-align: center;" scope="col">답변상태</th>
						<th style="text-align: center;" scope="col">글쓴이</th>
						<th style="text-align: center;" scope="col">작성일</th>
						<th style="text-align: center;" scope="col">조회수</th>
					</tr>

					<c:if test="${(QnaList ne null) and (fn:length(QnaList) gt 0) }">
						<c:forEach var="i" items="${QnaList}" varStatus="cnt">
							<tr>
								<td style="text-align: center;">${i.qno }</td>
								<td style="text-align: left"><c:if
										test="${i.ref ne i.qno }">

										<c:forEach var="i2" begin="0" end="${i.lev }" varStatus="cnt2">  
									&nbsp;&nbsp; 
								
 								</c:forEach>
										<img src="/team/semiupload/reply.png" width="10" height="10" />
									</c:if> <a
									href="qnaContents.do?no=${i.qno}&page=${pageBean.qnacurrentPage }"
									style="cursor: pointer;"
									onmouseover="style='text-decoration:underline;'"
									onmouseout="style='text-decoration:none'">${i.qtitle}</a></td>

								<td style="text-align: center;"><c:if
										test="${i.ref eq i.qno}">
										<c:choose>
											<c:when test="${i.qstate eq 'true'}">
												<font color="red">진행중</font>
											</c:when>
											<c:otherwise>
												<font color="blue">답변완료</font>
											</c:otherwise>
										</c:choose>
									</c:if></td>
								<td style="text-align: center;">${i.id }</td>
								<td style="text-align: center;">${i.qdate }</td>
								<td style="text-align: center;">${i.qhit }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- paging section -->
				<nav class="pagination" style="display: inline-block; float: none;">
					<ul>
						<c:if test="${pageBean ne null }">
							<c:choose>
								<c:when test="${pageBean.qnacurrentBlock gt 1}">
									<li><a
										href="/team/communityList.do?type=qna&page=${pageBean.qnastartPage-1 }">&laquo;
											이전</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="#">&laquo; 이전</a></li>
								</c:otherwise>
							</c:choose>


							<c:choose>
								<c:when test="${pageBean.qnacurrentPage gt 1}">
									<li><a
										href="/team/communityList.do?page=${pageBean.qnacurrentPage-1 }">&laquo;
											Previous</a></li>
								</c:when>
							</c:choose>

							<c:forEach var="i" begin="${pageBean.qnastartPage }"
								end="${pageBean.qnaendPage }" varStatus="cnt">
								<c:choose>
									<c:when test="${pageBean.qnacurrentPage eq i}">
										<li><a href="#"><font color="red" size="3">${i }</font></a></li>
									</c:when>
									<c:otherwise>
										<li><a href="/team/communityList.do?type=qna&page=${i }">${i }</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when
										test="${pageBean.qnacurrentPage lt pageBean.qnatotalPage }">
										<li><a
											href="/team/communityList.do?type=qna&page=${pageBean.qnacurrentPage + 1}">Next</a></li>
									</c:when>
									<c:when test="${pageBean.qnatotalPage gt pageBean.qnaendPage }">
										<li><a
											href="/team/communityList.do?type=qna&page=${pageBean.qnaendPage + 1}">다음&raquo;</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#">다음&raquo;</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</ul>
				</nav>
			</div>


			<%--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@---%>
			<div id="tabs-2">
				<h2>공지사항</h2>

				<table class="table" border="1px solid black">
					<colgroup>
						<col width="140" />
						<col width="600" />
						<col width="200" />
						<col width="200" />
						<col width="200" />
					</colgroup>
					<tr style="background-color: #dcdcdc">
						<th style="text-align: center;" scope="col">번호</th>
						<th style="text-align: center;" scope="col">제목</th>
						<th style="text-align: center;" scope="col">글쓴이</th>
						<th style="text-align: center;" scope="col">작성일</th>
						<th style="text-align: center;" scope="col">조회수</th>
					</tr>

					<c:if test="${NoticeList ne null }">

						<c:forEach var="i" items="${NoticeList }" varStatus="cnt">
							<tr>
								<td style="text-align: center;">${i.nno}</td>
								<td style="text-align: left"><a
									href="noticeContents.do?no=${i.nno}&page=${pageBean.noticecurrentPage}"
									style="cursor: pointer;"
									onmouseover="style='text-decoration:underline;'"
									onmouseout="style='text-decoration:none'">${i.ntitle }</a></td>
								<td style="text-align: center;">${i.id}</td>
								<td style="text-align: center;">${i.ndate}</td>
								<td style="text-align: center;">${i.nhit}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- paging section -->
				<nav class="pagination" style="display: inline-block; float: none;">
					<ul>

						<c:choose>
							<c:when test="${pageBean.noticecurrentBlock gt 1}">
								<li><a
									href="/team/communityList.do?type=notice&page=${pageBean.noticestartPage-1 }">&laquo;
										이전</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&laquo; 이전</a></li>
							</c:otherwise>
						</c:choose>
						<c:if test="${pageBean.noticecurrentPage gt 1}">
							<li><a
								href="/team/communityList.do?page=${pageBean.noticecurrentPage -1}">&laquo;
									Previous</a></li>
						</c:if>

						<c:forEach var="i" begin="${pageBean.noticestartPage }"
							end="${pageBean.noticeendPage }" varStatus="cnt">
							<c:choose>
								<c:when test="${ pageBean.noticecurrentPage eq i}">

									<li><a href="#"><font color="red" size="3">${i }</font></a></li>
								</c:when>
								<c:otherwise>

									<li><a href="/team/communityList.do?type=notice&page=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if
							test="${pageBean.noticecurrentPage lt pageBean.noticetotalPage }">
							<li><a
								href="/team/communityList.do?type=notice&page=${pageBean.noticecurrentPage + 1}">Next</a></li>
						</c:if>

						<c:choose>
							<c:when
								test="${pageBean.noticetotalPage gt pageBean.noticeendPage }">

								<li><a
									href="/team/communityList.do?type=notice&page=${pageBean.noticeendPage + 1}">다음&raquo;</a></li>
							</c:when>
							<c:otherwise>

								<li><a href="#">다음&raquo;</a></li>

							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>


			<div id="tabs-3">
				<h2>이벤트</h2>
				<table class="table" border="1px solid black">
					<colgroup>
						<col width="140" />
						<col width="600" />
						<col width="200" />
						<col width="200" />
						<col width="200" />
						<col width="200" />
					</colgroup>
					<tr style="background-color: #dcdcdc">
						<th style="text-align: center;" scope="col">번호</th>
						<th style="text-align: center;" scope="col">제목</th>
						<th style="text-align: center;" scope="col">진행상태</th>
						<th style="text-align: center;" scope="col">글쓴이</th>
						<th style="text-align: center;" scope="col">작성일</th>
						<th style="text-align: center;" scope="col">조회수</th>
					</tr>

					<c:if test="${EventList ne null }">
						<c:forEach var="i" items="${EventList }" varStatus="cnt">

							<tr>
								<td style="text-align: center;">${i.eno }</td>
								<td style="text-align: left"><a
									href="eventContents.do?no=${i.eno}&page=${pageBean.eventcurrentPage}"
									style="cursor: pointer;"
									onmouseover="style='text-decoration:underline;'"
									onmouseout="style='text-decoration:none'">${i.etitle }</a></td>
								<td style="text-align: center;"><c:choose>
										<c:when test="${ i.eprogress eq 'true'}">
											<font color="red">진행중</font>
										</c:when>
										<c:otherwise>
											<font color="blue">종료</font>
										</c:otherwise>
									</c:choose></td>
								<td style="text-align: center;">${i.id }</td>
								<td style="text-align: center;">${i.edate }</td>
								<td style="text-align: center;">${i.ehit }</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
				<!-- paging section -->
				<nav class="pagination" style="display: inline-block; float: none;">
					<ul>

						<c:choose>
							<c:when test="${pageBean.eventcurrentBlock gt 1}">
								<li><a
									href="/team/communityList.do?type=event&page=${pageBean.eventcurrentPage - 1}">&laquo;
										이전</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">&laquo; 이전</a></li>

							</c:otherwise>
						</c:choose>



						<c:if test="${pageBean.eventcurrentPage gt 1 }">
							<li><a
								href="/team/communityList.do?page=${pageBean.eventcurrentPage -1 }">&laquo;
									Previous</a></li>
						</c:if>

						<c:forEach var="i" begin="${pageBean.eventstartPage}"
							end="${pageBean.eventendPage }">
							<c:choose>
								<c:when test="${pageBean.eventcurrentPage eq i}">
									<li><a href="#"><font color="red" size="3">${i }</font></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="/team/communityList.do?type=event&page=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if
							test="${pageBean.eventcurrentPage lt pageBean.eventtotalPage }">
							<li><a
								href="/team/communityList.do?type=event&page=${pageBean.eventcurrentPage + 1}">Next</a></li>
						</c:if>

						<c:choose>
							<c:when
								test="${pageBean.eventtotalPage gt pageBean.eventendPage}">
								<li><a
									href="/team/communityList.do?type=event&page=${pageBean.eventendPage + 1 }">다음&raquo;</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="#">다음&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>

			</div>
		</div>

	</div>
	<!-- footer part start-->

	<!-- footer part end-->
<a style="display:scroll;position:fixed;bottom:40px;right:10px; width:50px; height:50px" href="#" title=”맨위로"><img src="/team/semiupload/img_top.png"></a>
	
</body>
</html>