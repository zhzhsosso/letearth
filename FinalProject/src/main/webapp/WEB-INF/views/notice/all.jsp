<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	<section class="contact-form-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
<!--                         <span>test</span> -->
                        <h3 class="title">공지사항</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                	<h4>
                	<span><a href="/notice/main" style="color:black;">전체</a></span>
                	<span>      </span>
                	<span><a href="/notice/all" style="color:black;">공지사항</a></span>
                	<span>      </span>     
               		<span><a href="/notice/event" style="color:black;">이벤트</a></span></h4>
                <hr>
                <c:forEach var="vo" items="${noticeAllList }">   
                    <form id="contact-form" action="" method="">
                        <div class="conact-form-item">
                            <div class="row">
                            <div class="col-lg-6 col-md-6">
	                            
	                            <div>
                                    <span><p>
                                    [
	                                <c:choose>
									<c:when test="${vo.not_cat eq 1}">공지사항</c:when>
									<c:when test="${vo.not_cat eq 2}">이벤트</c:when>
									</c:choose>
									] 
                                    <a style="color:gray;" href="/notice/read?not_no=${vo.not_no }">${vo.not_title }</a></p>
                                    <fmt:formatDate value="${vo.not_date }" pattern="yyyy.MM.dd"/>
                                    </span>
                              		
<%--                               		<c:if test="${mem_id.equals('admin') }"> --%>
<!--                               		<span>수정 이거 어케하지 ㅠㅠ</span> -->
<%--                               		</c:if> --%>
                                </div>
        
                            </div>
                        </div>
                    </form>
                    <hr>
                    </c:forEach>
                    
                    
                    <div class="text-center">	
    			<ul>	
    			
<!--  스프링보드에서 가져온 코드인데 안나와서 아랫코드로 대체하고 주석처리 -->
<%-- 	   				<c:if test="${pvo.prev }"> --%>
<%-- 	                	<li style="display:inline-block; padding: 20px"><a href="/notice/all?page=${pvo.startPage-1 }">«</a></li> --%>
<%-- 	                </c:if> --%>
       
<!-- 	          page=1일때만 안보이는 이전페이지로 가는 코드부분 -->
	                <c:if test="${(pvo.cri.page-1) >= pvo.startPage }">
	                <li style="display:inline-block; padding: 20px"><a style="color:gray;" href="/notice/all?page=${pvo.cri.page-1 }">«</a></li>
	                </c:if>
	                
	                <c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
	               		<li
	               			<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 
	               		style="display:inline-block; padding: 20px"
	               		><a style="color:gray;" href="/notice/all?page=${idx }">${idx }</a></li>
	                </c:forEach>
	                
<!-- 	          page=4일때만 안보이는 이후페이지로 가는 코드부분 -->      
	                <c:if test="${(pvo.cri.page+1) <= pvo.endPage }">
	                <li style="display:inline-block; padding: 20px"><a style="color:gray;" href="/notice/all?page=${pvo.cri.page+1 }">»</a></li>
               		</c:if>
               		
<!--  스프링보드에서 가져온 코드인데 안나와서 윗코드로 대체하고 주석처리 -->	                
<%-- 	                <c:if test="${pvo.next }"> --%>
<%-- 	                	<li style="display:inline-block; padding: 20px"><a href="/notice/all?page=${pvo.endPage+1 }">»</a></li> --%>
<%-- 	                </c:if> --%>
	                
    			</ul>
    			</div>	
                
                <div class="input-box mt-20 text-right">   
                <c:if test="${mem_id.equals('admin') }">
                    <button type="button" class="main-btn" onClick="location.href='/notice/regist'">글 작성하기</button>
    			</c:if>
                    <p class="form-message"></p>
                </div>    
                    
                </div>
            </div>
        </div>
    </section>

	
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>