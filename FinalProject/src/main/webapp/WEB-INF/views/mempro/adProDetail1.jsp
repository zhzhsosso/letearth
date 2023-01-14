<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


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
	position: sticky;
	top: 40%;
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

/*스크롤바*/
#contentArea::-webkit-scrollbar {
	width: 10px;
	overflow-y: scroll;
}

#contentArea::-webkit-scrollbar-thumb {
	background-color: #B6AD90;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

#contentArea::-webkit-scrollbar-track {
	background-color: none;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
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
				<a href="/notice/main">공지사항</a> <a href="/board/adFaqList">FAQ</a> <a
					href="/board/adRewriteList">1:1문의</a>
			</div>

			<button class="dropdown-btn">
				<i class="fa fa-solid fa-bank"></i> &nbsp;펀딩관리 <i
					class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="/mempro/adProList1">프로젝트 승인</a> <a
					href="/mempro/adProList2">프로젝트 목록</a> <a
					href="/openbanking/useroauth">정산관리</a>
			</div>

			<button class="dropdown-btn">
				<i class="fa fa-solid fa-users"></i> &nbsp;회원관리 <i
					class="fa fa-caret-down"></i>
			</button>
			<div class="dropdown-container">
				<a href="/report/adRepListAll">신고접수관리</a> <a
					href="/mempro/adMemList">회원목록</a> <a href="/report/adBlackList">블랙리스트</a>
			</div>
		</div>
		<!-- 사이드바 -->







		<div class="container">

			<!-- 			<div class="row justify-content-center" style="width: 1200"> -->
			<div class="container" style="width: 2000">
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
							<div class="flex-container" style="width: 1200">
								<div class="project-details-item" style="width: 1000">
									<br> <br> <br>
									<div>
										<p style="font-size: 30px; color: #6c757d;" align="left">판매자
											정보</p>
										<br>
										<h5 class="title"></h5>



										<div
											class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
											style="border-color: rgb(164 172 133/ 40%); width: 540px; height: 700px;">
											<div class="banner"></div>
											<c:choose>
												<c:when test="${not empty proVO.memberVO.mem_profile }">
													<img
														src="../resources/upload/${proVO.memberVO.mem_profile}"
														alt="" class="img-circle mx-auto mb-3">
												</c:when>
												<c:otherwise>
													<img src="/resources/assets/images/userimg.png" alt=""
														class="img-circle mx-auto mb-3">
												</c:otherwise>
											</c:choose>
											<h3 class="mb-4">${proVO.mem_id }</h3>



											<table class="table table-condensed">
												<tbody>
													<tr>
														<th style="font-weight: bold;">연락처</th>
														<td
															style="text-align: center; color: #414934; font-weight: bold;">${proVO.memberVO.mem_phone }</td>
													</tr>
													<tr>
														<th style="font-weight: bold;">이메일</th>
														<td
															style="text-align: center; color: #414934; font-weight: bold;">${proVO.memberVO.mem_email }</td>
													</tr>
													<tr>
														<th style="font-weight: bold;">가입날짜</th>
														<td
															style="text-align: center; color: #414934; font-weight: bold;"><fmt:formatDate
																value="${proVO.memberVO.mem_cr_dt }" pattern="yy-MM-dd" /></td>
													</tr>
													<tr>
														<th style="font-weight: bold;">펀딩횟수</th>
														<td
															style="text-align: center; color: #414934; font-weight: bold;">${memPro }회</td>
													</tr>
													<tr>
														<th style="font-weight: bold;">구매횟수</th>
														<td
															style="text-align: center; color: #414934; font-weight: bold;">${memOrd }회</td>
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
										<p style="font-size: 30px; color: #6c757d;" align="left">프로젝트
											정보</p>
										<br>
										<h5 class="title"></h5>
										<div
											class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden"
											style="border-color: rgb(164 172 133/ 40%); width: 540px; height: 700px;">
											<table class="table table-condensed">
												<div class="banner">
													<img src="../resources/upload/${pro_thum}" alt=""
														class="img-rectangle"> <br> <br>
													<h4 class="mb-4">
														<br>${proVO.pro_title }</h4>
													<tbody>
														<!-- 												<tr> -->
														<!-- 													<th style="width: 150px">제목</th> -->
														<%-- 													<td>${proVO.pro_title }</td> --%>
														<!-- 												</tr> -->
														<tr>
															<th style="font-weight: bold;">시작일</th>
															<fmt:parseDate value="${proVO.pro_st_dt }" var="str_Date"
																pattern="yy-MM-dd" />
															<td
																style="text-align: center; color: #414934; font-weight: bold;"><fmt:formatDate value="${str_Date}" pattern="yy-MM-dd"/></td>
														</tr>
														<tr>
															<th style="font-weight: bold;">종료일</th>
															<fmt:parseDate value="${proVO.pro_ed_dt }" var="end_Date"
																pattern="yy-MM-dd" />
															<td
																style="text-align: center; color: #414934; font-weight: bold;"><fmt:formatDate value="${end_Date}" pattern="yy-MM-dd"/></td>
														</tr>
														</tr>
														<tr>
															<th style="font-weight: bold;">기간</th>
															<fmt:parseDate value="${proVO.pro_st_dt }" var="str_Date"
																pattern="yy-MM-dd" />
															<fmt:parseNumber
																value="${str_Date.time / (1000*	60*60*24)}"
																integerOnly="true" var="strDate"></fmt:parseNumber>
															<fmt:parseDate value="${proVO.pro_ed_dt }" var="end_Date"
																pattern="yy-MM-dd" />
															<fmt:parseNumber
																value="${end_Date.time / (1000*60*60*24)}"
																integerOnly="true" var="endDate"></fmt:parseNumber>
															<td
																style="text-align: center; color: #414934; font-weight: bold;">${endDate - strDate }일</td>
														</tr>
														<tr>
															<th style="font-weight: bold;">목표금액</th>
															<td
																style="text-align: center; color: #414934; font-weight: bold;"><fmt:formatNumber
																	value="${proVO.pro_gp }" />원</td>
														</tr>
														<!-- 														<tr> -->
														<!-- 															<th>상태</th> -->
														<%-- 															<td>${ proVO.pro_status }</td> --%>
														<!-- 														</tr> -->


													</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- 							div class="flex-container" -->



							<br> <br> <br>


							<!-- 미리보기 버튼 -->
							<div>
								<button type="button" class="main-btn"
									onclick="proPreviewBtn(${proVO.pro_no});"
									style="font-size: 30px; width: 1190px" align="left">프로젝트
									미리보기</button>
							</div>

						</div>

						<!-- 프로젝트 미리보기 -->
						<div id="result" class="container"
							style="width: 2000px; overflow-y: scroll; height: 800px;">
						</div>

						<br> <br> <br>



					</div>
				</div>
			</div>

			<!-- 프로젝트정보 (프로필) -->

		</div>

	</div>
	</div>

	<div align="center">


		<c:choose>
			<c:when test="${proVO.pro_status == 2}">
				<button type="submit"
					onclick="location.href='javascript:window.history.back();'"
					class="main-btn" style="float: center; background-color: #A4AC85">뒤로</button>
				<button type="button" onclick="updatePro3(${proVO.pro_no});"
					class="main-btn" style="float: center; background-color: #A4AC85">승인</button>
				<button type="button" onclick="updatePro4(${proVO.pro_no});"
					class="main-btn" style="float: center; background-color: #A4AC85;">반려</button>
			</c:when>
			<c:otherwise>
				<button type="submit"
					onclick="location.href='javascript:window.history.back();'"
					class="main-btn" style="float: center; background-color: #A4AC85">뒤로</button>
			</c:otherwise>
		</c:choose>


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

