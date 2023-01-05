<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>

<style type="text/css">

#repSelector {
  width : 15%;
  height : 3px;
  background-color : #BBE093;
  border : 0;
  
   position: relative;
   top: -15px; 
/*    left: 380px;  */
   left: 42.5%;
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
   <div style="display: flex;">
   <%@ include file="../include/adSide.jsp" %>	
   
        <div class="container">
        
        
    <br>
 	<br>        
 	<br>        
   <!-- 어드민 -->		
						<h2 class="box-title" align="center"><b style="color: #6c757d;"> 관리자 1:1 문의 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12"><br><br>
				<div style="font-size: 1.5rem;" align="left">
					
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
					<input type="hidden" name="not_re_lev" value="${vo.not_re_lev }">
					<input type="hidden" name="not_re_ref" value="${vo.not_re_ref }">
					<input type="hidden" name="not_re_seq" value="${vo.not_re_seq }">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #f8f9fa">
									<th>글번호</th>
									<th>1:1문의 제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>관리</th>
								</tr>
				<c:forEach var="vo" items="${adRewriteList }" varStatus="status">
								<tr>
									<td>
									${status.count }
									<input type="hidden" name="not_no" value="${vo.not_no }">
									</td>
									<td> <!-- 문의제목 -->
										<c:if test="${vo.not_re_lev > 0 }">
											<img src="/resources/level.gif" width="${vo.not_re_lev*10 }">
											<img src="/resources/re.gif">
										</c:if>															
										<a href="/board/adRewriteRead?not_no=${vo.not_no }" style="color: gray;"> ${vo.not_title } </a>
									</td><!-- /문의제목 -->
									<td>
									${vo.mem_id }
									<c:if test="${vo.not_middle == 4 }">
									관리자
									</c:if>
									</td>
									<td>
										<fmt:formatDate value="${vo.not_date }" pattern="yy-MM-dd"/>
									</td>
									<td>${vo.not_viewcnt }</td>
									<td>
										<c:if test="${vo.not_middle != 4 }">													
											<a href="/board/adRewriteRegist?not_no=${vo.not_no }" style="color: #8FC951;"> 답글 </a>
											/
										</c:if>
											<a href="/board/adRewriteRemove?not_no=${vo.not_no }" style="color: #8FC951;"> 삭제 </a>
									</td>
								</tr>
								</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableAll -->        
                                     
                </div>
            </div>
        <!-- 페이징처리 -->
	<div class="box-footer clearfix" id="paging">
		<ul class="pagination pagination-sm no-margin pull-left">
			<c:if test="${pvo.prev }">
				<li><a href="/board/adRewriteList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<li 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/board/adRewriteList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li><a href="/board/adRewriteList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
	</div>
        </div>
     </div>   
    </section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>

   	<script type="text/javascript">
		var result = '${result}';
		if(result == '등록완'){
			alert("답글쓰기 완료!");
		}
		
		if(result == '수정완'){
			alert("답글수정 완료!");
		}
		
		if(result == '삭제완'){
			alert("답글삭제 완료!");
		}
		
</script>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
function deleteRewrite(){
	 Swal.fire({ 
        title: '정말 삭제하시겠습니까?', 
        icon: 'warning', 
        html: "<h6>삭제 시 복구되지 않습니다.</h6><h5>메인페이지로 이동합니다.</h5>",
        showCancelButton: true,         
        confirmButtonColor: '#3085d6', 
        cancelButtonColor: 'grey', 
        confirmButtonText: '삭제하기', 
        cancelButtonText: '머무르기' 
      }).then((result) => { 
        if (result.isConfirmed) {           
             //"취소하기" 버튼을 눌렀을 때 호출할 함수
       	 location.href="/board/adRewriteRemove?not_no="+${vo.not_no };
        } 
      }) 
   } 	
</script>
	
</html>