<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${id ne 'admin' }">
<c:redirect url="index.do"/>
</c:if>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta charset="euc-kr">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Martine</title>
    <link rel="icon" href="/team/img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/team/css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="/team/css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="/team/css/owl.carousel.min.css">
    <!-- themify CSS -->
    <link rel="stylesheet" href="/team/css/themify-icons.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="/team/css/flaticon.css">
    <!-- fontawesome CSS -->
    <link rel="stylesheet" href="/team/fontawesome/css/all.min.css">
    <!-- magnific CSS -->
    <link rel="stylesheet" href="/team/css/magnific-popup.css">
    <link rel="stylesheet" href="/team/css/gijgo.min.css">
    <!-- niceselect CSS -->
    <link rel="stylesheet" href="/team/css/nice-select.css">
    <!-- slick CSS -->
    <link rel="stylesheet" href="/team/css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="/team/css/style.css">
</head>

<body>
   <!--::header part start::-->
   <header class="main_menu">
        <div class="sub_menu">
            <div class="container">
              
              <%String id = (String) request.getSession().getAttribute("id"); %>
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
                                        <a class="nav-link" href="index.do">Home</a>
                                    </li>
                                   <!--  <li class="nav-item">
                                        <a class="nav-link" href="registerCompay.do">Insert Company</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="registerProduct.do">Insert Product</a>
                                    </li> -->
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Company
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="registerCompay.do?id=<%=id%>">Insert</a>
                                            <a class="dropdown-item" href="companyList.do?cmd=comList&id=<%=id%>">List</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Product
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="registerProduct.do?id=<%=id%>">Insert</a>
                                            <a class="dropdown-item" href="proList.do?cmd=proList&id=<%=id%>">List</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="blog.html" id="navbarDropdown"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Reservation
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                            <a class="dropdown-item" href="memberList.do?id=<%=id%>">Reservation List</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown_1"
                                            role="button" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                            Community
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="navbarDropdown_1">
                                            <a class="dropdown-item" href="qnaForm.do?id=<%=id%>">Qna</a>
                                            <a class="dropdown-item" href="noticeForm.do?id=<%=id%>">Notice</a>
                                            <a class="dropdown-item" href="eventForm.do?id=<%=id%>">Event</a>                                     
                                            
                                        </div>
                                    </li>
                                    <!-- <li class="nav-item">
                                        <a class="nav-link" href="contact.html">Contact</a>
                                    </li> -->
                                </ul>
                            </div>
                            <a href="logout.do" class="btn_1 d-none d-lg-block">Logout</a>
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
                            <h2>Admin Page</h2>
                            <br>
                            <br>
                            <p style="font-size:50px">SEMICOLON;</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb start-->

    <!-- ================ contact section start ================= -->



    <!-- ================ contact section end ================= -->

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
<a style="display:scroll;position:fixed;bottom:40px;right:10px; width:50px; height:50px" href="#" title=”맨위로"><img src="/team/semiupload/img_top.png"></a>
    <!-- jquery plugins here-->
    <script src="/team/js/jquery-1.12.1.min.js"></script>
    <!-- popper js -->
    <script src="/team/js/popper.min.js"></script>
    <!-- bootstrap js -->
    <script src="/team/js/bootstrap.min.js"></script>
    <!-- magnific js -->
    <script src="/team/js/jquery.magnific-popup.js"></script>
    <!-- swiper js -->
    <script src="/team/js/owl.carousel.min.js"></script>
    <!-- masonry js -->
    <script src="/team/js/masonry.pkgd.js"></script>
    <!-- masonry js -->
    <script src="/team/js/jquery.nice-select.min.js"></script>
    <script src="/team/js/gijgo.min.js"></script>
    <!-- contact js -->
    <script src="/team/js/jquery.ajaxchimp.min.js"></script>
    <script src="/team/js/jquery.form.js"></script>
    <script src="/team/js/jquery.validate.min.js"></script>
    <script src="/team/js/mail-script.js"></script>
    <script src="/team/js/contact.js"></script>
    <!-- custom js -->
    <script src="/team/js/custom.js"></script>
</body>

</html>