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
	top: -4px;
}

hr {
  width : 70px;
  height : 30px;
  background-color : #9dd84b;
  border : 0;
}

</style>
</head>
<body>   
   <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
   
   
   
   <section class="contact-form-area">
        <div class="container"> 
 	<br>
 	<br>        
   <!-- 어드민 -->	
   <div align="center"><img src="/resources/faqPage.png" width="50%"></div>	
<!-- 						<h3 class="box-title" align="center">관리자 FAQ 리스트</h3> -->
			<div class="col-xs-12"><br><br><br>
				<div style="font-size: 2rem;" align="center">
					<span> 
					<a id="faqAll">전체</a> 
					| 
					<a id="faqC">구매자</a>
					| 
					<a id="faqS">판매자</a> 
					| 
					<a id="faqSp">후원자</a>
					</span>
					<hr id="faqSelector">	
				</div>
					<button type="button" class="btn bg-green" id="listBtn" onclick="">FAQ글쓰기</button>
			<!-- 어드민 -->                                                      
<!-- 				<div class="box"> -->
					<br>
					<div class="box-header">
						<br><br>
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

<!-- faq1 -->					
		<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq1">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>글번호</th>
									<th>FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="vo1" items="${adFaqList }" varStatus="status1">
								<c:if test="${vo1.not_middle == 1}">
									<tr>
										<td >
											${status1.count }
											<input type="hidden" value="${vo1.not_no }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo1.not_no }" style="color: green"> ${vo1.not_title } </a>
										</td>
										<td><span class="label label-success" >구매자</span></td>
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
<br><br>
<!-- faq2 -->
				<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq2">
				<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>글번호</th>
									<th>FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="vo2" items="${adFaqList }" varStatus="status2">
								<c:if test="${vo2.not_middle == 2}">
									<tr>
										<td >
											${status2.count }
											<input type="hidden" value="${vo2.not_no }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo2.not_no }" style="color: green"> ${vo2.not_title } </a>
										</td>
										<td><span class="label label-info">후원자</span></td>
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
<br><br>
<!-- faq3 -->
			<div class="box-body table-responsive no-padding" style="font-size: 1.5rem;" id="faq3">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover" >
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>글번호</th>
									<th>FAQ제목</th>
									<th>카테고리</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:forEach var="vo3" items="${adFaqList }" varStatus="status3">
								<c:if test="${vo3.not_middle == 3}">
									<tr>
										<td >
											${status3.count }
											<input type="hidden" value="${vo3.not_no }">
										</td>
										<td>
											<a href="/board/adFaqRead?not_no=${vo3.not_no }" style="color: green"> ${vo3.not_title } </a>
										</td>
										<td><span class="label label-warning">판매자</span></td>
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

<!-- 페이징처리 -->
<div class="box-footer clearfix" id="paging">
		<ul class="pagination pagination-sm no-margin pull-left">
			<c:if test="${pvo.prev }">
				<li><a href="/board/adFaqList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
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
  </div>    
</section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   	<script type="text/javascript">
		var result = '${result}';
		if(result == '등록완'){
			alert("글쓰기 완료!");
		}
		
		if(result == '수정완'){
			alert("글 수정 완료!");
		}
		
		if(result == '삭제완'){
			alert("글 삭제 완료!");
		}
		
</script>
	
	
<script type="text/javascript">
	$("#listBtn").click(function(){
		location.href="/board/adFaqRegist";
	});
</script>


<!-- div숨기기 나타내기 -->
<script type="text/javascript">
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
	
</script>

</html>