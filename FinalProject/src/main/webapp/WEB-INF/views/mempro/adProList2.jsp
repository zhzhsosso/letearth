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
<title>프로젝트 목록</title>

<style type="text/css">

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

#repSelector1 {
	position: relative;
	top: -15px;
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

			<div class="container">
				<br> <br> <br> <br> <br> <br>
				<!-- 어드민 -->
				<h2 class="box-title" align="center">
					<b style="color: #6c757d;">프로젝트 목록</b> <br> <br> <br>
				</h2><hr id="repSelector" align="center">
				<div class="col-xs-12">
					<div style="font-size: 1.7rem;" align="left">
						<span id="hov"><a id="listAll"
							style="color: #6F7B63; font-weight: bolder;">전체</a> | <a id="list5" style="color: #B6AD90" >판매중</a>
							| <a id="list6" style="color: #B6AD90" >마감</a> | <a id="list7" style="color: #B6AD90" >판매중지</a>
						</span>
						<hr style="border-color: rgba(164, 172, 133, .5); position: relative; top: -10px; width: 100%; ">
					</div>
					<br>
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

						<!-- proAll -->
						<div class="box-body table-responsive no-padding" id="proAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;">프로젝트 번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed">프로젝트 이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">달성률</th>
											<th style="font-size: 15px;">프로젝트 상태</th>
										</tr>
										<c:forEach var="proVO" items="${proList }">
											<tr>
												<td style="font-size: 15px; text-align: center;">${proVO.pro_no }</td>
												<td style="font-size: 15px;"><a
													href="/mempro/adProDetail2?pro_no=${proVO.pro_no }&mem_id=${proVO.mem_id}"
													style="color: green"> ${proVO.pro_title } </a></td>
												<td style="font-size: 15px;">${proVO.mem_id }</td>
												<td style="font-size: 15px;">${proVO.pro_st_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO.pro_tp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${proVO.pro_tp / proVO.pro_gp }" type="percent" /></td>
												<c:choose>
													<c:when test="${proVO.pro_status == 5}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">판매중</button>
														</td>
													</c:when>
													<c:when test="${proVO.pro_status == 6}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">마감</button>
														</td>
													</c:when>
													<c:when test="${proVO.pro_status == 7}">
														<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매중지</button>
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
						<!-- pro5 -->
						<div class="box-body table-responsive no-padding" id="pro5">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;">프로젝트 번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed">프로젝트 이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">달성률</th>
											<th style="font-size: 15px;">프로젝트 상태</th>
										</tr>
										<c:forEach var="proVO5" items="${proList }">
											<c:if test="${proVO5.pro_status == 5}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO5.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail2?pro_no=${proVO5.pro_no }&mem_id=${proVO5.mem_id}"
														style="color: green"> ${proVO5.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO5.mem_id }</td>
													<td style="font-size: 15px;">${proVO5.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO5.pro_tp }" />원</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO5.pro_tp / proVO5.pro_gp }" type="percent" /></td>
													<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">판매중</button>
														</td>
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
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width : 10%; table-layout: fixed;">프로젝트 번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed">프로젝트 이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">달성률</th>
											<th style="font-size: 15px;">프로젝트 상태</th>
										</tr>
										<c:forEach var="proVO6" items="${proList }">
											<c:if test="${proVO6.pro_status == 6}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO6.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail2?pro_no=${proVO6.pro_no }&mem_id=${proVO6.mem_id}"
														style="color: green"> ${proVO6.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO6.mem_id }</td>
													<td style="font-size: 15px;">${proVO6.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO6.pro_tp }" />원</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO6.pro_tp / proVO6.pro_gp }" type="percent" /></td>
													<td style="text-align: center;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">마감</button>
														</td>
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
										<tr style="background-color: #EDEAE0">
											<th style="font-size: 15px; width: 10%; table-layout: fixed;">프로젝트
												번호</th>
											<th style="font-size: 15px; width: 38%; table-layout: fixed">프로젝트
												이름</th>
											<th style="font-size: 15px; width: 12%; table-layout: fixed;">아이디</th>
											<th style="font-size: 15px;">펀딩 시작날짜</th>
											<th style="font-size: 15px;">목표금액</th>
											<th style="font-size: 15px;">달성률</th>
											<th style="font-size: 15px;">프로젝트 상태</th>
										</tr>
										<c:forEach var="proVO7" items="${proList }">
											<c:if test="${proVO7.pro_status == 7}">
												<tr>
													<td style="font-size: 15px; text-align: center;">${proVO7.pro_no }</td>
													<td style="font-size: 15px;"><a
														href="/mempro/adProDetail2?pro_no=${proVO7.pro_no }&mem_id=${proVO7.mem_id}"
														style="color: green"> ${proVO7.pro_title } </a></td>
													<td style="font-size: 15px;">${proVO7.mem_id }</td>
													<td style="font-size: 15px;">${proVO5.pro_st_dt }</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO7.pro_tp }" />원</td>
													<td style="font-size: 15px;"><fmt:formatNumber
															value="${proVO7.pro_tp / proVO7.pro_gp }" type="percent" /></td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매중지</button>
													</td>
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
<br><br>
				<!-- 페이징처리 -->
				<div class="pagination" style="position: absolute; right: 45%; border: none;">
						<ul class="pagination" style="font-size: 18px;">
						<c:if test="${pvo.prev }">
							<li class="paging"><a href="/mempro/adProList2?page=${pvo.startPage-1 }">«</a></li>
							<!-- 10 -->
						</c:if>

						<c:forEach var="idx" begin="${pvo.startPage }"
							end="${pvo.endPage }" step="1">
							<li class="paging" <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
								href="/mempro/adProList2?page=${idx }">${idx }</a></li>
						</c:forEach>

						<c:if test="${pvo.next }">
							<li class="paging"><a href="/mempro/adProList2?page=${pvo.endPage+1 }">»</a></li>
							<!-- 11 -->
						</c:if>
					</ul>
				</div>
				<!-- 페이징처리 -->
			</div><br><br><br><br><br>
	</section>

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

		$("#listAll").css("color", "#B6AD90");
		$("#listAll").css("font-weight", "bolder");

		$("#listAll").hover(function() {
			$("#proAll").show();
			$("#pro5").hide();
			$("#pro6").hide();
			$("#pro7").hide();

			$("#listAll").css("color", "#6F7B63");
			$("#listAll").css("font-weight", "bolder");
			$("#list5").css("color", "#B6AD90");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "#B6AD90");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "#B6AD90");
			$("#list7").css("font-weight", "normal");

		});

		$("#list5").hover(function() {
			$("#proAll").hide();
			$("#pro5").show();
			$("#pro6").hide();
			$("#pro7").hide();

			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "#6F7B63");
			$("#list5").css("font-weight", "bolder");
			$("#list6").css("color", "#B6AD90");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "#B6AD90");
			$("#list7").css("font-weight", "normal");
		});

		$("#list6").hover(function() {
			$("#proAll").hide();
			$("#pro5").hide();
			$("#pro6").show();
			$("#pro7").hide();

			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "#B6AD90");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "#6F7B63");
			$("#list6").css("font-weight", "bolder");
			$("#list7").css("color", "#B6AD90");
			$("#list7").css("font-weight", "normal");
		});

		$("#list7").hover(function() {
			$("#proAll").hide();
			$("#pro5").hide();
			$("#pro6").hide();
			$("#pro7").show();

			$("#listAll").css("color", "#B6AD90");
			$("#listAll").css("font-weight", "normal");
			$("#list5").css("color", "#B6AD90");
			$("#list5").css("font-weight", "normal");
			$("#list6").css("color", "#B6AD90");
			$("#list6").css("font-weight", "normal");
			$("#list7").css("color", "#6F7B63");
			$("#list7").css("font-weight", "bolder");
		});
		
		
		$("#listAll").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list5").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list6").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		$("#list7").hover(function() {
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder');
		}, function() {
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal');
		});

		

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
			location.href="/mempro/adProList2";
		});
		
	});

 }
 </script>




</html>

