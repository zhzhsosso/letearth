<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	
	
	<!--====== FORM PART START ======-->
  <h1>findIDAfter</h1>
  
    
    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <h3 class="title">Find ID</h3>
                    </div>
                </div>
            </div>
            
            <div class="section-title text-center">
                  <span>가입하셨던 이름과 이메일을 입력해주세요!</span>
            </div>
            
            <div>
            	<p>회원님의 아이디는 </p>
            	<p>${id}입니다.</p>
            </div>
                
                
            <div>
            	<input type="button" value="로그인 하러 가기" onclick="location.href='/member/login'">
            	<input type="button" value="비밀번호 찾기" onclick="location.href='/member/findPw'">
            </div>    
        </div>

    </section>
    
    <!--====== FORM PART ENDS ======-->
	
	
	
	
	
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	
