<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.showId {
    text-align: center;
    height: 120px;
    margin-top: 40px;
}
.showId p {
    font-size: 20px;
    color: #414934;
}

</style>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	
    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
        	<div class="section-title text-center" style="padding-bottom: 10px;">
                  <span>가입하셨던 이름과 이메일을 입력해주세요!</span>
            </div>
            
            <div class="showId">
            	<p>회원님의 아이디는 </p>
            	<p style="color: #6F7B63;">${id}</p>
            	<p>입니다.</p>
            </div>
                
            <div style="text-align: center;">
            	<input type="button" value="로그인 하러 가기" onclick="location.href='/member/login'" style="background: #A4AC85; color: #414934; border: 0px; width: 180px; height: 60px; cursor: pointer;">
            	<input type="button" value="비밀번호 찾기" onclick="location.href='/member/findPw'" style="background: #A4AC85; color: #414934; border: 0px; width: 180px; height: 60px; cursor: pointer;">
            </div>    
        </div>
    </section>

	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	
