<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<!-- <link -->
<%-- 	href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" --%>
<!-- 	rel="stylesheet" type="text/css" /> -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>프로젝트 승인</title>
<style type="text/css">
#listBtn {
	position: absolute;
	right: 17px;
	top: 40px;
	font-size: 15px;
}

#sbtn { /*검색버튼*/
	position: absolute;
	top: 0px;
	background-color: #A4AC85;
	height: 35px;
}

#repSelector {
	width: 10%;
	height: 3px;
	background-color: #D7D1B9;
	border: 0;
	position: relative;
	top: -95px;
	/*    left: 380px;  */
	left: 45%;
}

/* hr { */
/* 	width: 70px; */
/* 	height: 30px; */
/* 	background-color: #9dd84b; */
/* 	border: 0; */
/* } */

/*hover*/
#hov a:hover {
	color: green;
	transition: 0s;
	font-weight: bolder;
	/*text-decoration: underline;*/
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

/*페이징*/
.paging {
	display: inline-block;
}

.paging a {
	display: block;
	text-decoration: none;
	color: #414934;
	float: left;
	line-height: 1.5;
	border-radius: 50%;
	padding: 8px 16px;
}

.paging a:hover {
	background-color: #B6AD90;
	color: #E8E4D7;
}

.paging a.active {
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
}

