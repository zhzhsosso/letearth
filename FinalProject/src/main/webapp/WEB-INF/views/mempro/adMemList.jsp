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
<title>회원 리스트</title>


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
	top: 300px;
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

/*hover*/
#hov a:hover{
  color : green;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
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

					<b style="color: #6c757d;">회원 리스트</b> <br> <br> <br>
				</h2>
				<div class="col-xs-12">
					<div style="font-size: 2.2rem;" align="left">
						<span id="hov">
						<a id="listAll">전체</a> | <a id="list2">구매회원</a> | <a id="list3">판매회원</a>
						| <a id="list4">블랙리스트</a>
						</span>
					</div>
					<!-- 어드민 -->
					<br>
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
						<!-- memAll -->
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EEF5E6">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;"">회원 번호</th>
											<th style="font-size: 15px;" >회원 아이디</th>
											<th style="font-size: 15px;">회원 이름</th>
											<th style="font-size: 15px;">회원 연락처</th>
											<th style="font-size: 15px;">회원 분류</th>
											<th style="font-size: 15px;">블랙리스트</th>
											<th style="font-size: 15px;">상세정보</th>
										</tr>

										<c:forEach var="memVO" items="${memList }" varStatus="status">
											<tr>
												<td style="font-size: 15px;">${memVO.mem_no }</td>
												<td style="font-size: 15px;"><a href="/mempro/adMemDetail?mem_id=${memVO.mem_id }">${memVO.mem_id }</a></td>
												<td style="font-size: 15px;">${memVO.mem_name }</td>
												<td style="font-size: 15px;">${memVO.mem_phone }</td>

												<!-- 회원분류 -->
												<c:choose>
													<c:when test="${memVO.mem_status == 0}">
														<td style="font-size: 15px;"><span
															class="label label-success">구매회원</span></td>
													</c:when>
													<c:when test="${memVO.mem_status == 1}">
														<td style="font-size: 15px;"><span
															class="label label-info">판매회원</span></td>
													</c:when>
													<c:when test="${memVO.mem_status == 3}">
														<td style="font-size: 15px;"><span
															class="label label-warning">블랙리스트</span></td>
													</c:when>
												</c:choose>


												<!-- 블랙리스트 여부 -->
												<c:choose>
													<c:when test="${not empty memVO.mem_bdate }">
														<td>Y</td>
													</c:when>
													<c:when test="${empty memVO.mem_bdate }">
														<td>N</td>
													</c:when>
												</c:choose>
												<td style="font-size: 15px;"><a
													href="/mempro/adMemDetail?mem_id=${memVO.mem_id }">상세정보</a>
											</tr>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- memAll -->
						<!-- mem2 : 구매회원-->

						<div class="box-body table-responsive no-padding" id=mem2>
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EEF5E6">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;"">회원 번호</th>
											<th style="font-size: 15px;">회원 아이디</th>
											<th style="font-size: 15px;">회원 이름</th>
											<th style="font-size: 15px;">회원 연락처</th>
											<th style="font-size: 15px;">회원 분류</th>
											<th style="font-size: 15px;">블랙리스트</th>
											<th style="font-size: 15px;">상세정보</th>
										</tr>

										<c:forEach var="memVO2" items="${memList }" >
											<c:if test="${memVO2.mem_status == 0}">
												<tr>
													<td style="font-size: 15px;">${memVO2.mem_no }</td>
													<td style="font-size: 15px;"><a href="/mempro/adMemDetail?mem_id=${memVO2.mem_id }">${memVO2.mem_id }</a></td>
													<td style="font-size: 15px;">${memVO2.mem_name }</td>
													<td style="font-size: 15px;">${memVO2.mem_phone }</td>
													<td style="font-size: 15px;"><span
														class="label label-success">구매회원</span></td>
													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO2.mem_bdate }">
															<td style="font-size: 15px;">Y</td>
														</c:when>
														<c:when test="${empty memVO2.mem_bdate }">
															<td style="font-size: 15px;">N</td>
														</c:when>
													</c:choose>
													<td style="font-size: 15px;"><a
														href="/mempro/adMemDetail?mem_id=${memVO2.mem_id }">상세정보</a>
												</tr>
											</c:if>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- mem2 : 구매회원-->


						<!-- mem3 : 판매회원 -->

						<div class="box-body table-responsive no-padding" id="mem3">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EEF5E6">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;"">회원 번호</th>
											<th style="font-size: 15px;">회원 아이디</th>
											<th style="font-size: 15px;">회원 이름</th>
											<th style="font-size: 15px;">회원 연락처</th>
											<th style="font-size: 15px;">회원 분류</th>
											<th style="font-size: 15px;">블랙리스트</th>
											<th style="font-size: 15px;">상세정보</th>
										</tr>

										<c:forEach var="memVO3" items="${memList }" >
											<c:if test="${memVO3.mem_status == 1}">
												<tr>
													<td style="font-size: 15px;">${memVO3.mem_no }</td>
													<td style="font-size: 15px;"><a href="/mempro/adMemDetail?mem_id=${memVO3.mem_id }">${memVO3.mem_id }</a></td>
													<td style="font-size: 15px;">${memVO3.mem_name }</td>
													<td style="font-size: 15px;">${memVO3.mem_phone }</td>
													<td style="font-size: 15px;"><span
														class="label label-info">판매회원</span></td>

													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO3.mem_bdate }">
															<td style="font-size: 15px;">Y</td>
														</c:when>
														<c:when test="${empty memVO3.mem_bdate }">
															<td style="font-size: 15px;">N</td>
														</c:when>
													</c:choose>
													<td style="font-size: 15px;"><a
														href="/mempro/adMemDetail?mem_id=${memVO3.mem_id }">상세정보</a>
												</tr>
											</c:if>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- mem3 : 판매회원 -->

						<!-- mem4 : 블랙리스트 -->

						<div class="box-body table-responsive no-padding" id="mem4">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EEF5E6">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;"">회원 번호</th>
											<th style="font-size: 15px;">회원 아이디</th>
											<th style="font-size: 15px;">회원 이름</th>
											<th style="font-size: 15px;">회원 연락처</th>
											<th style="font-size: 15px;">회원 분류</th>
											<th style="font-size: 15px;">블랙리스트</th>
											<th style="font-size: 15px;">상세정보</th>
										</tr>

										<c:forEach var="memVO4" items="${memList }" varStatus="status">
											<c:if test="${memVO4.mem_status == 3}">
												<tr>
													<td style="font-size: 15px;">${memVO4.mem_no }</td>
													<td style="font-size: 15px;"><a href="/mempro/adMemDetail?mem_id=${memVO4.mem_id }">${memVO4.mem_id }</a></td>
													<td style="font-size: 15px;">${memVO4.mem_name }</td>
													<td style="font-size: 15px;">${memVO4.mem_phone }</td>

													<td><span class="label label-warning">블랙리스트</span></td>

													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO4.mem_bdate }">
															<td style="font-size: 15px;">Y</td>
														</c:when>
														<c:when test="${empty memVO4.mem_bdate }">
															<td style="font-size: 15px;">N</td>
														</c:when>
													</c:choose>
													<td style="font-size: 15px;"><a
														href="/mempro/adMemDetail?mem_id=${memVO4.mem_id }">상세정보</a>
												</tr>
											</c:if>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- mem4 : -->



					</div>

					<!-- 페이징처리 -->
					<div class="box-footer clearfix" id="paging">
						<ul class="pagination pagination-sm no-margin pull-left">
							<c:if test="${pvo.prev }">
								<li><a href="/mempro/adMemList?page=${pvo.startPage-1 }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="/mempro/adMemList?page=${idx }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li><a href=/mempro/adMemList?page=${pvo.endPage+1 }">»</a></li>
								<!-- 11 -->
							</c:if>
						</ul>
					</div>
					<!-- 페이징처리 -->
				</div>
			</div>
		</div>
	</section>




	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
