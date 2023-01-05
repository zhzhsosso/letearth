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
		<div class="container">
			<br> <br>
			<!-- 어드민 -->
			<!--    <div align="center"><img src="/resources/faqPage.png" width="50%"></div>	 -->
			<!-- 						<h3 class="box-title" align="center">관리자 FAQ 리스트</h3> -->
			<div class="col-xs-12">
				<br>
				<br>
				<br>
				<div style="font-size: 2rem;" align="center">
					<span> <a id="proAll">전체</a> | <a id="proA">승인요청</a> | <a
						id="proB">승인</a> | <a id="proC">반려</a>
					</span>
					<hr id="proSelector">
				</div>
				<!-- 					<button type="button" class="btn bg-green" id="listBtn" onclick="">FAQ글쓰기</button> -->
				<!-- 어드민 -->
				<!-- 				<div class="box"> -->
				<br>
				<div class="box-header">
					<br>
					<br>
					<div class="box-tools" align="right">
						<div class="input-group input-group-sm hidden-xs"
							style="width: 200px;">
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

				<!-- pro2 -->
				<div class="box-body table-responsive no-padding"
					style="font-size: 1.5rem;" id="pro2">
					<form role="form" name="fr" id="contact-form" action=""
						method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>프로젝트 번호</th>
									<th>아이디</th>
									<th>프로젝트 이름</th>
									<th>목표금액</th>
									<th>펀딩 시작날짜</th>
									<th>승인상태</th>
								</tr>
								<c:forEach var="proVO2" items="${proList }">
									<c:if test="${proVO2.pro_status == 2}">
										<tr>
											<td>${proVO2.pro_no }</td>
											<td>${proVO2.mem_id }</td>
											<td><a
												href="/mempro/adProDetail1?pro_no=${proVO2.pro_no }"
												style="color: green"> ${proVO2.pro_title } </a></td>
											<td>${proVO2.pro_gp }</td>
											<td>${proVO2.pro_st_dt }</td>
											<td><span class="label label-info">승인요청</span></td>

										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<!-- pro2 -->
				<br>
				<br>
				<!-- pro3 -->
				<div class="box-body table-responsive no-padding"
					style="font-size: 1.5rem;" id="pro3">
					<form role="form" name="fr" id="contact-form" action=""
						method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>프로젝트 번호</th>
									<th>아이디</th>
									<th>프로젝트 이름</th>
									<th>목표금액</th>
									<th>펀딩 시작날짜</th>
									<th>승인상태</th>
								</tr>
								<c:forEach var="proVO3" items="${proList }">
									<c:if test="${proVO3.pro_status == 3}">
										<tr>
											<td>${proVO3.pro_no }</td>
											<td>${proVO3.mem_id }</td>
											<td><a
												href="/mempro/adProDetail1?pro_no=${proVO3.pro_no }"
												style="color: green"> ${proVO3.pro_title } </a></td>
											<td>${proVO3.pro_gp }</td>
											<td>${proVO3.pro_st_dt }</td>
											<td><span class="label label-success">승인</span></td>

										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>

				<!-- pro3 -->
				<br>
				<br>
				<!-- pro4 -->
				<div class="box-body table-responsive no-padding"
					style="font-size: 1.5rem;" id="pro4">
					<form role="form" name="fr" id="contact-form" action=""
						method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>프로젝트 번호</th>
									<th>아이디</th>
									<th>프로젝트 이름</th>
									<th>목표금액</th>
									<th>펀딩 시작날짜</th>
									<th>승인상태</th>
								</tr>
								<c:forEach var="proVO4" items="${proList }">
									<c:if test="${proVO4.pro_status == 4}">
										<tr>
											<td>${proVO4.pro_no }</td>
											<td>${proVO4.mem_id }</td>
											<td><a
												href="/mempro/adProDetail1?pro_no=${proVO4.pro_no }"
												style="color: green"> ${proVO4.pro_title } </a></td>
											<td>${proVO4.pro_gp }</td>
											<td>${proVO4.pro_st_dt }</td>
											<td><span class="label label-warning">반려</span></td>

										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</form>
				</div>
				<!-- pro4 -->

				<br>
				<br>

			</div>

			<!-- 페이징처리 -->
			<div class="box-footer clearfix" id="paging">
				<ul class="pagination pagination-sm no-margin pull-left">
					<c:if test="${pvo.prev }">
						<li><a href="/mempro/aadProList1?page=${pvo.startPage-1 }">«</a></li>
						<!-- 10 -->
					</c:if>

					<c:forEach var="idx" begin="${pvo.startPage }"
						end="${pvo.endPage }" step="1">
						<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
							href="/mempro/aadProList1?page=${idx }">${idx }</a></li>
					</c:forEach>

					<c:if test="${pvo.next }">
						<li><a href="/mempro/aadProList1?page=${pvo.endPage+1 }">»</a></li>
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

<script type="text/javascript">
	$("#listBtn").click(function() {
		location.href = "/board/adFaqRegist";
	});
</script>


