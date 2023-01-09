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
                        <h3 class="title">관리자 공지사항/이벤트 글쓰기</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">

                        <div class="conact-form-item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="제목을 입력하세요" name="not_title">
                                    </div>
                                </div>
                               	
                               	<select name="not_cat" id="not_cat">
<%-- 								 <option value="${not_cat }" ${not_cat == 'vo.not_cat' ? 'selected="selected"' : '' } disabled>선택</option> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${vo.not_cat eq 1}"> --%>
											<option value="">카테고리 선택</option>
											<option value="1">공지사항</option>
											<option value="2">이벤트</option>
<%-- 										</c:when> --%>
<%-- 										<c:when test="${vo.not_cat eq 2}"> --%>
<!-- 											<option value="1">공지사항</option> -->
<!-- 											<option value="2" selected>이벤트</option> -->
											
<%-- 										</c:when> --%>
<%-- 									</c:choose> --%>
								</select>

                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                        <textarea id="not_content" cols="30" rows="10" placeholder="글 내용을 입력하세요" name="not_content"></textarea>
                                    </div>
                                    <div class="input-box mt-20 text-center">
                                        <button class="main-btn" type="submit">작성하기</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>

	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>