<script type="text/javascript">
		var result = '${result}';
		if(result == '승인완료'){
			alert("프로젝트 승인 완료!");
		}
		
		if(result == '반려완료'){
			alert("프로젝트 반료처리 완료!");
		}
		
</script>


<!-- 스크롤안에 jsp 불러오기 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
function proPreviewBtn(num){
	$.ajax({
		type: "GET",
		url : "/prodetail/infoPreview?pro_no="+num,
		dateType : "html",
		success:function(result){
			$("#result").html(result);
		}	
	});
	
}



function updatePro3(num){
		 Swal.fire({ 
	        title: '프로젝트를 승인하시겠습니까?', 
	        icon: 'warning', 
	        html: "<h5>프로젝트 승인리스트로 이동합니다.</h5>",
	        showCancelButton: true,         
	        confirmButtonColor: '#3085d6', 
	        cancelButtonColor: 'grey', 
	        confirmButtonText: '승인하기', 
	        cancelButtonText: '취소하기' 
	      }).then((result) => { 
	        if (result.isConfirmed) {           
	             
	       	 location.href="/mempro/adProStatus3?pro_no="+num;
	        } 
	      }) 
}


function updatePro4(num){
		 Swal.fire({ 
	        title: '프로젝트를 반려하시겠습니까?', 
	        icon: 'warning', 
	        html: "<h5>프로젝트 승인리스트로 이동합니다.</h5>",
	        showCancelButton: true,         
	        confirmButtonColor: '#3085d6', 
	        cancelButtonColor: 'grey', 
	        confirmButtonText: '반려하기', 
	        cancelButtonText: '취소하기' 
	      }).then((result) => { 
	        if (result.isConfirmed) {           
	             
	       	 location.href="/mempro/adProStatus4?pro_no="+num;
	        } 
	      }) 
}
</script>
<!-- 스크롤안에 jsp 불러오기 -->