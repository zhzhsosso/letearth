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
	                                	<c:if test="${mem_id ne 'admin' }">
		                                	<li><a href="/mypage/mypage">${mem_id } 님, 환영합니다!</a></li>
		                                	<li><a href="/member/logout">로그아웃</a></li>
	                                	</c:if>
	                                	<c:if test="${mem_id eq 'admin' }">
		                                	<li><a href="/board/adMain">관리자님, 환영합니다!</a></li>
		                                	<li><a href="/member/logout">로그아웃</a></li>
	                                	</c:if>
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
                                    <a href="/main/all"><img src="../resources/assets/images/LElogo.png" alt="logo"></a>
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
                                                <li><a href="/board/adFaqList">FAQ</a></li>
                                            </ul>
                                        </li>
<!--                                         <li><a href="contact.html">Contact</a></li> -->
                                    </ul>
                                </div>

                                <div class="header-info d-flex align-items-center ">
                                    <div>
                                        <h5 class="title"><a href="/project/createFirst" style="color: #828d77;">프로젝트 만들기</a></h5>
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