</body>
<!-- jQuery-->

<!-- div숨기기 나타내기 -->
<script type="text/javascript" src="jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	$("#memAll").ready(function() {

		$("#memAll").show();
		$("#mem2").hide();
		$("#mem3").hide();
		$("#mem4").hide();

		$("#listAll").css("color", "green");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").click(function() { // 전체
			$("#memAll").show();
			$("#mem2").hide();
			$("#mem3").hide();
			$("#mem4").hide();

			$("#listAll").css("color", "green");
			$("#listAll").css("font-weight", "bolder");
			$("#list2").css("color", "grey");
			$("#list2").css("font-weight", "normal");
			$("#list3").css("color", "grey");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");

		});

		$("#list2").click(function() { // 구매회원
			$("#memAll").hide();
			$("#mem2").show();
			$("#mem3").hide();
			$("#mem4").hide();

			$("#list2").css("color", "green");
			$("#list2").css("font-weight", "bolder");
			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "grey");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");
		});

		$("#list3").click(function() { // 판매회원
			$("#memAll").hide();
			$("#mem2").hide();
			$("#mem3").show();
			$("#mem4").hide();

			$("#list3").css("color", "green");
			$("#list3").css("font-weight", "bolder");
			$("#list2").css("color", "grey");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "grey");
			$("#listAll").css("font-weight", "normal");
			$("#list4").css("color", "grey");
			$("#list4").css("font-weight", "normal");
		});

		$("#list4").click(function() { // 블랙리스트
			$("#memAll").hide();
			$("#mem2").hide();
			$("#mem3").hide();
			$("#mem4").show();

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


