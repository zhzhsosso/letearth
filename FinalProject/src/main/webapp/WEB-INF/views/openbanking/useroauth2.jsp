<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    
    
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
<title>정산완료 리스트</title>


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
 	<%@ include file="../include/header.jsp" %>
 	

<!-- 관리자 페이지 -->
 	
 	<c:if test="${sessionScope.mem_id eq 'admin' }">
 	<section class="contact-form-area">
		<div style="display: flex;">

			<!-- 사이드바 -->
			<%@ include file="../include/adSide.jsp"%>

			<div class="container">
				<br> <br> <br> <br> <br> <br>

				<!-- 어드민 -->
				<h2 class="box-title" align="center">
					<b style="color: #6c757d;">정산관리</b> <br> <br> <br>
				</h2>
				<div class="col-xs-12">
					<div style="font-size: 2.2rem;" align="left">
						<span id="hov"> <a href="/openbanking/useroauth">정산하기</a>
							| <a id="list3">정산완료</a>
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
											<th style="font-size: 15px; width : 10%; table-layout: fixed;"">프로젝트 번호</th>
											<th style="font-size: 15px;" >프로젝트 이름</th>
											<th style="font-size: 15px;">아이디</th>
											<th style="font-size: 15px;">펀딩 종료날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">달성금액</th>
<!-- 											<th style="font-size: 15px;">정산상세</th> -->
										</tr>

										<c:forEach var="cp" items="${completeSt }">
											<tr>
												<td style="font-size: 15px;">${cp.pro_no }</td>
												<td style="font-size: 15px;">${cp.pro_title } </a></td>
												<td style="font-size: 15px;">${cp.mem_id }</td>
												<td style="font-size: 15px;">${cp.pro_ed_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${cp.pro_gp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${cp.pro_tp }" />원</td>
<!-- 												<td style="font-size: 15px;"><span -->
<!-- 													class="label label-info"><a -->
<%-- 													href="/openbanking/transferResult?pro_no=${cp.pro_no }" --%>
<!-- 													style="color: green"> 이체내역보기 </a></span></td> -->
													
											</tr>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- memAll -->

					</div>

					<!-- 페이징처리 -->
					<div class="box-footer clearfix" id="paging">
						<ul class="pagination pagination-sm no-margin pull-left">
							<c:if test="${pvo.prev }">
								<li><a href="/openbanking/useroauth2?page=${pvo.startPage-1 }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="/openbanking/useroauth2?page=${idx }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li><a href=/openbanking/useroauth2?page=${pvo.endPage+1 }">»</a></li>
								<!-- 11 -->
							</c:if>
						</ul>
					</div>
					<!-- 페이징처리 -->
				</div>
			</div>
		</div>
	</section>
	</c:if>
	
	
	
<!-- 관리자 페이지 -->	

 	<br><br><br><br><br><br><br><br><br>

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>
	