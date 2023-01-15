<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

.btnbtn .blog-btn .main-btn {
	background-color :#A4AC85;
}
</style>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
 jQuery(document).ready(function(){ 
 	jQuery('#btn-submit').click(function(e){ 
 		 e.preventDefault(); 
 		 let form = jQuery(this).parents('form'); 
 		 Swal.fire({ 
 				title: '이체하시겠습니까?', 
 				text: '다시 한 번 확인해주세요!',
 				icon: 'info',
 				showCancelButton: true, 
 				confirmButtonColor: '#3085d6', 
 				cancelButtonColor: 'grey', 
 				confirmButtonText: '이체하기',
 				cancelButtonText: '취소' 
 		}).then((result) => { 
             if (result.isConfirmed) { 
                 form.submit(); 
             } 
         }) 
 	}); 
 }); 

 </script>

<section class="project-details-content-area pb-110">
	<div style="display: flex;">
	
	
	<!-- 사이드바 -->
	<%@ include file="../include/adSide.jsp"%>
	
	
	
		<div class="container">
			
<br><br><br><br><br><br>
<!-- 			<div class="container" style="width: 1000"> -->
				<!-- 본문시작 -->
				<div class="col-lg-8">
					<div class="tab-content" id="pills-tabContent">
						<div class id="pills-home" role="tabpanel"
							aria-labelledby="pills-home-tab">
							<div class="project-details-content-top">
								<div class="col-lg-4 col-md-7 col-sm-9"></div>
							</div>

							<!-- 회원정보 (프로필) -->
							<div class="flex-container" style="width: 1000">


								<br> <br>

								<div class="project-details-item" style="width: 1000">
									<br> <br> <br>
									<div>
										<p style="font-size: 2.2rem;" align="left">정산 상세</p>
										<br>
										<h5 class="title"></h5>
										<div
											class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
											<table class="table table-condensed">
												<!-- 사진을 넣을지 그냥 타이틀만 넣을지 정하기 -->
												<div class="banner">
													
													<h6></h6>
													<h3 class="mb-4">${pjvo.pro_title }</h3>
													<tbody>
	
														<tr>
															<th>창작자 이름</th>
															<td>${pjvo.mem_name }</td>
														</tr>
														<tr>
															<th>거래은행</th>
															<td>${sellfin.bank_name }</td>
														</tr>
														<tr>
															<th>계좌번호</th>
															<td>${sellfin.bank_acc }</td>
														</tr>
														<tr>
															<th>예금주명</th>
															<td>${sellfin.bank_acc_name }</td>
														</tr>
														<tr>
															<th>모금액</th>
															<td><fmt:formatNumber value="${pjvo.pro_tp }" />원</td>
														</tr>
														<tr>
															<th>수수료</th>
															<td><fmt:formatNumber value="${pjvo.pro_tp * (3/100) }" />원</td>
														</tr>
														<tr>
															<th>총 정산금액</th>
															<td><fmt:formatNumber value="${pjvo.pro_tp * (1-(3/100))}" />원</td>
														</tr>

													</tbody>
													
												</div>
												
											</table>
											<!-- 입금이체 : 관리자가 판매자 계좌로 입금 -->
														<form method="post" action="/openbanking/deposit" id="form">
															<!-- 이용기관 토큰값 고정 -->
															<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJNMjAyMjAyMzQzIiwic2NvcGUiOlsib29iIl0sImlzcyI6Imh0dHBzOi8vd3d3Lm9wZW5iYW5raW5nLm9yLmtyIiwiZXhwIjoxNjgxNTQ1ODE5LCJqdGkiOiJjNzhmMTk1Yy1jZWJmLTRlNDQtOWFhMS04ZWJiNmE2YmNiZWQifQ.oEAi761wKaHMqNd_xLEtAVIsQxSVtmSGQaHWi-JwDyk">
															<input type="hidden" name="cntr_account_type" value="N">
															<input type="hidden" name="cntr_account_num" value="${adfin.bank_acc }">
															<input type="hidden" name="wd_pass_phrase" value="NONE"> <!-- 테스트환경은 NONE을 사용 -->
															<input type="hidden" name="wd_print_content" value="정산해요">
															<input type="hidden" name="name_check_option" value="off">
															<input type="hidden" name="tran_dtime" value="20230115101921">
															<input type="hidden" name="req_cnt" value="1">
															
															<input type="hidden" name="tran_no" value="1">
															<input type="hidden" name="fintech_use_num" value="${sellfin.bank_fin_num }">
															<input type="hidden" name="print_content" value="정산해요">
															<input type="hidden" name="tran_amt" value="${totalamt }"> <!-- 금액 -->
															
															<input type="hidden" name="req_client_name" value="정지현"> 
															
															<input type="hidden" name="req_client_fintech_use_num" value="${sellfin.bank_fin_num }">
<%-- 															<input type="hidden" name="req_client_bank_code" value="${sellfin.bank_code }"> <!-- 은행 코드 --> --%>
<!-- 															<input type="hidden" name="req_client_account_num" value="4848484848484848"> -->
															
															<input type="hidden" name="req_client_num" value="HONGGILDONG1234">
															<input type="hidden" name="transfer_purpose" value="AU">
															
															<input type="hidden" name="pro_no" value="${pjvo.pro_no }">
															
															<div class="btnbtn">
														         <div class="blog-btn">
																	<input type="button" class="main-btn" value="정산하기" id="btn-submit">
														         </div>
													        </div>
														</form>
										</div>
									</div>
								</div>
							</div>




						</div>
					</div>
				</div>
			</div>
			<!-- 모달영역 끝 -->

			<br> <br> <br>

		</div>
<!-- 	</div> -->

</section>



	





<!--  ====== PROJECT CONTENT PART ENDS ====== -->

<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>



</body>
</html>