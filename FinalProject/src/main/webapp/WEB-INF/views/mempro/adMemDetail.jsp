<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>





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
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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

/* Fixed sidenav, full height */
.sidenav {
	height: 100%;
	width: 200px;
	position: fixed;
	z-index: 1;
	/*    top: 30%;  */
	/*    left: 20%;  */
	background-color: #EEF6E6;
	overflow-x: hidden;
	padding-top: 30px;
	padding-bottom: 100px;
	position: relative;
	top: 170px;
	left: 250px;
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 17px;
	color: #818181;
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
	color: #ACCC97;
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
.active {
	background-color: #D8E9C5;
	color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
	display: none;
	background-color: #EEF5E6;
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
					<!-- 					<h3 class="title" -->
					<%-- 						style="color: black; font-size: 3em; margin-left: 400px;">${proList.pro_title }</h3> --%>
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
					s
					<div class="project-details-content-top">
						<div class="col-lg-4 col-md-7 col-sm-9"></div>
					</div>

					<!-- div class="flex-container" -->
					<!-- 회원정보 (프로필) -->
					<div class="flex-container" style="width: 1000">
						<div class="project-details-item" style="width: 1000">
							<br> <br> <br> <br>
							<div>
								<p style="font-size: 2.2rem;" align="left">　</p>
								<br>
								<h5 class="title"></h5>



								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
									<div class="banner"></div>
									<!-- 											<img src="/resources/assets/images/messi.jpg" alt="" -->
									<!-- 												class="img-circle mx-auto mb-3"> -->
									<img src="/resources/assets/images/${memVO.mem_profile }"
										alt="" class="img-circle mx-auto mb-3">
									<h3 class="mb-4">${memVO.mem_id }</h3>



									<table class="table table-condensed">
										<tbody>
											<tr>
												<th style="width: 150px">이름</th>
												<td>${memVO.mem_name }</td>
											</tr>
											<tr>
												<th style="width: 150px">연락처</th>
												<td>${memVO.mem_phone }</td>
											</tr>
											<tr>
												<th>이메일</th>
												<td>${memVO.mem_email }</td>
											</tr>
											<tr>
												<th>가입날짜</th>
												<td><fmt:formatDate value="${memVO.mem_cr_dt }"
														pattern="yyyy-MM-dd" /></td>
											</tr>
											<tr>
												<th>펀딩횟수</th>
												<td>${memPro }회</td>
											</tr>
											<tr>
												<th>구매횟수</th>
												<td>${memOrd }회</td>
											</tr>
											<tr>
												<th>회원상태</th>
												<c:choose>
													<c:when test="${memVO.mem_status == 0}">
														<td>구매회원</td>
													</c:when>
													<c:when test="${memVO.mem_status == 1}">
														<td>판매회원</td>
													</c:when>
													<c:when test="${memVO.mem_status == 3}">
														<td>블랙리스트</td>
													</c:when>
												</c:choose>
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
						<!-- 여기에 무얼넣을까 -->
						<!-- detail1 : X 달성금액, 달성률, 배송상황, 정산현황 -->
						<!-- detail2 : O 달성금액, 달성률, 배송상황, 정산현황 -->
						<div class="project-details-item" style="width: 1000">
							<br> <br> <br> <br> <br>
							<div>
								<p style="font-size: 2.2rem;" align="left"></p>
								<br>
								<h5 class="title"></h5>
								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
									<table class="table table-condensed">
										<!-- 사진을 넣을지 그냥 타이틀만 넣을지 정하기 -->
										<div class="banner">
											<img src="/resources/assets/images/messi.jpg" alt=""
												class="img-rectangle">
											<h6></h6>
											<%-- 											<h3 class="mb-4">${proList.pro_title }</h3> --%>
											<tbody>
												<tr>
													<th>시작일</th>
													<td></td>
												</tr>
												<tr>
													<th>종료일</th>
													<td></td>
												</tr>
												<tr>
													<th>기간</th>
													<td></td>
												</tr>
												<tr>
													<th>목표금액</th>
													<td></td>
												</tr>
												<tr>
													<th></th>
													<td></td>
												</tr>

											</tbody>
										</div>
									</table>
								</div>
							</div>
						</div>
						<!-- 여기에 무얼넣을까.. -->
					</div>
					<!-- div class="flex-container" -->



					<!-- 구매 리스트  -->
					<br> <br> <br> <br>
					<div class="container" style="width: 145%">
						<p style="font-size: 2em;">구매 리스트</p>
						<br>
						<div
							class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
							<h5 class="title"></h5>

							<table class="table">
								<thead>
									<tr>
										<th>　</th>
										<th style="width: 200px">프로젝트이름</th>
										<th style="width: 150px">리워드번호</th>
										<th style="width: 200px">리워드이름</th>
										<th style="width: 150px">결제금액</th>
										<th style="width: 150px">결제일시</th>
										<th style="width: 100px">달성률</th>
										<th style="width: 150px">운송장번호</th>
									</tr>
								</thead>

								<c:forEach var="ordList" items="${ordList  }" varStatus="status">
									<tbody>
										<tr>
											<td>${status.count }</td>
											<td>${ordList.pro_title }</td>
											<td style="text-align:center">${ordList.reward_no }</td>
											<td>${ordList.reward_title }</td>
											<td><fmt:formatNumber value="${ordList.total_price }" />원</td>
											<td><fmt:formatDate value="${ordList.order_date }"
 													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatNumber
													value="${ordList.pro_tp / ordList.pro_gp }" type="percent" /></td> 
										<td>${ordList.shipping_no }</td>
										</tr>
									</tbody>
								</c:forEach>

							</table>
						</div>
					</div>
					<!-- 구매 리스트  -->
					<!-- 판매 리스트  -->
					<br> <br> <br> <br>
					<div class="container" style="width: 145%">
						<p style="font-size: 2em;">판매 리스트</p>
						<br>
						<div
							class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
							<h5 class="title"></h5>

							<table class="table">
								<thead>
									<tr>
										<th>　</th>
										<th style="width: 80px">분류</th>
										<th style="width: 200px">프로젝트번호</th>
										<th style="width: 200px">프로젝트이름</th>
										<th style="width: 180px">목표금액</th>
										<th style="width: 150px">달성금액</th>
										<th style="width: 100px">달성률</th>
										<th style="width: 200px">시작일</th>
										<th style="width: 200px">종료일</th>
										<th style="width: 100px">기간</th>
<!-- 										<th style="width: 100px">상태</th> -->
									</tr>
								</thead>

								<c:forEach var="proList" items="${proList  }" varStatus="status">
									<tbody>
										<tr>
											<td>${status.count }</td>
											<td>${proList.cat_name }</td>
											<td style="text-align:center">${proList.pro_no }</td>
											<td>${proList.pro_title }</td>
											<td><fmt:formatNumber value="${proList.pro_gp }" />원</td>
											<td><fmt:formatNumber value="${proList.pro_tp }" />원</td>
											<td><fmt:formatNumber
													value="${proList.pro_tp / proList.pro_gp }" type="percent" /></td>
											<td>${proList.pro_st_dt }</td>
											<td>${proList.pro_ed_dt }</td>
											<fmt:parseDate value="${proList.pro_st_dt }" var="str_Date"
												pattern="yyyy-MM-dd" />
											<fmt:parseNumber value="${str_Date.time / (1000*60*60*24)}"
												integerOnly="true" var="strDate"></fmt:parseNumber>
											<fmt:parseDate value="${proList.pro_ed_dt }" var="end_Date"
												pattern="yyyy-MM-dd" />
											<fmt:parseNumber value="${end_Date.time / (1000*60*60*24)}"
												integerOnly="true" var="endDate"></fmt:parseNumber>
											<td>${endDate - strDate }일</td>
<%-- 											<c:choose> --%>
<%-- 												<c:when test="${proList.pro_status == 2}"> --%>
<!-- 													<td>승인요청</td> -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${proList.pro_status == 3}"> --%>
<!-- 													<td>승인</td> -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${proList.pro_status == 4}"> --%>
<!-- 													<td>반려</td> -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${proList.pro_status == 5}"> --%>
<!-- 													<td>판매중</td> -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${proList.pro_status == 6}"> --%>
<!-- 													<td>마감</td> -->
<%-- 												</c:when> --%>
<%-- 												<c:when test="${proList.pro_status == 7}"> --%>
<!-- 													<td>판매중지</td> -->
<%-- 												</c:when> --%>
<%-- 											</c:choose> --%>
										</tr>
									</tbody>
								</c:forEach>

							</table>
						</div>
					</div>
					<!-- 판매 리스트  -->


				</div>
			</div>
		</div>
	</div>

	<br> <br> <br> <br>

	<div align="center">
		<button type="submit"
			onclick="location.href='javascript:window.history.back();'"
			class="main-btn" style="float: center;">목록</button>
		<button type="submit" class="main-btn" style="float: center;">목록</button>
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
			this.classList.toggle("active");
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