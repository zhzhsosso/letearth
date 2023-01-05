<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

		<section class="contact-form-area">
    
    <!-- 수정,삭제 bno정보를 전달하는 폼태그 -->
    <form role="form" method="post">
    
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>test</span>
                        <h3 class="title">수정하기</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    
                        <div class="conact-form-item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" value="${vo.not_title }" name="not_title">
                                    </div>
                                </div>


							<select name="not_cat" id="not_cat">
								 <option value="${not_cat }" ${not_cat == 'vo.not_cat' ? 'selected="selected"' : '' } disabled>카테고리 선택</option>
									<c:choose>
										<c:when test="${vo.not_cat eq 1}">
											<option value="1" selected>공지사항</option>
											<option value="2">이벤트</option>
										</c:when>
										<c:when test="${vo.not_cat eq 2}">
											<option value="1">공지사항</option>
											<option value="2" selected>이벤트</option>
											
										</c:when>
									</c:choose>
							</select>

                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                        <input type="text" value="${vo.not_content }" name="not_content">
                                    </div>
                                    <div class="input-box mt-20 text-center">
                                    
                                    
                                    
                              
                                        <button class="main-btn mo" type="submit">수정하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>
    
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
 $(document).ready(function(){
	
	 $(".mo").click(function(){
		 // 목록으로 이동
// 		 location.href="/notice/main";
		 location.href="/notice/read?not_no=${vo.not_no}";
	 });
	 
 });

</script>




	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>