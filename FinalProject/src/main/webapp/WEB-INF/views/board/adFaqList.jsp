<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<%-- <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> --%>
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>LetEarth</title>
<style type="text/css">
.label {
    display: inline;
    padding: 0.2em 0.6em 0.3em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    color: #fff;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    border-radius: 0.25em;
}

#listBtn {
	position: relative;
	right: -92%;
	bottom : 70px;
	font-size: 15px;
}

#sbtn {
	position: absolute;
	top: 0px;
	
	background-color: #A4AC85;
	height: 35px;
}



#faqSelector{
   position: relative;
   top: -15px; 
}

/* On mouse-over */
.faqL a:hover {
  color: #ACCC97;
}

</style>

<!-- 사이드바 -->
<style type="text/css">
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
  padding-bottom : 100px;

  position: relative;
  top: 600px;
  left: 300px; 
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
</style>

<style type="text/css">
/*hover*/
#hov a:hover{
  color : green;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
  
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
   <%@ include file="../include/header.jsp" %>
   
   
   
   <section class="contact-form-area">
      <div style="display: flex;">
  
<!-- 사이드바 -->
<div class="sidenav">	
	<a href="/board/adMain">
	<i class="fa fa-solid fa-leaf"></i>
	<span style="position: relative; left: 2px; bottom: 3px; font-weight: bolder;">관리자메인</span>
	</a>
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-paper-plane"></i>
		&nbsp;고객센터 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/board/adNoticeList">공지사항</a> 
		<a href="/board/adFaqList">FAQ</a> 
		<a href="/board/adRewriteList">1:1문의</a>
	</div>
	
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-bank"></i>
		&nbsp;펀딩관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/mempro/adProList1">프로젝트 승인</a> 
		<a href="/mempro/adProList2">프로젝트 목록</a> 
		<a href="#">정산관리</a>
	</div>
	
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-users"></i>
		&nbsp;회원관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/report/adRepListAll">신고접수관리</a> 
		<a href="/mempro/adMemList">회원목록</a> 
		<a href="/report/adBlackList">블랙리스트</a>
	</div>
</div>
<!-- 사이드바 -->  
  

  
        <div class="container"> 
 	<br>
 	<br> 	<br>        	<br>               
   <!-- 어드민 -->	
   <div align="center"><img src="/resources/faq.jpg" width="80%" height="5%;"></div>	<br><br>
<!-- 						<h3 class="box-title" align="center">관리자 FAQ 리스트</h3> -->
			<div class="col-xs-12" style="font-size: 16px;"><br><br>
				<div style="font-size: 1.7rem; cursor: pointer;" align="left" class="faqL">
					<span id="hov"> 
					<a id="faqAll" style="">전체</a> 
					| 
					<a id="faqC">구매자</a>
					| 
					<a id="faqS">판매자</a> 
					| 
					<a id="faqSp">후원자</a>
					</span>
					<hr style="border-color: #A4AC85; position: relative; top: -10px;">
				</div>
					<button type="button" class="btn" id="listBtn" onclick="" style="background-color: #6F7B63; color: #F2F0E8;">FAQ글쓰기</button>
			<!-- 어드민 -->                                                      
<!-- 				<div class="box"> -->
					
					<div class="box-header">
						
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 200px; height: 50px;">
								<input type="text" name="keyword" class="form-control pull-right" placeholder="Search" 
									style="height: 35px; width: 60px; font-size: 1rem; border-color: #A4AC85; color:#B6AD90; border-radius:0.25rem; ">
								<div class="input-group-btn" style="padding-left: 3px;">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
