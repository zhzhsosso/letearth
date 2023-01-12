<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!--====== Required meta tags ======-->
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!--====== Title ======-->
    <title>LET EARTH</title>
    
    <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="../resources/assets/images/favicon.ico" type="image/png">

    <!--====== Bootstrap css ======-->
    <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
    
    <!--====== flaticon css ======-->
    <link rel="stylesheet" href="../resources/assets/css/flaticon.css">
    
    <!--====== odometer css ======-->
    <link rel="stylesheet" href="../resources/assets/css/odometer.min.css">
    
    <!--====== magnific popup css ======-->
    <link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
    
    <!--====== Fontawesome css ======-->
    <link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">
    
    <!--====== animate css ======-->
    <link rel="stylesheet" href="../resources/assets/css/animate.min.css">
    
    <!--====== Slick css ======-->
    <link rel="stylesheet" href="../resources/assets/css/slick.css">
    
    <!--====== Default css ======-->
    <link rel="stylesheet" href="../resources/assets/css/default.css">
    
    <!--====== Style css ======-->
    <link rel="stylesheet" href="../resources/assets/css/style.css">
  
  
</head>

<body>

    <!--====== OFFCANVAS MENU PART START ======-->

    <div class="off_canvars_overlay">
                
    </div>
    <div class="offcanvas_menu">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="offcanvas_menu_wrapper">
                        <div class="canvas_close">
                            <a href="javascript:void(0)"><i class="fa fa-times"></i></a>  
                        </div>
                        <div class="offcanvas-social">
                            <ul class="text-center">
                                <li><a href="$"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href="$"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="$"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="$"><i class="fa fa-dribbble"></i></a></li>
                            </ul>
                        </div>
                        <div id="menu" class="text-left ">
                            <ul class="offcanvas_main_menu">
                                <li class="menu-item-has-children active">
                                    <a href="#">Home</a>
                                    <ul class="sub-menu">
                                        <li><a href="index.html">Home 1</a></li>
                                        <li><a href="index-2.html">Home 2</a></li>
                                        <li><a href="index-3.html">Home 3</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children active">
                                    <a href="about.html">About</a>
                                </li>
                                <li class="menu-item-has-children active">
                                    <a href="#">Explore</a>
                                    <ul class="sub-menu">
                                        <li><a href="projects-1.html">Project 1</a></li>
                                        <li><a href="projects-2.html">Project 2</a></li>
                                        <li><a href="single-project.html">Single Project</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children active">
                                    <a href="#">Pages</a>
                                    <ul class="sub-menu">
                                        <li><a href="faq.html">FAQ</a></li>
                                        <li><a href="gallery.html">Gallery</a></li>
                                        <li><a href="team-members.html">Team Members</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children active">
                                    <a href="#">News</a>
                                    <ul class="sub-menu">
                                        <li><a href="news.html">News</a></li>
                                        <li><a href="single-news.html">Single News</a></li>
                                    </ul>
                                </li>
                                <li class="menu-item-has-children active">
                                    <a href="contact.html">Contact</a>
                                </li>
                            </ul>
                        </div>
                        <div class="offcanvas_footer">
                            <span><a href="mailto:tanvirahmed8282@gmail.com"><i class="fa fa-envelope-o"></i> layerdrops@gmail.com</a></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--====== OFFCANVAS MENU PART ENDS ======-->

    <!--====== HEADER PART START ======-->
    
    <header class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="header-top d-flex justify-content-between align-items-center">
                        <div class="header-info">
                            <ul>
<!--                                 <li><a href="#"><i class="flaticon-email"></i> needhelp@krowd.com</a></li> -->
<!--                                 <li><a href="#"><i class="flaticon-placeholder"></i> 66 Broklyn Street, USA</a></li> -->
                            </ul>
                        </div>
                        <div class="social">
                            <ul>
                            	<c:choose>
	                            	<c:when test="${mem_id == null}">
	                                	<li><a href="/member/login">회원가입/로그인</a></li>
	                                </c:when>
	                                <c:when test="${mem_id != null}">
	                                	<li><a href="/mypage/mypage">${mem_id } 님, 환영합니다!</a></li>
	                                	<li><a href="/member/logout">로그아웃</a></li>
	                                </c:when>
                                </c:choose>
<!--                                 <li><a href="/project/createFirst">프로젝트 만들기</a></li> -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main-header">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="main-header-item">
                            <div class="main-header-menus  d-flex justify-content-between align-items-center">

                                <div class="header-logo">
                                    <a href="/main/all"><img src="../resources/assets/images/logo.png" alt="logo"></a>
                                </div>

                                <div class="header-menu d-none d-lg-block">
                                    <ul>
                                        <li>
                                            <a class="active" href="/main/all">Home</a>
                                        </li>
                                        <li>
                                            <a href="/main/scheall">오픈예정 </a>
                                            <ul class="sub-menu">
                                                <li><a href="/main/scheclass">클래스</a></li>
                                                <li><a href="/main/scheprod">상품</a></li>
<!--                                                 <li><a href="single-project.html">Single Project</a></li> -->
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="/main/nowall">진행중 </a>
                                            <ul class="sub-menu">
                                                <li><a href="/main/nowclass">클래스</a></li>
                                                <li><a href="/main/nowprod">상품</a></li>
<!--                                                 <li><a href="team-members.html">Team Members</a></li> -->
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="/main/endall">마감 </a>
                                            <ul class="sub-menu">
                                                <li><a href="/main/endclass">클래스</a></li>
                                                <li><a href="/main/endprod">상품</a></li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="/notice/main">공지사항 & 이벤트 </a>
                                            <ul class="sub-menu">
                                                <li><a href="/notice/all">공지사항</a></li>
                                                <li><a href="/notice/event">이벤트</a></li>
                                            </ul>
                                        </li>
<!--                                         <li><a href="contact.html">Contact</a></li> -->
                                    </ul>
                                </div>

                                <div class="header-info d-flex align-items-center ">
                                    <div class="search d-none d-sm-block">
                                        <a href="#">
                                            <svg height="22" width="22" fill="#838694" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                                 viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve">
                                            <g>
                                                <g>
                                                    <path d="M508.875,493.792L353.089,338.005c32.358-35.927,52.245-83.296,52.245-135.339C405.333,90.917,314.417,0,202.667,0
                                                        S0,90.917,0,202.667s90.917,202.667,202.667,202.667c52.043,0,99.411-19.887,135.339-52.245l155.786,155.786
                                                        c2.083,2.083,4.813,3.125,7.542,3.125c2.729,0,5.458-1.042,7.542-3.125C513.042,504.708,513.042,497.958,508.875,493.792z
                                                         M202.667,384c-99.979,0-181.333-81.344-181.333-181.333S102.688,21.333,202.667,21.333S384,102.677,384,202.667
                                                        S302.646,384,202.667,384z"/>
                                                </g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            <g>
                                            </g>
                                            </svg>
                                        </a>
                                    </div>
                                    <div>
                                        <h5 class="title"><a href="/project/createFirst">프로젝트 만들기</a></h5>
                                    </div>
                                    <div class="toggle-btn ml-30 canvas_open d-lg-none d-block">
                                        <i class="fa fa-bars"></i>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
  
    
    <!--====== HEADER PART ENDS ======-->