<!-- div숨기기 나타내기 -->
<script type="text/javascript">
	$("#proAll").click(function() { // 전체
		$("#pro2").show();
		$("#pro3").show();
		$("#pro4").show();

		$("#proAll").css("color", "green");
		$("#proAll").css("font-weight", "bolder");
		$("#proA").css("color", "grey");
		$("#proA").css("font-weight", "normal");
		$("#proB").css("color", "grey");
		$("#proB").css("font-weight", "normal");
		$("#proC").css("color", "grey");
		$("#proC").css("font-weight", "normal");

	});

	$("#proA").click(function() { // 승인요청
		$("#pro2").show();
		$("#pro3").hide();
		$("#pro4").hide();

		$("#proA").css("color", "green");
		$("#proA").css("font-weight", "bolder");
		$("#proAll").css("color", "grey");
		$("#proAll").css("font-weight", "normal");
		$("#proB").css("color", "grey");
		$("#proB").css("font-weight", "normal");
		$("#proC").css("color", "grey");
		$("#proC").css("font-weight", "normal");
	});

	$("#proB").click(function() { // 승인
		$("#pro2").hide();
		$("#pro3").show();
		$("#pro4").hide();
		
		$("#proB").css("color", "green");
		$("#proB").css("font-weight", "bolder");
		$("#proA").css("color", "grey");
		$("#proA").css("font-weight", "normal");
		$("#proAll").css("color", "grey");
		$("#proAll").css("font-weight", "normal");
		$("#proC").css("color", "grey");
		$("#proC").css("font-weight", "normal");
	});

	$("#proC").click(function() { // 반려
		$("#pro2").hide();
		$("#pro3").hide();
		$("#pro4").show();

		$("#proC").css("color", "green");
		$("#proC").css("font-weight", "bolder");
		$("#proA").css("color", "grey");
		$("#proA").css("font-weight", "normal");
		$("#proAll").css("color", "grey");
		$("#proAll").css("font-weight", "normal");
		$("#proB").css("color", "grey");
		$("#proB").css("font-weight", "normal");
	});
</script>

</html>

<!-- <h1>admin/mempro/adProList1</h1> -->

<!-- <section class="contact-form-area"> -->
<!-- 	<div class="container"> -->
<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-lg-8"> -->
<!-- 				<div class="section-title text-center"> -->
<!-- 					<h3 class="title">프로젝트 리스트1</h3> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="row justify-content-center"> -->
<!-- 			<div class="col-lg-8"> -->
<!-- 				<form role="form" name="fr" id="contact-form" action="" -->
<!-- 					method="post"> -->
<!-- 					<table border="1"> -->
<!-- 						<tr> -->
<!-- 							<td>프로젝트 번호</td> -->
<!-- 							<td>아이디</td> -->
<!-- 							<td>프로젝트 이름</td> -->
<!-- 							<td>목표금액</td> -->
<!-- 							<td>달성률</td> -->
<!-- 							<td>프로젝트상태</td> -->
<!-- 						</tr> -->

<%-- 						<c:forEach var="proVO" items="${proList }"> --%>
<!-- 							<tr> -->
<!-- 								<td><a -->
<%-- 									href="/mempro/adProDetail1?pro_no=${proVO.pro_no }">${proVO.pro_no }</a> --%>
<!-- 								</td> -->
<%-- 								<td>${proVO.mem_id }</td> --%>
<%-- 								<td>${proVO.pro_title }</td> --%>
<%-- 								<td>${proVO.pro_gp }</td> --%>
<%-- 								<td><fmt:formatNumber --%>
<%-- 										value="${proVO.pro_tp / proVO.pro_gp }" type="percent" /></td> --%>

<!-- 								프로젝트 상태 -->
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${proVO.pro_status == 2}"> --%>
<!-- 										<td>승인요청</td> -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${proVO.pro_status == 3}"> --%>
<!-- 										<td>승인</td> -->
<%-- 									</c:when> --%>
<%-- 									<c:when test="${proVO.pro_status == 4}"> --%>
<!-- 										<td>반려</td> -->
<%-- 									</c:when> --%>
<%-- 								</c:choose> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</table> -->






<!-- 				</form> -->






<!-- 				페이징처리 -->
<!-- 				<div> -->
<!-- 					<ul> -->

<%-- 						<c:if test="${pvo.prev }"> --%>
<!-- 							<li><a -->
<%-- 								href="/report/adBlackList?page=${pvo.startPage-1 }">«</a></li> --%>
<!-- 							10 -->
<%-- 						</c:if> --%>

<%-- 						<c:forEach var="idx" begin="${pvo.startPage }" --%>
<%-- 							end="${pvo.endPage }" step="1"> --%>
<%-- 							<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a --%>
<%-- 								href="/report/adBlackList?page=${idx }">${idx }</a></li> --%>
<%-- 						</c:forEach> --%>

<%-- 						<c:if test="${pvo.next }"> --%>
<!-- 							<li><a -->
<%-- 								href="/report/adBlackList?page=${pvo.endPage+1 }">»</a></li> --%>
<!-- 							11 -->
<%-- 						</c:if> --%>
<!-- 					</ul> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- </section> -->