<!-- faq1 -->			
		<div class="box-body table-responsive no-padding" id="faq1">
		<br>
		<i class="fa fa-question-circle fa-2x" style="color: #6F7B63;"></i>
		<span style="font-size: 1.5rem; font-weight: bolder; position: relative; bottom: 4px; left: 3px; color: #6F7B63;">
		 구매자
		</span>		
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<th style="padding: 0.6rem; width: 7%;">　</th>
									<th style="width : 45%; table-layout: fixed; padding: 0.6rem; text-align: center;">FAQ제목</th>
									<th style="padding: 0.6rem; text-align: center;">카테고리</th>
									<th style="padding: 0.6rem; text-align: center;">작성일</th>
									<th style="padding: 0.6rem; text-align: center;">조회수</th>
								</tr>
							
								<c:forEach var="vo1" items="${adFaqList }" varStatus="status1">
								<c:if test="${vo1.not_middle == 1}">
									<tr>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
										<input type="hidden" value="${status1.count }">
											<input type="hidden" name="not_no" value="${vo1.not_no }">
										</td>
										<td style="padding: 0.6rem; vertical-align:middle; color: #414934;">
											<a href="/board/adFaqRead?not_no=${vo1.not_no }" style="color: #6F7B63; font-weight: bold;"> ${vo1.not_title } </a>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
										<span class="label label-warning" style="background-color: #B6AD90;">구매자</span>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<fmt:formatDate value="${vo1.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
										<span>${vo1.not_viewcnt }</span>
										</td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
							
						</form>
				</div>
<!-- faq1 -->
<!-- faq2 -->
				<div class="box-body table-responsive no-padding" id="faq2">
				<br>
				<i class="fa fa-question-circle fa-2x" style="color: #6F7B63;"></i>
					<span style="font-size: 1.5rem; font-weight: bolder; position: relative; bottom: 4px; left: 3px; color: #6F7B63;">
					 후원자
					</span>	
				<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<tr style="background-color: #EDEAE0;">
									<th style="padding: 0.6rem; width: 7%;">　</th>
									<th style="width : 45%; table-layout: fixed; padding: 0.6rem; text-align: center;">FAQ제목</th>
									<th style="padding: 0.6rem; text-align: center;">카테고리</th>
									<th style="padding: 0.6rem; text-align: center;">작성일</th>
									<th style="padding: 0.6rem; text-align: center;">조회수</th>
								</tr>
								
								<c:forEach var="vo2" items="${adFaqList }" varStatus="status2">
								<c:if test="${vo2.not_middle == 2}">
									<tr>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
										<input type="hidden" value="${status2.count }">
											<input type="hidden" name="not_no" value="${vo2.not_no }">
										</td>
										<td style="padding: 0.6rem; vertical-align:middle; color: #414934;">
											<a href="/board/adFaqRead?not_no=${vo2.not_no }" style="color: #6F7B63; font-weight: bold;"> ${vo2.not_title } 　</a>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<span class="label label-warning" style="background-color: #89A378;">후원자</span>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<fmt:formatDate value="${vo2.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<span>${vo2.not_viewcnt }</span>
										</td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
					</form>
				</div>

<!-- faq2 -->
<!-- faq3 -->
			<div class="box-body table-responsive no-padding" id="faq3">
			<br>
			<i class="fa fa-question-circle fa-2x" style="color: #6F7B63;"></i>
			<span style="font-size: 1.5rem; font-weight: bolder; position: relative; bottom: 4px; left: 3px; color: #6F7B63;">
			 판매자
			</span>
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover" >
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<tr style="background-color: #EDEAE0;">
									<th style="padding: 0.6rem; width: 7%;">　</th>
									<th style="width : 45%; table-layout: fixed; padding: 0.6rem; text-align: center;">FAQ제목</th>
									<th style="padding: 0.6rem; text-align: center;">카테고리</th>
									<th style="padding: 0.6rem; text-align: center;">작성일</th>
									<th style="padding: 0.6rem; text-align: center;">조회수</th>
								</tr>
								<c:forEach var="vo3" items="${adFaqList }" varStatus="status3">
								<c:if test="${vo3.not_middle == 3}">
									<tr>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<input type="hidden" name="not_no" value="${vo3.not_no }">
											<input type="hidden" value="${status3.count }">
										</td>
										<td style="padding: 0.6rem; vertical-align:middle; color: #414934;">
											<a href="/board/adFaqRead?not_no=${vo3.not_no }" style="color: #6F7B63; font-weight: bold;"> ${vo3.not_title }</a>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<span class="label label-warning" style="background-color: #BFCC97;">판매자</span>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<fmt:formatDate value="${vo3.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td style="padding: 0.6rem; text-align: center; vertical-align:middle; color: #414934;">
											<span>${vo3.not_viewcnt }</span>
										</td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
					  </form>
					
			</div>
<!-- faq3 -->
<!-- 					</div> -->

<br><br>
<!-- 				</div> -->
		
			</div>

  
  </div>
  </div>    
  <br><br>
