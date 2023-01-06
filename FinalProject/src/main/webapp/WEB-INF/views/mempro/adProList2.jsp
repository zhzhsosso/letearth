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
<title>프로젝트 목록</title>
<style type="text/css">
#sbtn {
	position: absolute;
	top: -4px;
}

#repSelector {
	width: 20%;
	height: 3px;
	background-color: #BBE093;
	border: 0;
	position: relative;
	top: -15px;
	/*    left: 380px;  */
	left: 40%;
}

#repSelector1 {
	position: relative;
	top: -15px;
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
				<b style="color: #6c757d;">프로젝트 목록</b> <br> <br> <br>
			</h2>
			<div class="col-xs-12">
				<div style="font-size: 2.2rem;" align="left">
					<a id="listAll">전체</a> | <a id="list5">판매중</a> | <a id="list6">마감</a>
					| <a id="list7">판매중지</a>
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
										<th style="font-size: 15px;">달성률</th>
										<th style="font-size: 15px;">프로젝트 상태</th>
									</tr>
									<c:forEach var="proVO" items="${proList }">
										<tr>
											<td style="font-size: 15px;">${proVO.pro_no }</td>
											<td style="font-size: 15px;"><a
												href="/mempro/adProDetail2?pro_no=${proVO.pro_no }"
												style="color: green"> ${proVO.pro_title } </a></td>
											<td style="font-size: 15px;">${proVO.mem_id }</td>
											<td style="font-size: 15px;">${proVO.pro_st_dt }</td>
											<td style="font-size: 15px;"><fmt:formatNumber value="${proVO.pro_tp }" />원</td>
											<td style="font-size: 15px;"><fmt:formatNumber
													value="${proVO.pro_tp / proVO.pro_gp }" type="percent" /></td>
											<c:choose>
												<c:when test="${proVO.pro_status == 5}">
													<td style="font-size: 15px;"><span class="label label-success">판매중</span></td>
												</c:when>
												<c:when test="${proVO.pro_status == 6}">
													<td style="font-size: 15px;"><span class="label label-info">마감</span></td>
												</c:when>
												<c:when test="${proVO.pro_status == 7}">
													<td style="font-size: 15px;"><span class="label label-warning">판매중지</span></td>
												</c:when>
											</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- proAll -->
					<!-- pro5 -->
					<div class="box-body table-responsive no-padding" id="pro5">
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
										<th style="font-size: 15px;">달성률</th>
										<th style="font-size: 15px;">프로젝트 상태</th>
									</tr>
									<c:forEach var="proVO5" items="${proList }">
										<c:if test="${proVO5.pro_status == 5}">
											<tr>
												<td style="font-size: 15px;">${proVO5.pro_no }</td>
												<td style="font-size: 15px;"><a
													href="/mempro/adProDetail2?pro_no=${proVO5.pro_no }"
													style="color: green"> ${proVO5.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO5.mem_id }</td>
												<td style="font-size: 15px;">${proVO5.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber value="${proVO5.pro_tp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO5.pro_tp / proVO5.pro_gp }" type="percent" /></td>
												<td style="font-size: 15px;"><span class="label label-success">판매중</span></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- pro5 -->

					<!-- pro6 -->
					<div class="box-body table-responsive no-padding" id="pro6">
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
										<th style="font-size: 15px;">달성률</th>
										<th style="font-size: 15px;">프로젝트 상태</th>
									</tr>
									<c:forEach var="proVO6" items="${proList }">
										<c:if test="${proVO6.pro_status == 6}">
											<tr>
												<td style="font-size: 15px;">${proVO6.pro_no }</td>
												<td style="font-size: 15px;"><a
													href="/mempro/adProDetail2?pro_no=${proVO6.pro_no }"
													style="color: green"> ${proVO6.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO6.mem_id }</td>
												<td style="font-size: 15px;">${proVO6.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber value="${proVO6.pro_tp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO6.pro_tp / proVO6.pro_gp }" type="percent" /></td>
												<td style="font-size: 15px;"><span class="label label-info">마감</span></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- pro6 -->
					<!-- pro7 -->
					<div class="box-body table-responsive no-padding" id="pro7">
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
										<th style="font-size: 15px;">달성률</th>
										<th style="font-size: 15px;">프로젝트 상태</th>
									</tr>
									<c:forEach var="proVO7" items="${proList }">
										<c:if test="${proVO7.pro_status == 7}">
											<tr>
												<td style="font-size: 15px;">${proVO7.pro_no }</td>
												<td style="font-size: 15px;"><a
													href="/mempro/adProDetail2?pro_no=${proVO7.pro_no }"
													style="color: green"> ${proVO7.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO7.mem_id }</td>
												<td style="font-size: 15px;">${proVO5.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber value="${proVO7.pro_tp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO7.pro_tp / proVO7.pro_gp }" type="percent" /></td>
												<td style="font-size: 15px;"><span class="label label-warning">판매중지</span></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
					<!-- pro7 -->



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

		</div>
	</section>
	<!-- 페이징처리 -->

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
<!-- jQuery-->

<script type="text/javascript" src="jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	$("#proAll").ready(function() {

		$("#proAll").show();
		$("#pro5").hide();
		$("#pro6").hide();
		$("#pro7").hide();

		$("#listAll").css("color", "green");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").click(function() {
			$("#proAll").show();
			$("#pro5").hide();
			$("#pro6").hide();
			$("#pro7").hide();

			$("#listAll").css("color", "green");
			$("#listAll").css("font-weight", "bolder");
			$("#list5").css("color", "grey");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "grey");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "grey");
			$("#list7").css("font-weight", "normal");

		});

		$("#list5").click(function() {
			$("#proAll").hide();
			$("#pro5").show();
			$("#pro6").hide();
			$("#pro7").hide();

			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "green");
			$("#list5").css("font-weight", "bolder");
			$("#list6").css("color", "grey");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "grey");
			$("#list7").css("font-weight", "normal");
		});

		$("#list6").click(function() {
			$("#proAll").hide();
			$("#pro5").hide();
			$("#pro6").show();
			$("#pro7").hide();

			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "grey");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "green");
			$("#list6").css("font-weight", "bolder");
			$("#list7").css("color", "grey");
			$("#list7").css("font-weight", "normal");
		});

		$("#list7").click(function() {
			$("#proAll").hide();
			$("#pro5").hide();
			$("#pro6").hide();
			$("#pro7").show();

			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "grey");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "grey");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "green");
			$("#list7").css("font-weight", "bolder");
		});

	});
