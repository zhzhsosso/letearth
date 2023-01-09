<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>FAQ</title>
<style type="text/css">
#listBtn {
	position: absolute;
	right: 17px;
	top: 40px;
	font-size: 15px;
}

#sbtn {
	position: absolute;
	top: 0px;
	
	background-color: #BFCC97;
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
  background-color: #EEF6E6;
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


/* Add an active class to the active dropdown button */
.active1 {
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
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #89A378;
    border-color: #89A378;
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
		<a href="/report/adRepList">신고접수관리</a> 
		<a href="/mempro/adMemList">회원목록</a> 
		<a href="/report/adBlackList">블랙리스트</a>
	</div>
</div>
<!-- 사이드바 -->  
  
  
  
  
  
        <div class="container"> 
 	<br>
 	<br>        
   <!-- 어드민 -->	
   <div align="center"><img src="/resources/faqPage.png" width="50%"></div>	
<!-- 						<h3 class="box-title" align="center">관리자 FAQ 리스트</h3> -->
			<div class="col-xs-12"><br><br><br>
				<div style="font-size: 2.5rem; cursor: pointer;" align="left" class="faqL">
					<span id="hov"> 
					<a id="faqAll" style="">전체</a> 
					| 
					<a id="faqC">구매자</a>
					| 
					<a id="faqS">판매자</a> 
					| 
					<a id="faqSp">후원자</a>
					</span>
					<hr>
				</div>
					<button type="button" class="btn" id="listBtn" onclick="" style="background-color: #C3DAB4; color: white;">FAQ글쓰기</button>
			<!-- 어드민 -->                                                      
<!-- 				<div class="box"> -->
					<br>
					<div class="box-header">
						<br><br>
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 200px; height: 50px;">
								<input type="text" name="table_search"
									class="form-control pull-right" placeholder="Search" style="height: 30px; font-size: 1.5rem;">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
		<br>
<!-- faq1 -->			
		<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq1">
		<br>
		<i class="fa fa-question-circle fa-2x"></i>
		<span style="font-size: 2rem; font-weight: bolder; position: relative; bottom: 6px; left: 3px;">
		 구매자
		</span>		
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EEF5E6;">
									<th>　</th>
									<th style="width : 45%; table-layout: fixed;">FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							
								<c:forEach var="vo1" items="${adFaqList }" varStatus="status1">
								<c:if test="${vo1.not_middle == 1}">
									<tr>
										<td >
										<input type="hidden" value="${status1.count }">
											<input type="hidden" name="not_no" value="${vo1.not_no }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo1.not_no }" style="color: green"> ${vo1.not_title } </a>
										</td>
										<td><span class="label label-warning" style="background-color: #C3DAB4;">구매자</span></td>
										<td>
											<fmt:formatDate value="${vo1.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td><span>${vo1.not_viewcnt }</span></td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
							
						</form>
				</div>
<!-- faq1 -->
<br>
<!-- faq2 -->
				<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq2">
				<i class="fa fa-question-circle fa-2x"></i>
					<span style="font-size: 2rem; font-weight: bolder; position: relative; bottom: 6px; left: 3px;">
					 후원자
					</span>	
				<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EEF5E6;">
									<th>　</th>
									<th style="width : 45%; table-layout: fixed;">FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="vo2" items="${adFaqList }" varStatus="status2">
								<c:if test="${vo2.not_middle == 2}">
									<tr>
										<td >
										<input type="hidden" value="${status2.count }">
											<input type="hidden" name="not_no" value="${vo2.not_no }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo2.not_no }" style="color: green"> ${vo2.not_title } 　</a>
										</td>
										<td><span class="label label-warning" style="background-color: #89A378;">후원자</span></td>
										<td>
											<fmt:formatDate value="${vo2.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td><span>${vo2.not_viewcnt }</span></td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
					</form>
				</div>

<!-- faq2 -->
<br>
<!-- faq3 -->
			<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq3">
			<i class="fa fa-question-circle fa-2x"></i>
			<span style="font-size: 2rem; font-weight: bolder; position: relative; bottom: 6px; left: 3px;">
			 판매자
			</span>
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover" >
							<tbody>
								<tr style="background-color: #EEF5E6;">
									<th>　</th>
									<th style="width : 45%; table-layout: fixed;">FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="vo3" items="${adFaqList }" varStatus="status3">
								<c:if test="${vo3.not_middle == 3}">
									<tr>
										<td >
											<input type="hidden" name="not_no" value="${vo3.not_no }">
											<input type="hidden" value="${status3.count }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo3.not_no }" style="color: green"> ${vo3.not_title }</a>
										</td>
										<td><span class="label label-warning" style="background-color: #BFCC97;">판매자</span></td>
										<td>
											<fmt:formatDate value="${vo3.not_date }" pattern="yy-MM-dd"/>
										</td>
										<td><span>${vo3.not_viewcnt }</span></td>
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
<div class="box-footer clearfix" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination pagination-sm no-margin pull-center">
			<c:if test="${pvo.prev }">
				<li><a href="/board/adFaqList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/board/adFaqList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li><a href="/board/adFaqList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
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
	$("#faqAll").css("color","green");
	$("#faqAll").css("font-weight","bolder");
	
	$("#faqAll").click(function(){
		$("#faq1").show();
		$("#faq2").show();
		$("#faq3").show();
		
		$("#faqAll").css("color","green");
		$("#faqAll").css("font-weight","bolder");
		$("#faqC").css("color","grey");
		$("#faqC").css("font-weight","normal");
		$("#faqS").css("color","grey");
		$("#faqS").css("font-weight","normal");
		$("#faqSp").css("color","grey");
		$("#faqSp").css("font-weight","normal");

	});
	
	$("#faqC").click(function(){ // 구매자 1번
		$("#faq1").show();
		$("#faq2").hide();
		$("#faq3").hide();
		
		$("#faqC").css("color","green");
		$("#faqC").css("font-weight","bolder");
		$("#faqAll").css("color","grey");
		$("#faqAll").css("font-weight","normal");
		$("#faqS").css("color","grey");
		$("#faqS").css("font-weight","normal");
		$("#faqSp").css("color","grey");
		$("#faqSp").css("font-weight","normal");
	});
	
	$("#faqSp").click(function(){ // 후원자 2번
		$("#faq1").hide();
		$("#faq2").show();
		$("#faq3").hide();
		
		$("#faqSp").css("color","green");
		$("#faqSp").css("font-weight","bolder");
		$("#faqC").css("color","grey");
		$("#faqC").css("font-weight","normal");
		$("#faqAll").css("color","grey");
		$("#faqAll").css("font-weight","normal");
		$("#faqS").css("color","grey");
		$("#faqS").css("font-weight","normal");
	});
	
	$("#faqS").click(function(){ // 판매자 3번
		$("#faq1").hide();
		$("#faq2").hide();
		$("#faq3").show();
		
		$("#faqS").css("color","green");
		$("#faqS").css("font-weight","bolder");
		$("#faqC").css("color","grey");
		$("#faqC").css("font-weight","normal");
		$("#faqAll").css("color","grey");
		$("#faqAll").css("font-weight","normal");
		$("#faqSp").css("color","grey");
		$("#faqSp").css("font-weight","normal");
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