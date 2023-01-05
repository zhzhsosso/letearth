<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>


<style type="text/css">

#repSelector {
  width : 20%;
  height : 3px;
  background-color : #BBE093;
  border : 0;
  
   position: relative;
   top: -15px; 
/*    left: 380px;  */
   left: 40%;
}

#repSelector1{
   position: relative;
   top: -15px; 
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
 	<br>        
   <!-- 어드민 -->		
						<h2 class="box-title" align="center"><b style="color: #6c757d;"> 관리자 신고접수 목록 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12"><br><br>
				<div style="font-size: 1.5rem;" align="left">
					<a id="listAll">전체</a> 
					| 
					<a id="listMem">회원</a>
					| 
					<a id="listPro">프로젝트</a>
					<hr id="repSelector1">	
				</div>
					
			<!-- 어드민 -->                                                      
				<div class="box">
					<div class="box-header">
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px;">
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
<!-- tableAll -->
					<div class="box-body table-responsive no-padding" id="tableAll">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo1" items="${adRepList }" varStatus="vs1">
												<tr>
													<td>
													<input type="hidden" id="rep_no" value="${vo1.rep_no }">
													${vo1.rep_no }
													</td>
													<td>${vo1.reper_id }</td>
													<td>
														<c:if test="${vo1.rep_cat == 1}">회원</c:if>
														<c:if test="${vo1.rep_cat == 2}">프로젝트</c:if>
													</td>													
													<td>${vo1.reped_id }</td>
													<td>
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo1.rep_reason }
													</td>
													<td>
														<fmt:formatDate value="${vo1.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${vo1.rep_status }</td>
													<td>
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs1.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs1.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo1.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo1.rep_cat }&pro_no=${vo1.pro_no }&reped_id=${vo1.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableAll -->
<!-- tableMem -->
					<div class="box-body table-responsive no-padding" id="tableMem">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo2" items="${adRepList }" varStatus="vs2">
								<c:if test="${vo2.rep_cat == 1}">
												<tr>
													<td>
													<input type="hidden" id="rep_no" value="${vo2.rep_no }">
													${vo2.rep_no }
													</td>
													<td>${vo2.reper_id }</td>
													<td> 회원 </td>													
													<td>${vo2.reped_id }</td>
													<td>
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo2.rep_reason }
													</td>
													<td>
														<fmt:formatDate value="${vo2.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${vo2.rep_status }</td>
													<td>
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs2.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs2.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo2.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo2.rep_cat }&pro_no=${vo2.pro_no }&reped_id=${vo2.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:if>
												</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableMem -->
<!-- tablePro -->
					<div class="box-body table-responsive no-padding" id="tablePro">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo3" items="${adRepList }" varStatus="vs3">
								<c:if test="${vo3.rep_cat == 2}">
												<tr>
													<td>
													<input type="hidden" id="rep_no" value="${vo3.rep_no }">
													${vo3.rep_no }
													</td>
													<td>${vo3.reper_id }</td>
													<td> 프로젝트 </td>													
													<td>${vo3.reped_id }</td>
													<td>
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo3.rep_reason }
													</td>
													<td>
														<fmt:formatDate value="${vo3.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${vo3.rep_status }</td>
													<td>
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs3.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs3.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo3.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo3.rep_cat }&pro_no=${vo3.pro_no }&reped_id=${vo3.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:if>
												</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tablPro -->

				</div>
			</div>

<!-- 페이징처리 -->
	<div class="box-footer clearfix" id="paging">
		<ul class="pagination pagination-sm no-margin pull-left">
			<c:if test="${pvo.prev }">
				<li><a href="/report/adRepList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/report/adRepList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li><a href="/report/adRepList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
	</div>
	
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
$(document).ready(function(){
	  
	$("#tableAll").show();
	$("#tableMem").hide();
	$("#tablePro").hide();
	
	$("#listAll").css("color","green");
	$("#listAll").css("font-weight","bolder");

	$("#listAll").click(function(){
		$("#tableAll").show();
		$("#tableMem").hide();
		$("#tablePro").hide();
		
		$("#listAll").css("color","green");
		$("#listAll").css("font-weight","bolder");
		$("#listMem").css("color","grey");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","grey");
		$("#listPro").css("font-weight","normal");

	});
	
	$("#listMem").click(function(){
		$("#tableAll").hide();
		$("#tableMem").show();
		$("#tablePro").hide()
		
		$("#listAll").css("color","grey");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","green");
		$("#listMem").css("font-weight","bolder");
		$("#listPro").css("color","grey");
		$("#listPro").css("font-weight","normal");
	});
	
	$("#listPro").click(function(){
		$("#tableAll").hide();
		$("#tableMem").hide();
		$("#tablePro").show();
		
		$("#listAll").css("color","grey");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","grey");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","green");
		$("#listPro").css("font-weight","bolder");
	});
});
</script>

	
</html>