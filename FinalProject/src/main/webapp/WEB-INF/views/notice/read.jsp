<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

<!-- 마우스오버 -->
 <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
    $(document).ready(function () 
    {
        $('.ho').hover(function(){
            $(this).css('color','#a4ac85');
        }, function() {
            $(this).css('color','gray');
        });
    });
</script>
	
	<section class="contact-form-area">
	
	<!-- 수정,삭제 bno정보를 전달하는 폼태그 -->
    <form role="form" method="post">
        <input type="hidden" name="not_no" value="${vo.not_no }">  
    </form>
    
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
<!--                         <span>test</span> -->
<!--                         <h3 style="font-weight: bolder;"> -->
<%--                         		<c:choose> --%>
<%-- 								<c:when test="${vo.not_cat eq 1}">공지사항</c:when> --%>
<%-- 								<c:when test="${vo.not_cat eq 2}">이벤트</c:when> --%>
<%-- 								</c:choose></h3> --%>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                	<h4 style="color:gray; font-size: 1.5rem; position: relative; bottom: 6px; left: 3px; margin-right:5px; color:gray;">
                	<span style="font-weight: bolder;">
                		<a class="ho"href="/notice/main" style="color:gray;">전체</a></span>
                	<span>|</span>
                	
                	<c:choose>
                	<c:when test="${vo.not_cat eq 1}">
                	<span style="font-weight: bolder;">
                		<a href="/notice/all" style="color:#a4ac85;">공지사항</a></span> </c:when>
                	<c:when test="${vo.not_cat eq 2}">
                	<span style="font-weight: bolder;">
                		<a class="ho" href="/notice/all" style="color:gray;">공지사항</a></span> </c:when>
                	</c:choose>
                		
                	<span>|</span>  
                	   
                	<c:choose>
               		<c:when test="${vo.not_cat eq 1}">
               		<span style="font-weight: bolder;">
               			<a class="ho" href="/notice/event"  style="color:gray;">이벤트</a></span></h4> </c:when>
               		<c:when test="${vo.not_cat eq 2}">
               		<span style="font-weight: bolder;">
               			<a href="/notice/event"  style="color:#a4ac85;">이벤트</a></span></h4> </c:when>
           			</c:choose>
                <hr>

                        <div class="conact-form-item">
                            <div class="row">
                            <div class="col-lg col-md">
	                            
	                            <h4 style="color:#414934;">
	                            [
                                <c:choose>
								<c:when test="${vo.not_cat eq 1}"><a style="color:#6f7b63; font-weight: bolder;">공지사항</a></c:when>
								<c:when test="${vo.not_cat eq 2}"><a style="color:#b6ad90; font-weight: bolder;">이벤트</a></c:when>
								</c:choose>
								] 
	                            <a style="color:#262626;"> ${vo.not_title }</a></h4>

                            </div>
                        </div>
                        
                        <p Align="right"><fmt:formatDate value="${vo.not_date }" pattern="yyyy.MM.dd"/></p>
                   		<br>
                   		<a style="color:#262626;">
                   		${vo.not_content }</a>
                   		<br> <br> <br>

                        
                        <div class="input-box mt-20 text-center">
                        <c:if test="${mem_id.equals('admin') }">
                            <button class="mo" style="color:#fff; background:#6f7b63; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;" type="submit">수정하기</button>
                            <button class="de" style="color:#fff; background:#6f7b63; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;" type="submit">삭제하기</button>
                        </c:if>
                            <button class="ma" style="color:#fff; background:#6f7b63; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;" type="submit">목록으로</button>
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