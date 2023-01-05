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
	height: 150px;
	width: 150px;
	border-radius: 150px;
	border: 3px solid #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	z-index: 1;
}
</style>




<br><br><br><br>


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
	<div class="container">
		<!-- 	<div class="container" style="margin-left: 70.600; margin-right: 70.600;"> -->

		<div class="row justify-content-center">

			<!-- 사이드바 -->
			<div class="col-lg-4 col-md-7 col-sm-9">
				<div class="project-details-sidebar">
					<!--회색박스 -->
					<div class="project-details-park mt-30 box item-2"
						style="padding: 2em">
						<div>
							<h1 class="title" style="padding: 1.5em;">관리자</h1>
						</div>

						<br>
						<div style="background-color: white;">
							<ul style="padding: 1.5em">
								<span style="font-size: 20px;">고객센터</span>
								<li><a href="">공지사항</a></li>
								<li><a href="">FAQ</a></li>
								<li><a href="">1:1 문의</a></li>
							</ul>
						</div>
						<br>
						<div style="background-color: white;">
							<ul style="padding: 1.5em">
								<span style="font-size: 20px;">펀딩관리</span>
								<li><a href="">프로젝트 승인</a></li>
								<li><a href="">프로젝트 목록 및 상세조회</a></li>
								<li><a href="">정산관리</a></li>
							</ul>
						</div>
						<br>
						<div style="background-color: white;">
							<ul style="padding: 1.5em">
								<span style="font-size: 20px;">회원관리</span>
								<li><a href="">회원목록 및 상세조회</a></li>
								<li><a href="">신고 조회 및 처리</a></li>
								<li><a href="">블랙리스트 조회</a></li>
							</ul>
						</div>
						<br>
					</div>
					<!-- 회색박스 -->
				</div>
			</div>
			<!-- 사이드바 -->



			<!-- Detail 1 과 동일 -->
			<div class="col-lg-8">
				<form action="/mempro/adProList2" method="get">
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade show active" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<div class="project-details-content-top">
								<div class="col-lg-4 col-md-7 col-sm-9"></div>
							</div>
							<div class="project-details-item">
								<br> <br> <br>
								<div>
									<!-- 1. 테이블 -->
									<p style="font-size: 2em;">판매자 정보</p>
									<br>
									<h5 class="title"></h5>



									<!-- 회원정보 (프로필) -->
									<div
										class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
										<div class="banner"></div>
										<img src="./messi.jpg" alt="" class="img-circle mx-auto mb-3">
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
												<td>${proVO.memberVO.mem_cr_dt }</td>
<%-- 					왜안되고 ㅈㄹ이냐고		<td><fmt:formatDate value="${proVO.memberVO.mem_cr_dt }" pattern="yyyy-MM-dd" /></td> --%>
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



								<br> <br>
								<!-- 프로젝트정보 (프로필) -->
								<!-- detail1 : X 달성금액, 달성률, 배송상황, 정산현황 -->
								<!-- detail2 : O 달성금액, 달성률, 배송상황, 정산현황 -->

								<p style="font-size: 2em;">프로젝트 정보</p>
								<h5 class="title"></h5>
								<div
									class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
									<table class="table table-condensed">
										<tbody>
											<tr>
												<th style="width: 150px">제목</th>
												<td>${proVO.pro_title }</td>
											</tr>
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
												<td>${proVO.pro_title }</td>
											</tr>
											<tr>
												<th>목표금액</th>
												<td>${proVO.pro_gp }원</td>
											</tr>
											<tr>
												<th>달성금액</th>
												<td>${proVO.pro_tp }원</td>
											</tr>
											<tr>
												<th>달성률</th>
												<td><fmt:formatNumber
														value="${proVO.pro_tp / proVO.pro_gp }" type="percent" />
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<br> <br>

								<!-- 결제회원 리스트 -->
								<div class="container">
									<p style="font-size: 2em;">결제 회원 리스트</p>
									<br>
									<div
										class="profile-card card rounded-lg shadow p-4 p-xl-5 mb-4 text-center position-relative overflow-hidden">
										<h5 class="title"></h5>

										<table class="table">
											<thead>
												<tr>
													<th style="width: 100px">아이디</th>
													<th style="width: 100px">리워드</th>
													<th style="width: 180px">구매수량</th>
													<th style="width: 150px">결제금액</th>
													<th style="width: 180px">결제일시</th>
													<th style="width: 200px">운송장번호</th>
												</tr>
											</thead>

											<c:forEach var="ordList" items="${ordList  }">
												<tbody>
													<tr>
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
														<td>${ordList.reward_no } </td>
														<td>${ordList.order_count } 개</td>
														<td>${ordList.total_price } 원</td>
<%-- 														<td>${ordList.order_date }</td> --%>
														<td><fmt:formatDate value="${ordList.order_date }" pattern="yyyy-MM-dd" /></td>
														<td>${ordList.shipping_no }</td>
<!-- 														<td> -->
<!-- 															<div class="dropdown open"> -->
<!-- 																<a href="#!" class="px-2" id="triggerId1" -->
<!-- 																	data-toggle="dropdown" aria-haspopup="true" -->
<!-- 																	aria-expanded="false"> <i class="fa fa-ellipsis-v"></i> -->
<!-- 																</a> -->
<!-- 																<div class="dropdown-menu" aria-labelledby="triggerId1"> -->
<!-- 																	<a class="dropdown-item" href="#"><i -->
<!-- 																		class="fa fa-pencil mr-1"></i> Edit</a> <a -->
<!-- 																		class="dropdown-item text-danger" href="#"><i -->
<!-- 																		class="fa fa-trash mr-1"></i> Delete</a> -->
<!-- 																</div> -->
<!-- 															</div> -->
<!-- 														</td> -->
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
							<br> <br> <br>
						</div>
					</div>
			</div>
			</form>

		</div>
	</div>
	<!-- Detail 1 과 동일 -->

</section>














<!-- 페이징처리 -->
<div>
	<ul>

		<c:if test="${pvo.prev }">
			<li><a href="/report/adBlackList?page=${pvo.startPage-1 }">«</a></li>
			<!-- 10 -->
		</c:if>

		<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }"
			step="1">
			<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
				href="/report/adBlackList?page=${idx }">${idx }</a></li>
		</c:forEach>

		<c:if test="${pvo.next }">
			<li><a href="/report/adBlackList?page=${pvo.endPage+1 }">»</a></li>
			<!-- 11 -->
		</c:if>
	</ul>
</div>





</div>
</div>
</div>

</section>


<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>