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
<title>회원 리스트</title>


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
  width : 10%;
  height : 3px;
  background-color : #D7D1B9;
  border : 0;
  
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
	
	top: 300px;
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
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

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
	border-radius:0.25rem;
    z-index: -1;
}

.main-btn{
    border-radius: 0.25rem;
    background-color: #A4AC85;
    color: #F2F0E8;
    font-size: 18px;
    font-weight: bolder;
	text-align:center; 
    vertical-align:middle;
    line-height:0px;
    padding:12px;
    align-content:center;
    width: 140px;
    height: 60px;
    
    margin: 10px;

}
 
/*페이징*/
.paging {
    display: inline-block;
}

.paging a{
	display: block;
	text-decoration: none;
	color: #414934;
	float: left;
	line-height: 1.5;
	border-radius:50%;
	padding: 8px 16px;
}

.paging a:hover {
	background-color: #B6AD90;
	color: #E8E4D7;
	
}

.paging a.active{
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
}

.pagination a:active{
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
			<!-- 사이드바 -->

			<div class="container">
				<br> <br> <br> <br> <br> <br>

				<!-- 어드민 -->
				<h2 class="box-title" align="center">

					<b style="color: #6c757d;">회원 리스트</b> <br> <br> <br>
				</h2><hr id="repSelector" align="center">
				<div class="col-xs-12">
					<div style="font-size: 1.7rem;" align="left" class="proList2">
						<span id="hov"> <a id="listAll"
							style="color: #6F7B63; font-weight: bolder;">전체</a> | <a
							id="list2" style="color: #B6AD90" >구매회원</a> | <a id="list3" style="color: #B6AD90">판매회원</a> | <a id="list4" style="color: #B6AD90">블랙리스트</a>
						</span>
						<hr style="border-color: rgba(164, 172, 133, .5); position: relative; top: -10px; width: 100%; ">
					</div>
					<!-- 어드민 -->
					
					<!-- 검색기능 -->

					<div class="box" style="border-top: none;">
						<div class="box-header">
							<div class="box-tools" align="right">
								<div class="input-group input-group-sm hidden-xs"
									style="width: 180px; height: 50px;">
									<input type="text" name="keyword"
										class="form-control pull-right" placeholder="Search"
										style="height: 35px; width: 60px; font-size: 1rem;">
									<div class="input-group-btn" style="padding-left: 3px;">
										<button type="submit" class="btn btn-default" id="sbtn">
											<i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					<!-- 검색기능 -->
						<br>
						<br>
						<!-- memAll -->
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0" >
											<th style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center;">회원
												번호</th>
											<th style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center;">회원 아이디</th>
											<th style="font-size: 15px; text-align: center;">회원 이름</th>
											<th style="font-size: 15px; text-align: center;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center;">회원 분류</th>
											<th style="font-size: 15px; text-align: center;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center;">상세정보</th>
										</tr>

										<c:forEach var="memVO" items="${memList }" varStatus="status">
											<tr>
												<td style="font-size: 15px; text-align: center;">${memVO.mem_no }</td>
												<td style="font-size: 15px; text-align: center;">${memVO.mem_id }</td>
												<td style="font-size: 15px; text-align: center;">${memVO.mem_name }</td>
												<td style="font-size: 15px; text-align: center; ">${memVO.mem_phone }</td>

												<!-- 회원분류 -->
												<c:choose>
													<c:when test="${memVO.mem_status == 0}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">구매회원</button>
														</td>
													</c:when>
													<c:when test="${memVO.mem_status == 1}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매회원</button>
														</td>
													</c:when>
													<c:when test="${memVO.mem_status == 3}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">블랙리스트</button>
														</td>
													</c:when>
												</c:choose>


												<!-- 블랙리스트 여부 -->
												<c:choose>
													<c:when test="${not empty memVO.mem_bdate }">
														<td style="font-size: 15px; text-align: center;">Y</td>
													</c:when>
													<c:when test="${empty memVO.mem_bdate }">
														<td style="font-size: 15px; text-align: center;">N</td>
													</c:when>
												</c:choose>
												<td style="text-align: center;">
													<button type="button" class="btn btn-primary"
														onclick="location.href='/mempro/adMemDetail?mem_id=${memVO.mem_id }';"
														style="font-size: 12px; background-color: #A4AC85; border-color: #A4AC85; cursor: pointer;">상세정보</button>
												</td>
											</tr>
										</c:forEach>
										</tbody>
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
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center;">회원
												번호</th>
											<th style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center;">회원 아이디</th>
											<th style="font-size: 15px; text-align: center;">회원 이름</th>
											<th style="font-size: 15px; text-align: center;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center;">회원 분류</th>
											<th style="font-size: 15px; text-align: center;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center;">상세정보</th>
										</tr>

										<c:forEach var="memVO2" items="${memList }">
											<c:if test="${memVO2.mem_status == 0}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${memVO2.mem_no }</td>
													<td style="font-size: 15px; text-align: center;">${memVO2.mem_id }</td>
													<td style="font-size: 15px; text-align: center;">${memVO2.mem_name }</td>
													<td style="font-size: 15px; text-align: center;">${memVO2.mem_phone }</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90; ">구매회원</button>
													</td>
													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO2.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">Y</td>
														</c:when>
														<c:when test="${empty memVO2.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">N</td>
														</c:when>
													</c:choose>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															onclick="location.href='/mempro/adMemDetail?mem_id=${memVO2.mem_id }';"
															style="font-size: 12px; background-color: #A4AC85; border-color: #A4AC85; cursor: pointer;">상세정보</button>
													</td>
												</tr>
											</c:if>
										</c:forEach>
										</tbody>
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
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center;">회원
												번호</th>
											<th style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center;">회원 아이디</th>
											<th style="font-size: 15px; text-align: center;">회원 이름</th>
											<th style="font-size: 15px; text-align: center;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center;">회원 분류</th>
											<th style="font-size: 15px; text-align: center;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center;">상세정보</th>
										</tr>

										<c:forEach var="memVO3" items="${memList }">
											<c:if test="${memVO3.mem_status == 1}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${memVO3.mem_no }</td>
													<td style="font-size: 15px; text-align: center;">${memVO3.mem_id }</td>
													<td style="font-size: 15px; text-align: center;">${memVO3.mem_name }</td>
													<td style="font-size: 15px; text-align: center;">${memVO3.mem_phone }</td>
													<!-- 													<td><span -->
													<!-- 														class="label label-info" style="font-size: 12px;">판매회원</span></td> -->
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매회원</button>
													</td>
													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO3.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">Y</td>
														</c:when>
														<c:when test="${empty memVO3.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">N</td>
														</c:when>
													</c:choose>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															onclick="location.href='/mempro/adMemDetail?mem_id=${memVO3.mem_id }';"
															style="font-size: 12px; background-color: #A4AC85; border-color: #A4AC85; cursor: pointer;">상세정보</button>
													</td>
												</tr>
											</c:if>
										</c:forEach>
										</tbody>
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
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center;">회원
												번호</th>
											<th style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center;">회원 아이디</th>
											<th style="font-size: 15px; text-align: center;">회원 이름</th>
											<th style="font-size: 15px; text-align: center;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center;">회원 분류</th>
											<th style="font-size: 15px; text-align: center;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center;">상세정보</th>
										</tr>

										<c:forEach var="memVO4" items="${memList }" varStatus="status">
											<c:if test="${memVO4.mem_status == 3}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${memVO4.mem_no }</td>
													<td style="font-size: 15px; text-align: center;">${memVO4.mem_id }</td>
													<td style="font-size: 15px; text-align: center;">${memVO4.mem_name }</td>
													<td style="font-size: 15px; text-align: center;">${memVO4.mem_phone }</td>

													<!-- 													<td><span class="label label-warning" style="font-size: 12px;">블랙리스트</span></td> -->
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">블랙리스트</button>
													</td>

													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO4.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">Y</td>
														</c:when>
														<c:when test="${empty memVO4.mem_bdate }">
															<td style="font-size: 15px; text-align: center;">N</td>
														</c:when>
													</c:choose>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															onclick="location.href='/mempro/adMemDetail?mem_id=${memVO4.mem_id }';"
															style="font-size: 12px; background-color: #A4AC85; border-color: #A4AC85; cursor: pointer;">상세정보</button>
													</td>
												</tr>
											</c:if>
										</c:forEach>
										</tbody>
								</table>
							</form>
						</div>
						<!-- mem4 : -->



					</div>
<br><br>
					<!-- 페이징처리 -->
					<div class="pagination" style="position: absolute; right: 45%; border: none;">
						<ul class="pagination" style="font-size: 18px;">
							<c:if test="${pvo.prev }">
								<li class="paging"><a href="/mempro/adMemList?page=${pvo.startPage-1 }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li class="paging" <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="/mempro/adMemList?page=${idx }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li class="paging"><a href=/mempro/adMemList?page=${pvo.endPage+1}">»</a></li>
								<!-- 11 -->
							</c:if>
						</ul>
					</div>
					<!-- 페이징처리 -->
				</div>
			</div>
		</div>
		<br><br><br><br><br>
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

		$("#listAll").css("color", "#6F7B63");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").hover(function() { // 전체
			$("#memAll").show();
			$("#mem2").hide();
			$("#mem3").hide();
			$("#mem4").hide();

			$("#listAll").css("color", "#6F7B63");
			$("#listAll").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");

		});

		$("#list2").hover(function() { // 구매회원
			$("#memAll").hide();
			$("#mem2").show();
			$("#mem3").hide();
			$("#mem4").hide();

			$("#list2").css("color", "#6F7B63");
			$("#list2").css("font-weight", "bolder");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");

		});

		$("#list3").hover(function() { // 판매회원
			$("#memAll").hide();
			$("#mem2").hide();
			$("#mem3").show();
			$("#mem4").hide();

			$("#list3").css("color", "#6F7B63");
			$("#list3").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list4").css("color", "#B6AD90");
			$("#list4").css("font-weight", "normal");
		});

		$("#list4").hover(function() { // 블랙리스트
			$("#memAll").hide();
			$("#mem2").hide();
			$("#mem3").hide();
			$("#mem4").show();

			$("#list4").css("color", "#6F7B63");
			$("#list4").css("font-weight", "bolder");
			$("#list2").css("color", "#B6AD90");
			$("#list2").css("font-weight", "normal");
			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list3").css("color", "#B6AD90");
			$("#list3").css("font-weight", "normal");
		});

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
</script>


<!-- 검색기능 -->
 <script type="text/javascript">
 function fun1(){
	 
 if(document.fr.type.value==""){
	 
	 Swal.fire({   
         title : '검색유형을 선택하세요!',
          icon: 'info',
         confirmButtonText: '확인'
      })
		document.fr.type.focus();
		return false;
	}
 
	$(document).ready(function(){
			 
		$("#sbtn").click(function(){ // get방식
			location.href="/mempro/adMemList";
		});
		
	});

 }
 </script>

</html>


