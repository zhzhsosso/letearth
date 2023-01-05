<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>   
   <!-- 헤더 -->
   <%@ include file="/WEB-INF/views/include/header.jsp" %>
   
   
   <section class="contact-form-area">
        <div class="container">
            <div class="row justify-content-center">         
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <h3 class="title">관리자 FAQ 작성</h3>
   		 <div class="box-footer" align="center">
             <button type="button" class="btn btn-danger" id="listBtn" onclick="">FAQ글쓰기</button>
         </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form role="form" name="fr" id="contact-form" action="" method="post">
<!--                         <div class="conact-form-item"> -->
<!--                             <div class="row"> -->
<!--                                 <div class="col-lg-6 col-md-6"> -->
<!--                                     <div class="input-box mt-20"> -->
                                    <table border="1">
											<tbody>
												<tr>
													<th>글번호</th>
													<th>FAQ제목</th>
													<th>카테고리</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
												
												<c:forEach var="vo" items="${adFaqList }">
												<tr>
													<td>${vo.not_no }</td>
													<td>
														<a href="/board/adFaqRead?not_no=${vo.not_no }"> ${vo.not_title } </a>
													</td>
													<td>
													<c:choose>
														<c:when test="${vo.not_middle == 1}">구매자</c:when>
														<c:when test="${vo.not_middle == 2}">후원자</c:when>
														<c:when test="${vo.not_middle == 3}">판매자</c:when>
													</c:choose>													
													</td>
													<td>
														<fmt:formatDate value="${vo.not_date }" pattern="yy-MM-dd"/>
													</td>
													<td><span>${vo.not_viewcnt }</span></td>
												</tr>
												</c:forEach>				
											</tbody> 
										</table>                                                                  
<!--                                     </div> -->
<!--                                 </div> -->
                               
 
<!--                             </div> -->
<!--                         </div> -->
                    </form>
                    <p class="form-message"></p>
        <!-- 페이징처리 -->
  <div>
		<ul>
		
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
                </div>
            </div>
        </div>
        
    </section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
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
</html>