</script>

















</html>


<!-- 		<h1>admin/mempro/adProList2</h1> -->

<!-- 		<section class="contact-form-area"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row justify-content-center"> -->
<!-- 					<div class="col-lg-8"> -->
<!-- 						<div class="section-title text-center"> -->
<!-- 							<h3 class="title">프로젝트 리스트2</h3> -->

<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="row justify-content-center"> -->
<!-- 					<div class="col-lg-8"> -->



<!-- 						<table border="1"> -->
<!-- 							<tr> -->
<!-- 								<td>프로젝트 번호</td> -->
<!-- 								<td>아이디</td> -->
<!-- 								<td>프로젝트 이름</td> -->
<!-- 								<td>목표금액</td> -->
<!-- 								<td>달성률</td> -->
<!-- 								<td>승인상태</td> -->
<!-- 							</tr> -->

<%-- 							<c:forEach var="proVO" items="${proList }"> --%>
<!-- 								<tr> -->
<!-- 									<td> -->
<%-- 										<a href="/mempro/adProDetail2?pro_no=${proVO.pro_no }">${proVO.pro_no }</a> --%>
<!-- 									</td> -->
<%-- 									<td>${proVO.mem_id }</td> --%>
<%-- 									<td>${proVO.pro_title }</td> --%>
<%-- 									<td>${proVO.pro_gp }</td> --%>
<%-- 									<td><fmt:formatNumber --%>
<%-- 											value="${proVO.pro_tp / proVO.pro_gp }" type="percent" /></td> --%>

<!-- 									프로젝트 상태 -->
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${proVO.pro_status == 5}"> --%>
<!-- 											<td>판매중</td> -->
<%-- 										</c:when> --%>
<%-- 										<c:when test="${proVO.pro_status == 6}"> --%>
<!-- 											<td>마감</td> -->
<%-- 										</c:when> --%>
<%-- 										<c:when test="${proVO.pro_status == 7}"> --%>
<!-- 											<td>판매중지</td> -->
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>

<!-- 								</tr> -->
<%-- 							</c:forEach> --%>

<!-- 						</table> -->



<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->

<!-- 		</section> -->


<!-- 		<!-- 푸터 -->

<%-- 		<%@ include file="../include/footer.jsp"%> --%>