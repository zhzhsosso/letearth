<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	
	
	<!--====== FORM PART START ======-->

    
    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <h3 class="title">Find PW</h3>
                    </div>
                </div>
            </div>
            
            <div class="section-title text-center">
                  <span>비밀번호를 변경해주세요</span>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                
                    <form id="contact-form" action="/member/findPwAfter" method="post">
                        <div class="conact-form-item">
                            <div class="row" style="flex-direction: column; align-items: center;">
                            	<div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="아이디 입력해주세요" name="mem_id">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="새 비밀번호를 입력해주세요" name="mem_pw">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="새 비밀번호를 다시 한 번 입력해주세요" name="mem_pw2">
                                    </div>
                                </div>
                                
                                <div class="input-box mt-20 text-center">
            						<button class="main-btn" type="submit">비밀번호 변경</button>
                                </div>
                                </div>

                            </div>
                            </form>
                        </div>


                </div>
                
              
        </div>

    </section>
    
    <!--====== FORM PART ENDS ======-->
	
	
	
	
	
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	
