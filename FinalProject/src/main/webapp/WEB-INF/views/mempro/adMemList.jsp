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

#searchBtn { /*검색버튼*/
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
   top: -12px; 
/*    left: 380px;  */
   left: 45%;
}

#repSelector1{
   position: relative;
   top: -15px; 
   border-color: rgba(164, 172, 133, .5);
   width: 100%;
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
	z-index: 1;
	/*    top: 30%;  */
	/*    left: 20%;  */
	background-color: #EDEAE0;
	overflow-x: hidden;
	padding-top: 30px;
	padding-bottom: 100px;
	position: sticky;
	top: 560px;
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
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
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


/*셀렉트 꾸미깅*/
/* The container must be positioned relative: */
.searchselect {
  position: relative;
  width: 35%;
  padding-right: 0px;
  padding-left: 0px;
  text-align: center;
  margin-right: 5px;
}

.searchselect select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: #A4AC85;
  height: 38px;
  vertical-align: middle;
  text-align: left;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #F2F0E8;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  font-weight: bolder;
  border-radius : 0.25rem;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: #B1B796;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

.reptb a:hover{
  color : #B6AD90;
  transition : 0s;
  font-weight: bolder;
}
</style>

</head>
<body>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>


	<section class="contact-form-area">
		<div style="display: flex;">

			<!-- 사이드바 -->
			<div class="sidenav">
				<a href="/board/adMain"> <i class="fa fa-solid fa-leaf"></i> <span
					style="position: relative; left: 2px; bottom: 3px; font-weight: bolder;">관리자메인</span>
				</a>
				<button class="dropdown-btn">
					<i class="fa fa-solid fa-paper-plane"></i> &nbsp;고객센터 <i
						class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-container">
					<a href="/notice/main">공지사항</a> <a href="/board/adFaqList">FAQ</a>
					<a href="/board/adRewriteList">1:1문의</a>
				</div>

				<button class="dropdown-btn">
					<i class="fa fa-solid fa-bank"></i> &nbsp;펀딩관리 <i
						class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-container">
					<a href="/mempro/adProList1">프로젝트 승인</a> <a
						href="/mempro/adProList2">프로젝트 목록</a> <a
						href="/openbanking/useroauth">정산관리</a>
				</div>

				<button class="dropdown-btn">
					<i class="fa fa-solid fa-users"></i> &nbsp;회원관리 <i
						class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-container">
					<a href="/report/adRepListAll">신고접수관리</a> <a
						href="/mempro/adMemList">회원목록</a> <a href="/report/adBlackList">블랙리스트</a>
				</div>
			</div>
			<!-- 사이드바 -->

			<div class="container">
				<br> <br> <br> <br> <br> 

				<!-- 어드민 -->
				<h2 class="box-title" align="center">

					<b style="color: #6F7B63;">회원 리스트</b>
				</h2>
				<hr id="repSelector" align="center">
				<div class="col-xs-12" style="font-size: 16px;"><br><br>
					<div style="font-size: 1.7rem; cursor: pointer;" align="left" class="proList2">
						<span id="hov"> 
							<a id="listAll" style="color: #6F7B63; font-weight: bolder;">전체</a> 
							| 
							<a id="list2" style="color: #B6AD90">구매회원</a> 
							| 
							<a id="list3" style="color: #B6AD90">판매회원</a> 
							| 
							<a id="list4" style="color: #B6AD90">블랙리스트</a>
						</span>
						<hr id="repSelector1">	
					</div>
					<!-- 어드민 -->

					<!-- 검색기능 -->

					<div class="box" style="border-top: none;">
						<div class="box-header">
							<div class="box-tools" align="right">
								<div class="input-group input-group-sm hidden-xs"
									style="width: 380px; height: 35px;" id="search">
									<div class="searchselect">
									<select name="searchType">
										<option value="n"
											<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>카테고리</option>
										<option value="na"
											<c:out value="${scri.searchType eq 'na' ? 'selected' : ''}"/>>이름</option>
										<option value="m"
											<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>아이디</option>
									</select> 
									</div>
									<input type="text" name="keyword" id="keywordInput"
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
<div style="padding-top: 30px; padding-bottom: 30px;"></div>
						<!-- memAll -->
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0">
											<th
												style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center;">회원
												번호</th>
											<th
												style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center;">회원
												아이디</th>
											<th style="font-size: 15px;  text-align: center; color: #414934; font-weight: bold;">회원 이름</th>
											<th style="font-size: 15px;  text-align: center; color: #414934; font-weight: bold;">회원 연락처</th>
											<th style="font-size: 15px;  text-align: center; color: #414934; font-weight: bold;">회원 분류</th>
											<th style="font-size: 15px;  text-align: center; color: #414934; font-weight: bold;">블랙리스트</th>
											<th style="font-size: 15px;  text-align: center; color: #414934; font-weight: bold;">상세정보</th>
										</tr>

										<c:forEach var="memVO" items="${memList }" varStatus="status">
											<tr>
												<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO.mem_no }</td>
												<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO.mem_id }</td>
												<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO.mem_name }</td>
												<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO.mem_phone }</td>

												<!-- 회원분류 -->
												<c:choose>
													<c:when test="${memVO.mem_status == 0}">
														<td style="text-align: center; color: #414934; font-weight: bold;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">구매회원</button>
														</td>
													</c:when>
													<c:when test="${memVO.mem_status == 1}">
														<td style="text-align: center; color: #414934; font-weight: bold;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매회원</button>
														</td>
													</c:when>
													<c:when test="${memVO.mem_status == 3}">
														<td style="text-align: center; color: #414934; font-weight: bold;">
															<button type="button" class="btn btn-primary"
																style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">블랙리스트</button>
														</td>
													</c:when>
												</c:choose>


												<!-- 블랙리스트 여부 -->
												<c:choose>
													<c:when test="${not empty memVO.mem_bdate }">
														<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">Y</td>
													</c:when>
													<c:when test="${empty memVO.mem_bdate }">
														<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">N</td>
													</c:when>
												</c:choose>
												<td style="text-align: center; color: #414934; font-weight: bold;">
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
											<th
												style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												번호</th>
											<th
												style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												아이디</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 이름</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 분류</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">상세정보</th>
										</tr>

										<c:forEach var="memVO2" items="${memList }">
											<c:if test="${memVO2.mem_status == 0}">
												<tr>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO2.mem_no }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO2.mem_id }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO2.mem_name }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO2.mem_phone }</td>
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #B6AD90; border-color: #B6AD90;">구매회원</button>
													</td>
													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO2.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">Y</td>
														</c:when>
														<c:when test="${empty memVO2.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">N</td>
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
											<th
												style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												번호</th>
											<th
												style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												아이디</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 이름</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 분류</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">상세정보</th>
										</tr>

										<c:forEach var="memVO3" items="${memList }">
											<c:if test="${memVO3.mem_status == 1}">
												<tr>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO3.mem_no }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO3.mem_id }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO3.mem_name }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO3.mem_phone }</td>
													<!-- 													<td><span -->
													<!-- 														class="label label-info" style="font-size: 12px;">판매회원</span></td> -->
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #89A378; border-color: #89A378;">판매회원</button>
													</td>
													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO3.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">Y</td>
														</c:when>
														<c:when test="${empty memVO3.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">N</td>
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
											<th
												style="font-size: 15px; width: 10%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												번호</th>
											<th
												style="font-size: 15px; width: 15%; table-layout: fixed; text-align: center; color: #414934; font-weight: bold;">회원
												아이디</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 이름</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 연락처</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">회원 분류</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">블랙리스트</th>
											<th style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">상세정보</th>
										</tr>

										<c:forEach var="memVO4" items="${memList }" varStatus="status">
											<c:if test="${memVO4.mem_status == 3}">
												<tr>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO4.mem_no }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO4.mem_id }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO4.mem_name }</td>
													<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">${memVO4.mem_phone }</td>

													<!-- 													<td><span class="label label-warning" style="font-size: 12px;">블랙리스트</span></td> -->
													<td style="text-align: center;">
														<button type="button" class="btn btn-primary"
															style="font-size: 12px; background-color: #BFCC97; border-color: #BFCC97;">블랙리스트</button>
													</td>

													<!-- 블랙리스트 여부 -->
													<c:choose>
														<c:when test="${not empty memVO4.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">Y</td>
														</c:when>
														<c:when test="${empty memVO4.mem_bdate }">
															<td style="font-size: 15px; text-align: center; color: #414934; font-weight: bold;">N</td>
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
<div style="padding: 30px 30px;"></div>
					<!-- 페이징처리 -->
					<div class="pagination"
					style="position: relative ; left: 40%; bottom:0%; border: none;">
					<ul class="pagination" style="font-size: 18px;">
							<c:if test="${pvo.prev }">
								<li class="paging"><a
									href="adMemList${pvo.makeSearch(pvo.starPage-1) }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li class="paging"
									<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="adMemList${pvo.makeSearch(idx) }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li class="paging"><a
									href="adMemList${pvo.makeSearch(pvo.endPage+1) }">»</a></li>
								<!-- 11 -->
							</c:if>
						</ul>
					</div>
					<!-- 페이징처리 -->
				</div>
			</div>
		</div>
	</section>
   <div style="padding: 40px 40px;"></div>



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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#searchBtn').click(
				function() {
					self.location = "adMemList" + '${pvo.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val() + "&keyword="
							+ encodeURIComponent($('#keywordInput').val());
				});
	});
</script>
<!-- 검색기능 -->


<!-- 셀렉트 꾸미기 -->
<script type="text/javascript">
var x, i, j, l, ll, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("searchselect");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  /* For each element, create a new DIV that will act as the selected item: */
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /* For each element, create a new DIV that will contain the option list: */
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < ll; j++) {
    /* For each option in the original select element,
    create a new DIV that will act as an option item: */
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /* When an item is clicked, update the original select box,
        and the selected item: */
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
    /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
    e.stopPropagation();
    closeAllSelect(this);
    this.nextSibling.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });
}

function closeAllSelect(elmnt) {
  /* A function that will close all select boxes in the document,
  except the current select box: */
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);
</script> 


<!-- 드롭다운 -->
<script>
	/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
	var dropdown = document.getElementsByClassName("dropdown-btn");
	var i;

	for (i = 0; i < dropdown.length; i++) {
		dropdown[i].addEventListener("click", function() {
			this.classList.toggle("active1");
			var dropdownContent = this.nextElementSibling;
			if (dropdownContent.style.display === "block") {
				dropdownContent.style.display = "none";
			} else {
				dropdownContent.style.display = "block";
			}
		});
	}
</script>
<!-- 드롭다운 -->


</html>


