<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>

<style type="text/css">
body {
	/* 	background: #f9f9f9; */
	/* 	font-family: "Roboto", sans-serif; */
	
}

.main-content {
	padding-top: 100px;
	padding-bottom: 100px;
}

.table {
	border-spacing: 0 15px;
	border-collapse: separate;
}

.table thead tr th, .table thead tr td, .table tbody tr th, .table tbody tr td
	{
	vertical-align: middle;
	border: none;
}

.table thead tr th:nth-last-child(1), .table thead tr td:nth-last-child(1),
	.table tbody tr th:nth-last-child(1), .table tbody tr td:nth-last-child(1)
	{
	text-align: center;
}

.table tbody tr {
	box-shadow: 0 2px 10px rgb(184 179 158/ 50%);
	border-radius: 5px;
}

.table tbody tr td {
	background: #fff;
}

.table tbody tr td:nth-child(1) {
	border-radius: 5px 0 0 5px;
}

.table tbody tr td:nth-last-child(1) {
	border-radius: 0 5px 5px 0;
}

.user-info {
	display: flex;
	align-items: center;
}

.user-info__img img {
	margin-right: 15px;
	height: 55px;
	width: 55px;
	border-radius: 45px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.active-circle {
	height: 10px;
	width: 10px;
	border-radius: 10px;
	margin-right: 5px;
	display: inline-block;
}

.shadow {
	box-shadow: 0 5px 20px rgba(0, 0, 0, 0.06) !important;
}

.img-circle {
	height: 180px;
	width: 180px;
	border-radius: 150px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 1;
}

.img-rectangle {
	width: 400px;
	height: 180px;
	border: 3px solid #fff;
	box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
	object-fit: cover;
}

/*사이드바*/
/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	/*    top: 30%;  */
	/*    left: 20%;  */
	background-color: #EDEAE0;
	overflow-x: hidden;
	padding-top: 30px;
	padding-bottom: 100px;
	position: relative;
	top: 120px;
	left: 250px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 17px;
	color: #414934;
	display: block;
	border: none;
	background: none;
	width: 100%;
	text-align: left;
	cursor: pointer;
	outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
	color: #B6AD90;
}

/* Main content */
.main {
	margin-left: 200px; /* Same as the width of the sidenav */
	font-size: 20px; /* Increased text to enable scrolling */
	padding: 0px 10px;
	position: relative;
	top: 30%;
	left: 20%
}

/* Add an active class to the active dropdown button */
.active1 {
	background-color: #D7D1B9;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: #EDEAE0;
	padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
	float: right;
	padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.inline-block-center div {
	display: inline-block;
	width: 600px;
	margin: 0px auto;
}

.flex-container {
	display: flex;
	/* display: inline-flex; */
}

/*버튼체인지색상*/
.main-btn::before {
	position: absolute;
	content: '';
	right: 0;
	top: 0;
	height: 17px;
	width: 17px;
	background: #6F7B63;
	border-radius: 0.25rem;
	z-index: -1;
}

.main-btn {
	border-radius: 0.25rem;
	background-color: #A4AC85;
	color: #F2F0E8;
	font-size: 18px;
	font-weight: bolder;
	text-align: center;
	vertical-align: middle;
	line-height: 0px;
	padding: 12px;
	align-content: center;
	width: 140px;
	height: 60px;
	margin: 10px;
}

#sbtn { /*검색버튼*/
	position: absolute;
	top: 0px;
	background-color: #A4AC85;
	height: 35px;
}

/*페이징*/
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	z-index: 2;
	color: #fff;
	cursor: default;
	background-color: #89A378;
	border-color: #89A378;
}
</style>



<br>
<br>
<br>
<br>
<br>
<br>

<!--====== PAGE TITLE PART START ======-->

<section class="page-title-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div>
					<h3 class="title"
						style="color: #6c757d; font-size: 2.5em; margin-left: 130px;">
						<b>${proVO.pro_title }</b>
					</h3>
				</div>
			</div>
		</div>
	</div>
</section>

<!--====== PAGE TITLE PART ENDS ======-->