<!-- 페이징처리 -->
<div class="pagination" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination" style="font-size: 18px;">
			<c:if test="${pvo.prev }">
				<li class="paging"><a href="/board/adFaqList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li class="paging"				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/board/adFaqList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li class="paging"><a href="/board/adFaqList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
 </div> 
<!-- 페이징처리 -->	
</section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	
	
<script type="text/javascript">
	$("#listBtn").click(function(){
		location.href="/board/adFaqRegist";
	});
</script>


<!-- div숨기기 나타내기 -->
<script type="text/javascript">
	
$(document).ready(function(){
	$("#faqAll").css("color","#6F7B63");
	$("#faqAll").css("font-weight","bolder");
	$("#faqC").css("color","#B6AD90");
	$("#faqC").css("font-weight","normal");
	$("#faqS").css("color","#B6AD90");
	$("#faqS").css("font-weight","normal");
	$("#faqSp").css("color","#B6AD90");
	$("#faqSp").css("font-weight","normal");

	// 마우스 오버 시작
	$("#faqAll").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	});
	
	$("#faqC").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	}, function(){
		$(this).css('color', '#B6AD90'); // 마우스 논오버 시
		$(this).css('font-weight', 'normal'); 
	});
	
	$("#faqS").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	}, function(){
		$(this).css('color', '#B6AD90'); // 마우스 논오버 시
		$(this).css('font-weight', 'normal'); 
	});
	
	$("#faqSp").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	}, function(){
		$(this).css('color', '#B6AD90'); // 마우스 논오버 시
		$(this).css('font-weight', 'normal'); 
	});
	// 마우스오버끝
	
	
	$("#faqAll").click(function(){
		$("#faq1").show();
		$("#faq2").show();
		$("#faq3").show();
		
		$("#faqAll").css("color","#6F7B63");
		$("#faqAll").css("font-weight","bolder");
		$("#faqC").css("color","#B6AD90");
		$("#faqC").css("font-weight","normal");
		$("#faqS").css("color","#B6AD90");
		$("#faqS").css("font-weight","normal");
		$("#faqSp").css("color","#B6AD90");
		$("#faqSp").css("font-weight","normal");

		// 마우스 오버 시작
		$("#faqAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#faqC").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqS").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqSp").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		// 마우스오버끝

	});
	
	$("#faqC").click(function(){ // 구매자 1번
		$("#faq1").show();
		$("#faq2").hide();
		$("#faq3").hide();
		
		$("#faqC").css("color","#6F7B63");
		$("#faqC").css("font-weight","bolder");
		$("#faqAll").css("color","#B6AD90");
		$("#faqAll").css("font-weight","normal");
		$("#faqS").css("color","#B6AD90");
		$("#faqS").css("font-weight","normal");
		$("#faqSp").css("color","#B6AD90");
		$("#faqSp").css("font-weight","normal");

		// 마우스 오버 시작
		$("#faqC").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#faqAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqS").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqSp").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		// 마우스오버끝
		
	});
	
	$("#faqSp").click(function(){ // 후원자 2번
		$("#faq1").hide();
		$("#faq2").show();
		$("#faq3").hide();
		
		$("#faqSp").css("color","#6F7B63");
		$("#faqSp").css("font-weight","bolder");
		$("#faqAll").css("color","#B6AD90");
		$("#faqAll").css("font-weight","normal");
		$("#faqC").css("color","#B6AD90");
		$("#faqC").css("font-weight","normal");
		$("#faqS").css("color","#B6AD90");
		$("#faqS").css("font-weight","normal");

		// 마우스 오버 시작
		$("#faqSp").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#faqAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqC").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqS").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		// 마우스오버끝
	});
	
	$("#faqS").click(function(){ // 판매자 3번
		$("#faq1").hide();
		$("#faq2").hide();
		$("#faq3").show();
		
		$("#faqS").css("color","#6F7B63");
		$("#faqS").css("font-weight","bolder");
		$("#faqAll").css("color","#B6AD90");
		$("#faqAll").css("font-weight","normal");
		$("#faqC").css("color","#B6AD90");
		$("#faqC").css("font-weight","normal");
		$("#faqSp").css("color","#B6AD90");
		$("#faqSp").css("font-weight","normal");

		// 마우스 오버 시작
		$("#faqS").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#faqAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqC").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#faqSp").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		// 마우스오버끝
	});
});
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