.pagination a:active {
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>



	<section class="contact-form-area">
		<div style="display: flex;">

			<!-- 사이드바 -->
			<%@ include file="../include/adSide.jsp"%>

			<div class="container">
				<br> <br> <br> <br> <br> <br>
				<!-- 어드민 -->
				<h2 class="box-title" align="center">
					<b style="color: #6c757d;">프로젝트 승인</b> <br> <br> <br>
				</h2>
				<hr id="repSelector" align="center">
				<div class="col-xs-12">
					<div style="font-size: 1.7rem" align="left" class="proList1">
						<span id="hov"> <a id="listAll"
							style="color: #6F7B63; font-weight: bolder;">전체</a> | <a
							id="list2" style="color: #B6AD90">승인요청</a> | <a id="list3"
							style="color: #B6AD90">승인</a> | <a id="list4"
							style="color: #B6AD90">반려</a>
						</span>
						<hr
							style="border-color: rgba(164, 172, 133, .5); position: relative; top: -10px; width: 100%;">
					</div>
					<br>
					<!-- 어드민 -->

					<!-- 검색기능 -->

					<div class="box" style="border-top: none;">
						<div class="box-header">
							<div class="box-tools" align="right">
								<div class="input-group input-group-sm hidden-xs"
									style="width: 380px; height: 35px;" id="search">
									<select name="searchType">
										<option value="n"
											<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
										<option value="t"
											<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
										<option value="m"
											<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>작성자</option>
										<option value="tm"
											<c:out value="${scri.searchType eq 'tm' ? 'selected' : ''}"/>>제목+작성자</option>
									</select> <input type="text" name="keyword" id="keywordInput"
										value="${scri.keyword}" class="form-control pull-right"
										placeholder="검색어를 입력해주세요"
										style="height: 38px; width: 150px; font-size: 1rem;">
									<div class="input-group-btn" style="padding-left: 3px;">
										<button id="searchBtn" type="submit" class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 검색기능 -->
						<br> <br>

						<!-- proAll -->
						<div class="box-body table-responsive no-padding" id="proAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed;">프로젝트
												번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed;">프로젝트
												이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>

										<c:forEach var="proVO" items="${proList }">
											<tr>
												<td style="font-size: 15px; text-align: center;">${proVO.pro_no }</td>
												<td style="font-size: 15px;"><a
													<%-- 													href="/mempro/adProDetail1?pro_no=${proVO.pro_no }" --%>
													href="/mempro/adProDetail1?pro_no=${proVO.pro_no }&mem_id=${proVO.mem_id}"
													style="color: green"> ${proVO.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO.mem_id }</td>
												<td style="font-size: 15px;">${proVO.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO.pro_gp }" />원</td>
												<c:choose>
													<c:when test="${proVO.pro_status == 2}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #89A378; border-color: #89A378;">승인요청</button>
														</td>
													</c:when>
													<c:when test="${proVO.pro_status == 3}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">승인</button>
														</td>
													</c:when>
													<c:when test="${proVO.pro_status == 4}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">반려</button>
														</td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
						<!-- proAll -->
						<!-- pro2 -->

						<div class="box-body table-responsive no-padding" id="pro2">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed;">프로젝트
												번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed;">프로젝트
												이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO2" items="${proList }">
											<c:if test="${proVO2.pro_status == 2}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO2.pro_no }</td>
													<td style="font-size: 15px;"><a
														<%-- 														href="/mempro/adProDetail1?pro_no=${proVO2.pro_no }" --%>
														href="/mempro/adProDetail1?pro_no=${proVO2.pro_no }&mem_id=${proVO2.mem_id}"
														style="color: green"> ${proVO2.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO2.mem_id }</td>
													<td style="font-size: 15px;">${proVO2.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO2.pro_gp }" />원</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #89A378; border-color: #89A378;">승인요청</button>
													</td>

												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
						<!-- pro2 -->

						<!-- pro3 -->
						<div class="box-body table-responsive no-padding" id="pro3">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed;">프로젝트
												번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed;">프로젝트
												이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO3" items="${proList }">
											<c:if test="${proVO3.pro_status == 3}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO3.pro_no }</td>
													<td style="font-size: 15px;"><a
														<%-- 														href="/mempro/adProDetail1?pro_no=${proVO3.pro_no }" --%>
														href="/mempro/adProDetail1?pro_no=${proVO3.pro_no }&mem_id=${proVO3.mem_id}"
														style="color: green"> ${proVO3.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO3.mem_id }</td>
													<td style="font-size: 15px;">${proVO3.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO3.pro_gp }" />원</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">승인</button>
													</td>

												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
						<!-- pro3 -->
						<!-- pro4 -->
						<div class="box-body table-responsive no-padding" id="pro4">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed;">프로젝트
												번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed;">프로젝트
												이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO4" items="${proList }">
											<c:if test="${proVO4.pro_status == 4}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO4.pro_no }</td>
													<td style="font-size: 15px;"><a
														<%-- 														href="/mempro/adProDetail1?pro_no=${proVO4.pro_no }" --%>
														href="/mempro/adProDetail1?pro_no=${proVO4.pro_no }&mem_id=${proVO4.mem_id}"
														style="color: green"> ${proVO4.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO4.mem_id }</td>
													<td style="font-size: 15px;">${proVO4.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO4.pro_gp }" />원</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">반려</button>
													</td>

												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</form>
						</div>
						<!-- pro4 -->

					</div>
				</div>
				<br>
				<br>
				<!-- 페이징처리 -->
				<div class="pagination"
					style="position: absolute; right: 45%; border: none;">
					<ul class="pagination" style="font-size: 18px;">
						<c:if test="${pvo.prev }">
							<li class="paging"><a
								href="adProList1${pvo.makeSearch(pvo.starPage-1) }">«</a></li>
							<!-- 10 -->
						</c:if>

						<c:forEach var="idx" begin="${pvo.startPage }"
							end="${pvo.endPage }" step="1">
							<li class="paging"
								<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
								href="adProList1${pvo.makeSearch(idx) }">${idx }</a></li>
						</c:forEach>

						<c:if test="${pvo.next }">
							<li class="paging"><a
								href="adProList1${pvo.makeSearch(pvo.endPage+1) }">»</a></li>
							<!-- 11 -->
						</c:if>
					</ul>
				</div>
				<!-- 페이징처리 -->
			</div>
			<br>
			<br>
			<br>
			<br>
			<br>
	</section>




	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
<!-- jQuery-->

<!-- div숨기기 나타내기 -->
<script type="text/javascript" src="jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	$("#proAll").ready(function() {

		$("#proAll").show();
		$("#pro2").hide();
		$("#pro3").hide();
		$("#pro4").hide();

		$("#listAll").css("color", "#6F7B63");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").hover(function() {
			$("#proAll").show();
			$("#pro2").hide();
			$("#pro3").hide();
			$("#pro4").hide();

			$("#listAll").css("color", "#6F7B63");
			$("#listAll").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");

		});

		$("#list2").hover(function() { // 승인요청
			$("#proAll").hide();
			$("#pro2").show();
			$("#pro3").hide();
			$("#pro4").hide();

			$("#list2").css("color", "#6F7B63");
			$("#list2").css("font-weight", "bolder");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");
		});

		$("#list3").hover(function() { // 승인
			$("#proAll").hide();
			$("#pro2").hide();
			$("#pro3").show();
			$("#pro4").hide();

			$("#list3").css("color", "#6F7B63");
			$("#list3").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");
		});

		$("#list4").hover(function() { // 반려
			$("#proAll").hide();
			$("#pro2").hide();
			$("#pro3").hide();
			$("#pro4").show();

			$("#list4").css("color", "#6F7B63");
			$("#list4").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
		});

		$("#listAll").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list2").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list3").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list4").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

	});
</script>

<!-- 검색기능 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "adProList1" + '${pvo.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<!-- 검색기능 -->


</html>