<!--====== PROJECT CONTENT PART START ====== -->
<section class="project-details-content-area pb-110">
	<div style="display: flex;">
		<!-- 사이드바 -->
		<div class="sidenav">
			<a href="/board/adMain"> <i class="fa fa-solid fa-leaf"></i> <span
				style="position: relative; left: 2px; bottom: 3px; font-weight: bolder;">관리자메인</span>
			</a>
			<button class="dropdown-btn">
				<i class="fa fa-solid fa-paper-plane"></i> &nbsp;고객센터 <i
					class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="/board/adNoticeList">공지사항</a> <a href="/board/adFaqList">FAQ</a>
				<a href="/board/adRewriteList">1:1문의</a>
			</div>

			<button class="dropdown-btn">
				<i class="fa fa-solid fa-bank"></i> &nbsp;펀딩관리 <i
					class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="#">프로젝트 승인</a> <a href="#">프로젝트 목록</a> <a href="#">재펀딩</a>
				<a href="#">정산관리</a>
			</div>

			<button class="dropdown-btn">
				<i class="fa fa-solid fa-users"></i> &nbsp;회원관리 <i
					class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="/report/adRepList">신고접수관리</a> <a href="#">회원목록</a> <a
					href="/report/adBlackList">블랙리스트</a>
			</div>
		</div>
		<!-- 사이드바 -->








		<div class="container">
			<div class="container" style="width: 1400">
				<div class="col-lg-8">
					<!-- 					<form action="/mempro/adProList1" method="get"> -->
					<div class="project-details-content-top">
						<div class="col-lg-4 col-md-7 col-sm-9"></div>
					</div>

					<!-- div class="flex-container" -->
					<!-- 회원정보 (프로필) -->
					<div class="flex-container" style="width: 1000">
						<div class="project-details-item" style="width: 1000">
							<br> <br> <br> <br> <br>
							<div>
								<p style="font-size: 30px; color: #6c757d;" align="left">판매자
									정보</p>
								<br>
								<h5 class="title"></h5>



								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
									style="border-color: rgb(164 172 133/ 40%);">
									<div class="banner"></div>
									<c:choose>
										<c:when test="${not empty proVO.memberVO.mem_profile }">
											<img src="" alt="" class="img-circle mx-auto mb-3">
										</c:when>
										<c:otherwise>
											<img src="/resources/assets/images/userimg.png" alt=""
												class="img-circle mx-auto mb-3">
										</c:otherwise>
									</c:choose>
									<%--<img src="/resources/assets/images/${proVO.memberVO.mem_profile }" alt="" class="img-circle mx-auto mb-3"> --%>
									<h3 class="mb-4">${proVO.mem_id }</h3>



									<table class="table table-condensed">
										<tbody>
											<tr>
												<th style="width: 150px">연락처</th>
												<td>${proVO.memberVO.mem_phone }</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td>${proVO.memberVO.mem_email }</td>
											</tr>
											<tr>
												<th>가입날짜</th>
												<td><fmt:formatDate
														value="${proVO.memberVO.mem_cr_dt }" pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<th>펀딩횟수</th>
												<td>${memPro }회</td>
											</tr>
											<tr>
												<th>구매횟수</th>
												<td>${memOrd }회</td>
											</tr>

										</tbody>
									</table>



								</div>
							</div>
						</div>
						<!-- 회원정보 (프로필) -->


						<!-- 중간 텀 -->
						<div class id="empty" style="width: 100"></div>
						<!-- 중간 텀 -->


						<br> <br>
						<!-- 프로젝트정보 (프로필) -->
						<!-- detail1 : X 달성금액, 달성률, 배송상황, 정산현황 -->
						<!-- detail2 : O 달성금액, 달성률, 배송상황, 정산현황 -->
						<div class="project-details-item" style="width: 1000">
							<br> <br> <br> <br> <br>
							<div>
								<p style="font-size: 30px; color: #6c757d;" align="left">프로젝트
									정보</p>
								<br>
								<h5 class="title"></h5>
								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
									style="border-color: rgb(164 172 133/ 40%);">
									<table class="table table-condensed">
										<!-- 사진을 넣을지 그냥 타이틀만 넣을지 정하기 -->
										<div class="banner">
											<img src="/resources/assets/images/messi.jpg" alt=""
												class="img-rectangle"> <br>
											<h4 class="mb-4">
												<br>${proVO.pro_title }</h4>
											<tbody>
												<!-- 												<tr> -->
												<!-- 													<th style="width: 150px">제목</th> -->
												<%-- 													<td>${proVO.pro_title }</td> --%>
												<!-- 												</tr> -->
												<tr>
													<th>시작일</th>
													<td>${proVO.pro_st_dt }</td>
												</tr>
												<tr>
													<th>종료일</th>
													<td>${proVO.pro_ed_dt }</td>
												</tr>
												<tr>
													<th>기간</th>
													<fmt:parseDate value="${proVO.pro_st_dt }" var="str_Date"
														pattern="yyyy-MM-dd" />
													<fmt:parseNumber value="${str_Date.time / (1000*60*60*24)}"
														integerOnly="true" var="strDate"></fmt:parseNumber>
													<fmt:parseDate value="${proVO.pro_ed_dt }" var="end_Date"
														pattern="yyyy-MM-dd" />
													<fmt:parseNumber value="${end_Date.time / (1000*60*60*24)}"
														integerOnly="true" var="endDate"></fmt:parseNumber>
													<td>${endDate - strDate }일</td>
												</tr>
												<tr>
													<th>목표금액</th>
													<td><fmt:formatNumber value="${proVO.pro_gp }" />원</td>
												</tr>
												<th></th>
												<td></td>
												</tr>

											</tbody>
										</div>
									</table>
								</div>
							</div>
						</div>
					</div>
					<!-- div class="flex-container" -->



					<!-- 결제회원 리스트 -->
					<br> <br> <br> <br>
					<div class="container" style="width: 135%">
						<p style="font-size: 2em;">결제 회원 리스트</p>
						<br>

							<!-- 결제회원이 없을 때 -->
						<c:choose>
							<c:when test="${empty ordList }">
								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
									style="border-color: rgb(164 172 133/ 40%); display: block;">
									<i class="ion-checkmark-round"></i>&nbsp;결제한 회원 내역이 없습니다.
									<h5 class="title"></h5>

									<table class="table">
										<!-- 								<thead> -->
										<!-- 								</thead> -->

										<%-- 								<c:forEach var="ordList" items="${ordList  }" varStatus="status"> --%>
										<!-- 									<tbody> -->
										<!-- 									</tbody> -->
										<%-- 								</c:forEach> --%>
									</table>
							<!-- 결제회원이 없을 때 -->
								</div>
							</c:when>

							<c:otherwise>
								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
									style="border-color: rgb(164 172 133/ 40%);">
							<!--  결제회원이 있을 때 -->
									<h5 class="title"></h5>

									<table class="table">
										<thead>
											<tr>
												<th></th>
												<th style="width: 100px">아이디</th>
												<th style="width: 100px">리워드</th>
												<th style="width: 180px">구매수량</th>
												<th style="width: 150px">결제금액</th>
												<th style="width: 200px">결제일시</th>
												<th style="width: 200px">운송장번호</th>
											</tr>
										</thead>

										<c:forEach var="ordList" items="${ordList  }"
											varStatus="status">
											<tbody>
												<tr>
													<td>${status.count }</td>
													<td>
														<div class="user-info">
															<!-- 																<div class="user-info__img"> -->
															<!-- 																	<img src="img/user1.jpg" alt="User Img"> -->
															<!-- 																</div> -->
															<div class="user-info__basic">
																<h5 class="mb-0">${ordList.mem_id }</h5>
															</div>
														</div>
													</td>
													<td>${ordList.reward_no }</td>
													<td>${ordList.order_count }개</td>
													<td>${ordList.total_price }원</td>
													<td><fmt:formatDate value="${ordList.order_date }"
															pattern="yyyy-MM-dd" /></td>
													<td>${ordList.shipping_no }</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!--  결제회원이 있을 때 -->
					<!-- 결제회원 리스트 -->


				</div>
				<!-- 프로젝트정보 (프로필) -->
			</div>
		</div>



	</div>

	<br> <br> <br> <br>



	<div align="center">
		<button type="submit"
			onclick="location.href='javascript:window.history.back();'"
			class="main-btn" style="float: center;">목록</button>
		<!-- 			</form> -->

	</div>
</section>


















<!--  ====== PROJECT CONTENT PART ENDS ====== -->

<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>


<!-- 드롭다운 -->
<script>
	/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active1");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
</script>
<!-- 드롭다운 -->