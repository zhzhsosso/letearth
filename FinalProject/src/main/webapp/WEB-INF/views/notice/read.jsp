<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	

	
	<section class="contact-form-area">
	
	<!-- 수정,삭제 bno정보를 전달하는 폼태그 -->
    <form role="form" method="post">
        <input type="hidden" name="not_no" value="${vo.not_no }">  
    </form>
    
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>test</span>
                        <h3 class="title">READ</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                	<h4>
                	<span><a href="/notice/main">전체</a></span>
                	<span>      </span>
                	<span><a href="/notice/all">공지사항</a></span>
                	<span>      </span>     
               		<span><a href="/notice/event">이벤트</a></span></h4>
                <hr>

                        <div class="conact-form-item">
                            <div class="row">
                            <div class="col-lg-6 col-md-6">
	                            
	                            <h4>
	                            [
                                <c:choose>
								<c:when test="${vo.not_cat eq 1}">공지사항</c:when>
								<c:when test="${vo.not_cat eq 2}">이벤트</c:when>
								</c:choose>
								] 
	                             ${vo.not_title }</h4>
	                            <p Align="right"><fmt:formatDate value="${vo.not_date }" pattern="yyyy.MM.dd"/></p>
                           		<br>
                           		${vo.not_content }
                           		<br> <br> <br>
                           		첨부파일 : ${vo.not_file }
                           		<br>
        
                            </div>
                        </div>
                        
                        <div class="input-box mt-20 text-center">
<%--                         <c:if test="${mem_id.equals('admin') }"> --%>
                            <button class="main-btn mo" type="submit">수정하기</button>
                            <button class="main-btn de" type="submit">삭제하기</button>
<%--                         </c:if> --%>
                            <button class="main-btn ma" type="submit">목록으로</button>
                        </div>
                        
                    <hr>

                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
 $(document).ready(function(){
	 var formObj = $("form[role='form']");
	 //console.log(formObj);
	 
	 // 수정버튼 (bno 가지고 submit-/board/modify)
	 $(".mo").click(function(){
		 formObj.attr("action","/notice/modify");
		 formObj.attr("method","get");
		 formObj.submit();
	 });
	 
	 // 삭제 버튼 (bno 가지고 submit-/board/remove)
	 $(".de").click(function(){
		 // 바로 삭제동작 -> POST
		 formObj.attr("action","/notice/remove");
		 formObj.submit();		 
	 });
	
	 $(".ma").click(function(){
		 // 목록으로 이동
		 location.href="/notice/main";
	 });
	 
 });

</script>



















	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>