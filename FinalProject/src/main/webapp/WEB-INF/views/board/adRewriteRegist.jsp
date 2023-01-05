<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
   
   <img alt="" src="/resources/main_construction.png">
   <section class="contact-form-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <h3 class="title">관리자 1:1문의 답글 작성</h3>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form name="fr" id="contact-form" method="post">
                    <input type="text" name="not_no" value="${param.not_no }">
                    
                        <div class="conact-form-item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        제목 : <input type="text" name="not_title" value="[관리자] " id="not_title">
                                    </div>
                                </div>
                               
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                       카테고리 : <br>
                                       <select name="not_middle" id="not_middle">
                                       		<option value="4" selected>관리자</option>									  
									   	</select>
                                    </div>
                                </div>
                                
                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                       내용 : <textarea id="not_reply" cols="30" rows="10" placeholder="내용을 입력하세요" name="not_reply"></textarea>
                                    </div>
                                    
                                    
                                    <div class="input-box mt-20 text-center">
                                        <button class="main-btn" type="button" id="listRereply">목록</button>
                                        <button class="main-btn" type="submit" id="registRereply">등록</button>
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
   
<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']"); 
		 
		$("#listRereply").click(function(){ // get방식
			location.href="/board/adRereplyList";
		});
		
		$("#registRereply").click(function(){
			formObj.attr("action", "/board/adRereplyList");
			formObj.submit(); // form태그를 submit방식으로 보내자. => post
		});
		
	});
</script>
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
