<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
   
   
   <img alt="" src="/resources/main_construction.png">
   <section class="contact-form-area">
        <div class="container"> 
        <br>
        <br>
<!--             <div class="row justify-content-center"> -->
<!--                 <div class="col-lg-8"> -->
<!--                     <div class="section-title text-center"> -->
                        <h3 class="title" align="center">관리자 FAQ 작성</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form name="fr" id="contact-form" method="post">
                        <div class="conact-form-item">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        제목 : 
                                        <input type="text" name="not_title" value="" id="not_title">
                                    </div>
                                </div>
                               
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20" >
                                       카테고리 : <br>
                                       <select name="not_middle" id="not_middle" class="form-control"> 
                                       		<option value="" selected disabled hidden>
									   	 	<option value="2">후원자</option>
									   	 	<option value="3">판매자</option>
									   	 	<option value="1">구매자</option>
									   	</select>
                                    </div>
                                </div>
                                
                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                       내용 : <textarea id="not_content" cols="30" rows="10" placeholder="내용을 입력하세요" name="not_content"></textarea>
                                    </div>
                                    
                                    
                                    <div class="input-box mt-20 text-center">
                                        <button class="main-btn" type="button" id="listFaq">목록</button>
                                        <button class="main-btn" type="submit" id="registFaq">등록</button>
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
		 
		$("#listFaq").click(function(){
			location.href="/board/adFaqList";
		});
		
		$("#registFaq").click(function(){
			formObj.attr("action", "/board/adFaqRegist");
			formObj.submit(); // form태그를 submit방식으로 보내자.
		});
		
	});
</script>
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
