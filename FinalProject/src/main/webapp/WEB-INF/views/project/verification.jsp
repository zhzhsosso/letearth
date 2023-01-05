<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

    
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
  
<script type="text/javascript">
	function veriFy() {
	
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp26572603"); // 예: imp00000000
	
		IMP.certification({
			pg : 'MIIiasTest'
		}, function(rsp) { // callback
			if (rsp.success) { // 인증 성공 시
				// jQuery로 HTTP 요청
				jQuery.ajax({
					url : "/project/confirm",
					method : "POST",
					headers : {"Content-Type" : "application/json"},
					data : {imp_uid : rsp.imp_uid},
				});
				location.href = "/project/confirm?result=success";
	
			} else {
				alert("인증에 실패하였습니다. 에러 내용: " + rsp.error_msg);
			}
		});
	
	}
</script>
  
	<section class="next-big-thing-area next-big-thing-about-area">
        <div class="container">
        
         	<div class="row justify-content-center">
		        <div class="col-lg-8">
		            <div class="section-title text-center">
		            <h3 class="title">본인 임을 인증해주세요</h3>
		                <span>대표 창작자는 본인 인증이 필요합니다.</span>
		                <a class="main-btn" href="javascript:veriFy()">인증하기</a>
		                
		           
		            </div>
		        </div>
		    </div>
		    
           
        </div>
    </section>
    
            <div class="input-box mt-20 text-center">
	            <a class="main-btn" href="/project/createThird">뒤로가기</a>
            </div>
    
    <%@ include file="../include/footer.jsp" %>