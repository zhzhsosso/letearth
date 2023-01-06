<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<link
	href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
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

#sbtn {
	position: absolute;
	top: -4px;
}

hr {
	width: 70px;
	height: 30px;
	background-color: #9dd84b;
	border: 0;
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
				<div class="col-xs-12">
					<div style="font-size: 2.2rem;" align="left">
						<a id="listAll">전체</a> | <a id="list2">승인요청</a> | <a id="list3">승인</a>
						| <a id="list4">반려</a>
					</div>
					<br>
					<!-- 어드민 -->

					<div class="box">
						<br>
						<div class="box-header">
							<br>
							<div class="box-tools" align="right">
								<div class="input-group input-group-sm hidden-xs"
									style="width: 150px;">
									<input type="text" name="table_search"
										class="form-control pull-right" placeholder="Search">
									<div class="input-group-btn">
										<button type="submit" class="btn btn-default" id="sbtn">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<br>
						<!-- proAll -->
						<div class="box-body table-responsive no-padding" id="proAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EEF5E6">
											<th style="font-size: 15px;">프로젝트 번호</th>
											<th style="font-size: 15px;">프로젝트 이름</th>
											<th style="font-size: 15px;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>

										<c:forEach var="proVO" items="${proList }">
											<tr>
												<td style="font-size: 15px;">${proVO.pro_no }</td>
												<td style="font-size: 15px;"><a
													href="/mempro/adProDetail1?pro_no=${proVO.pro_no }"
													style="color: green"> ${proVO.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO.mem_id }</td>
												<td style="font-size: 15px;">${proVO.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO.pro_gp }" />원</td>
												<c:choose>
													<c:when test="${proVO.pro_status == 2}">
														<td style="font-size: 15px;"><span
															class="label label-info">승인요청</span></td>
													</c:when>
													<c:when test="${proVO.pro_status == 3}">
														<td style="font-size: 15px;"><span
															class="label label-success">승인</span></td>
													</c:when>
													<c:when test="${proVO.pro_status == 4}">
														<td style="font-size: 15px;"><span
															class="label label-warning">반려</span></td>
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
										<tr style="background-color: #f8f9fa">
											<th style="font-size: 15px;">프로젝트 번호</th>
											<th style="font-size: 15px;">프로젝트 이름</th>
											<th style="font-size: 15px;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO2" items="${proList }">
											<c:if test="${proVO2.pro_status == 2}">
												<tr>
													<td style="font-size: 15px;">${proVO2.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail1?pro_no=${proVO2.pro_no }"
														style="color: green"> ${proVO2.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO2.mem_id }</td>
													<td style="font-size: 15px;">${proVO2.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO2.pro_gp }" />원</td>
													<td style="font-size: 15px;"><span
														class="label label-info">승인요청</span></td>

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
										<tr style="background-color: #f8f9fa">
											<th style="font-size: 15px;">프로젝트 번호</th>
											<th style="font-size: 15px;">프로젝트 이름</th>
											<th style="font-size: 15px;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO3" items="${proList }">
											<c:if test="${proVO3.pro_status == 3}">
												<tr>
													<td style="font-size: 15px;">${proVO3.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail1?pro_no=${proVO3.pro_no }"
														style="color: green"> ${proVO3.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO3.mem_id }</td>
													<td style="font-size: 15px;">${proVO3.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO3.pro_gp }" />원</td>
													<td style="font-size: 15px;"><span
														class="label label-success">승인</span></td>

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
										<tr style="background-color: #f8f9fa">
											<th style="font-size: 15px;">프로젝트 번호</th>
											<th style="font-size: 15px;">프로젝트 이름</th>
											<th style="font-size: 15px;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">승인상태</th>
										</tr>
										<c:forEach var="proVO4" items="${proList }">
											<c:if test="${proVO4.pro_status == 4}">
												<tr>
													<td style="font-size: 15px;">${proVO4.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail1?pro_no=${proVO4.pro_no }"
														style="color: green"> ${proVO4.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO4.mem_id }</td>
													<td style="font-size: 15px;">${proVO4.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO4.pro_gp }" />원</td>
													<td style="font-size: 15px;"><span
														class="label label-warning">반려</span></td>

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

				<!-- 페이징처리 -->
				<div class="box-footer clearfix" id="paging">
					<ul class="pagination pagination-sm no-margin pull-left">
						<c:if test="${pvo.prev }">
							<li><a href="/report/adBlackList?page=${pvo.startPage-1 }">«</a></li>
							<!-- 10 -->
						</c:if>

						<c:forEach var="idx" begin="${pvo.startPage }"
							end="${pvo.endPage }" step="1">
							<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
								href="/report/adBlackList?page=${idx }">${idx }</a></li>
						</c:forEach>

						<c:if test="${pvo.next }">
							<li><a href="/report/adBlackList?page=${pvo.endPage+1 }">»</a></li>
							<!-- 11 -->
						</c:if>
					</ul>
				</div>
				<!-- 페이징처리 -->
			</div>
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

		$("#listAll").css("color", "green");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").click(function() {
			$("#proAll").show();
			$("#pro2").hide();
			$("#pro3").hide();
			$("#pro4").hide();

			$("#listAll").css("color", "green");
			$("#listAll").css("font-weight", "bolder");
			$("#list2").css("color", "grey");
			$("#list2").css("font-weight", "normal");
			$("#list3").css("color", "grey");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");

		});

		$("#list2").click(function() { // 승인요청
			$("#proAll").hide();
			$("#pro2").show();
			$("#pro3").hide();
			$("#pro4").hide();

			$("#list2").css("color", "green");
			$("#list2").css("font-weight", "bolder");
			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "grey");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");
		});

		$("#list3").click(function() { // 승인
			$("#proAll").hide();
			$("#pro2").hide();
			$("#pro3").show();
			$("#pro4").hide();

			$("#list3").css("color", "green");
			$("#list3").css("font-weight", "bolder");
			$("#list2").css("color", "grey");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");
		});

		$("#list4").click(function() { // 반려
			$("#proAll").hide();
			$("#pro2").hide();
			$("#pro3").hide();
			$("#pro4").show();

			$("#list4").css("color", "green");
			$("#list4").css("font-weight", "bolder");
			$("#list2").css("color", "grey");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "grey");
			$("#list3").css("font-weight", "normal");
		});
	});
</script>

</html>


