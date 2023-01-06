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

.img-rectangle{
  width:400px;
  height:180px;
  border: 3px solid #fff;
  box-shadow: 2px 2px 2px rgba(0, 0, 0, 0.1);
  object-fit:cover;
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
	top: 120px;
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
					<h3 class="title"
						style="color: black; font-size: 3em; margin-left: 400px;">${proVO.pro_title }</h3>
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
   <a href="/board/adMain">
   <i class="fa fa-solid fa-leaf"></i>
   <span style="position: relative; left: 2px; bottom: 3px; font-weight: bolder;">관리자메인</span>
   </a>
   <button class="dropdown-btn">
   <i class="fa fa-solid fa-paper-plane"></i>
      &nbsp;고객센터 <i class="fa fa-caret-down"></i>
   </button>
   <div class="dropdown-container">
      <a href="/board/adNoticeList">공지사항</a> 
      <a href="/board/adFaqList">FAQ</a> 
      <a href="/board/adRewriteList">1:1문의</a>
   </div>
   
   <button class="dropdown-btn">
   <i class="fa fa-solid fa-bank"></i>
      &nbsp;펀딩관리 <i class="fa fa-caret-down"></i>
   </button>
   <div class="dropdown-container">
      <a href="#">프로젝트 승인</a> 
      <a href="#">프로젝트 목록</a> 
      <a href="#">재펀딩</a>
      <a href="#">정산관리</a>
   </div>
   
   <button class="dropdown-btn">
   <i class="fa fa-solid fa-users"></i>
      &nbsp;회원관리 <i class="fa fa-caret-down"></i>
   </button>
   <div class="dropdown-container">
      <a href="/report/adRepList">신고접수관리</a> 
      <a href="#">회원목록</a> 
      <a href="/report/adBlackList">블랙리스트</a>
   </div>
</div>
<!-- 사이드바 -->
		
		
		
		
		


		<div class="container">

			<!-- 			<div class="row justify-content-center" style="width: 1200"> -->
			<div class="container" style="width: 1400">
				<!-- 본문시작 -->
				<div class="col-lg-8">
					<!-- 					<form action="/mempro/adProList1" method="get"> -->
					<div class="tab-content" id="pills-tabContent">
						<div class id="pills-home" role="tabpanel"
							aria-labelledby="pills-home-tab">
							<div class="project-details-content-top">
								<div class="col-lg-4 col-md-7 col-sm-9"></div>
							</div>

							<!-- div class="flex-container" -->
							<!-- 회원정보 (프로필) -->
							<div class="flex-container" style="width: 1000">
								<div class="project-details-item" style="width: 1000">
									<br> <br> <br>
									<div>
										<p style="font-size: 2.2rem;" align="left">판매자 정보</p>
										<br>
										<h5 class="title"></h5>



										<div
											class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
											<div class="banner"></div>
											<img src="/resources/assets/images/messi.jpg" alt=""
												class="img-circle mx-auto mb-3">
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
																value="${proVO.memberVO.mem_cr_dt }"
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
								<br> <br> <br>
								<div>
									<p style="font-size: 2.2rem;" align="left">프로젝트 정보</p>
									<br>
									<h5 class="title"></h5>
									<div
										class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
										<table class="table table-condensed">
<!-- 사진을 넣을지 그냥 타이틀만 넣을지 정하기 -->
											<div class="banner">
											<img src="/resources/assets/images/messi.jpg" alt=""
												class="img-rectangle">
												<h6>　</h6>
												<h3 class="mb-4">${proVO.pro_title }</h3>
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

											</tbody>
											</div>
										</table>
									</div>
								</div>
								</div>
							</div>
							<!-- div class="flex-container" -->

						</div>
					</div>
				</div>

				<!-- 프로젝트정보 (프로필) -->


				<button type="button" class="btn btn-primary btn-lg"
					data-toggle="modal" data-target="#proDetail">모달창 : 해당 프로젝트
					상세보기 가져오기</button>


				<!--  모달에 외부 jsp 가져오기 도전 !! 아직 미완성 .. -->
				<!--  ajax / 버튼 클릭시 ajax 서버타고 결과값 html로 만듬
							modal창 div에 append(html) 하기 / 종료될때 하위 div삭제 후 초기화 -->

				<!-- 							<br> <a data-toggle="modal" -->
				<%-- 								href="/prodetail/info?pro_no=${proVO.pro_no }" --%>
				<!-- 								data-target="#modal-testNew" role="button" -->
				<!-- 								data-backdrop="static"> <span class="btn btn-xs btn-success">테스트 -->
				<!-- 									등록</span> -->
				<!-- 							</a> -->



				<!-- 모달 영역 시작 -->
				<div class="modal fade" id="proDetail" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog modal-lg modal-dialog-scrollable"
						role="document" style="width: 1200px; height: 700px">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">모달창 : 해당 프로젝트
									상세보기 가져오기</h4>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
						</div>
						<div class="modal-body"></div>

					</div>
				</div>
			</div>
			<!-- 모달영역 끝 -->

			<br> <br> <br>

		</div>
	</div>

	<div align="center">
	<button type="submit"
		onclick="location.href='javascript:window.history.back();'"
		class="main-btn" style="float: center;">목록</button>
	<button type="submit" onclick="/mempro/adProList1" class="main-btn"
		style="float: center;">목록</button>
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