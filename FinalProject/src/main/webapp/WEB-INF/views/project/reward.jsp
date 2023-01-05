<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<style>
.faq-accrodion_ {
	margin-top: 6px;
}

@media only screen and (min-width: 600px) and (max-width: 600px) {
	.faq-accrodion_ {
		margin-top: 30px;
	}
}

@media ( max-width : 767px) {
	.faq-accrodion_ {
		margin-top: 30px;
	}
}

.faq-accrodion_ .accrodion {
	position: relative;
	-webkit-transition: all .4s ease;
	transition: all .4s ease;
	background-color: #f5f5f5;
}

.faq-accrodion_ .accrodion+.accrodion {
	margin-top: 10px;
}

.faq-accrodion_ .accrodion.active .accrodion-inner {
	background-color: transparent;
	border-color: #dce0e8;
	border: 1px solid #765ff2;
}

.faq-accrodion_ .accrodion.active::before {
	-webkit-transform: scaleX(1);
	transform: scaleX(1);
}

.faq-accrodion_ .accrodion.active .accrodion-title {
	padding-bottom: 0;
}

.faq-accrodion_ .accrodion.active .accrodion-title::before {
	opacity: 0;
}

.faq-accrodion_ .accrodion.active .accrodion-title::after {
	opacity: 1;
	color: #29f0b4;
}

.faq-accrodion_ .accrodion .accrodion-inner {
	background-color: transparent;
	padding: 25px 0;
	position: relative;
	-webkit-transition: all .4s ease;
	transition: all .4s ease;
	border-radius: 0px;
}

.faq-accrodion_ .accrodion .accrodion-title {
	padding: 0px 38px;
	cursor: pointer;
	position: relative;
	-webkit-transition: all .4s ease;
	transition: all .4s ease;
}

@media ( max-width : 767px) {
	.faq-accrodion_ .accrodion .accrodion-title {
		padding: 0 38px 0 20px;
	}
}

.faq-accrodion_ .accrodion .accrodion-title::before {
	content: "\f10f";
	font-family: Flaticon;
	font-size: 14px;
	color: black;
	position: absolute;
	top: 50%;
	right: 30px;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	opacity: 1;
	-webkit-transition: all 500ms ease;
	transition: all 500ms ease;
}

@media ( max-width : 767px) {
	.faq-accrodion_ .accrodion .accrodion-title::before {
		right: 20px;
	}
}

@media ( max-width : 767px) {
	.faq-accrodion_ .accrodion .accrodion-title::after {
		right: 20px;
	}
}

.faq-accrodion_ .accrodion .accrodion-title h4 {
	margin: 0;
	color: #fff;
	font-family: "NanumBarunGothic", sans-serif;
	font-size: 18px;
	font-weight: 500;
}

.faq-accrodion_ .accrodion .accrodion-title h4 span {
	color: #29f0b4;
	font-family: "NanumBarunGothic", cursive;
}

.faq-accrodion_ .accrodion .accrodion-content .inner {
	padding: 0 38px;
	padding-right: 50px;
	padding-top: 29px;
	padding-bottom: 0px;
}

@media only screen and (min-width: 992px) and (max-width: 1200px) {
	.faq-accrodion_ .accrodion .accrodion-content .inner {
		padding: 15px 38px 0 40px;
	}
}

@media ( max-width : 767px) {
	.faq-accrodion_ .accrodion .accrodion-content .inner {
		padding: 0 38px 0 20px;
	}
}

.faq-accrodion_ .accrodion .accrodion-content p {
	margin: 0;
	color: #d1c8fe;
	font-size: 16px;
	line-height: 30px;
	font-weight: 400;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#content').one('click',function(){
		$('#content_div').append('<div id="content_cnt">ㅤ(0 / 100)</div>');
	});
	
    $('#content').on('keyup', function() {
        $('#content_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#content_cnt').html("(100 / 100)");
        }
    });
});
</script>
<script type="text/javascript">

function removeComma(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}

$(document).on("keyup", "input:text[numberOnlyMinComma]", function(){
	var strVal = $(this).val();

	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;

	if((keyID >=48 && keyID <= 57) || (keyID >=96 && keyID <= 105)
				|| keyID == 46 || keyID == 8 || keyID == 109
				|| keyID == 189 || keyID == 9
				|| keyID == 37 || keyID == 39){
		if(strVal.length > 1 && (keyID == 109 || keyID == 189)){
			return false;
		}else{
			return;
		}
	}else{
		return false;
	}
	
});

$(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
	$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
	$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
	$('#reward_price').attr('value',removeComma($('#price').val()));
	$('#reward_stock').attr('value',removeComma($('#stock').val()));
});

</script>
<script type="text/javascript">

function cancelReward(seq){ 
	Swal.fire({
	  title: '리워드 작성을 취소하시겠습니까?',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '취소',
	  cancelButtonText: '돌아가기'
	}).then((result) => {
		if (result.isConfirmed) {           
        	//"리워드 작성 취소" 버튼을 눌렀을 때 호출할 함수
       	} 
	}) 
} 

function createReward(seq){
	Swal.fire({
	  title: '리워드를 추가 하시겠습니까?',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '확인',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
          //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
	 		if(document.fr.reward_price.value == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '금액을 입력해주세요'
				})
	 			document.fr.reward_price.focus();
	 			return;
	 		}
	 		if(document.fr.reward_title.value == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '제목을 입력해주세요'
				})
	 			document.fr.reward_title.focus();
	 			return;
	 		}
	 		if(document.fr.reward_content.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
					text: '내용을 입력해주세요'
				})
	 			document.fr.reward_content.focus();
	 			return;
	 		}
	 		if(document.fr.reward_stock.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
					text: '수량을 입력해주세요'
				})
	 			document.fr.reward_stock.focus();
	 			return;
	 		}
	 		if(document.fr.reward_ship.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
					text: '배송 여부를 입력해주세요'
				})
	 			document.fr.reward_ship.focus();
	 			return;
	 		}
	 		if(document.fr.reward_shipmonth.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
					text: '배송월을 입력해주세요'
				})
	 			document.fr.reward_shipmonth.focus();
	 			return;
	 		}
	 		if(document.fr.reward_shipdate.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
					text: '배송일을 입력해주세요'
				})
	 			document.fr.reward_shipdate.focus();
	 			return;
	 		}
	        fr.submit();
	  }
	})
}

function nextReward(seq){ 
	Swal.fire({
	  title: '다시 한 번 확인해주세요!',
	  text: '정말로 넘어가도 괜찮으신가요?',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '다음',
	  cancelButtonText: '머무르기'
	}).then((result) => {
		if (result.isConfirmed) {           
        	// "리워드 작성 취소" 버튼을 눌렀을 때 호출할 함수
      		location.href="/project/story";
       	} 
	}) 
}

function deleteReward(seq){ 
	Swal.fire({
	  title: '리워드를 삭제하시겠습니까?',
	  text: '삭제한 리워드는 복구가 불가능해요!',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '삭제',
	  cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {           
        	//"리워드 작성 취소" 버튼을 눌렀을 때 호출할 함수
      		location.href="/project/rewardDelete?reward_no="+seq;
       	} 
	}) 
}
</script>



<!-- 헤더 -->
<%@ include file="../include/header.jsp" %>

    <!--====== PAGE TITLE PART START ======-->
    
    <section class="page-title-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <h3 class="title" style="color: black; font-size: 3em">4. 스토리 작성</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--====== PAGE TITLE PART ENDS ======-->

    <!--====== BLOG DETAILS PART ENDS ======-->

    <section class="blog-details">
    <section class="project-details-content-area pb-110">
        <div class="container">
            <div class="row justify-content-center">
            
                <!-- 사이드 바 -->
				<%@ include file="../include/proSidebar.jsp" %>
				<!-- 사이드 바 -->
					
                <div class="col-lg-8">
                    <div class="blog-author">
                        <div class="blog-author__content">
							<!-- 리워드 설계 조건 -->                        
                            <h4>리워드 설계 조건</h4>
                            <p><b>정렬 순서</b> : 혜택이 좋은 순으로 등록해주세요</p>
                            <p><b>제한 수량</b> : 각 리워드별 제공할 수 있는 수량을 입력해 주세요. 제한된 수량이 모두 소진되면 이 리워드에 펀딩할 수 없어요</p>
                            <p><b>발송 시작일</b> : 프로젝트 종료일로부터 11개월 이내로 설계해 주세요.</p>
                            <p>　　　　　· 설정한 발송기간 내 리워드가 발송되지않으면 서포터님들이 펀딩금 반환을 신청할 수 있으니 신중하게 선택해 주세요.</p>
                            <p>　　　　　· 프로젝트 종료일로부터 + 11개월까지 발송이 시작되지 않으면 미발송 상태인 서포터님들의 펀딩금은 자동으로 반환(결제취소)돼요.</p>
                            <p><b>옵션 조건</b> : 사이즈, 색상 등의 옵션 설정이 필요하면 추가해 주세요.</p>

                        </div>
                    </div>
                    
					<!-- 리워드 추가 / 모달창 -->         
					<div align="center">          
						<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">리워드 추가</button>
                    </div>
                    
                    <p><br><br></p>
                    
					<!-- 모달 영역 시작 -->
					<form action="/project/reward" method="post" name="fr">
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					    	<div class="modal-dialog modal-lg" role="document">
					        	<div class="modal-content">
					            	<div class="modal-header">
					                <h4 class="modal-title" id="myModalLabel"><b>리워드 추가 * </b></h4>
					                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                	<span aria-hidden="true">×</span>
					                </button>
					                </div>
					                <div class="modal-body">
				                 	금액<br>
				                    <input type="text" name="price" value="" placeholder="0" id="price" numberOnlyMinComma="true" koreanCurrency="true" class="textBox"> 원
				                    <input type="hidden" name="reward_price" value="" id="reward_price">
				                    <br><br>
				                    리워드 명<br>
				                    <input type="text" name="reward_title" size="40" placeholder="예시) [얼리버드] 친환경 샴푸바 1세트" class="textBox">
				                    <br><br>
				                    리워드 설명<br>
				                    <div id="content_div">	
				                   	 <textarea name="reward_content" id="content" class="textArea"></textarea>
				                    </div>
				                    <br><br>
				                    제한 수량<br>
				                    <input type="text" name="stock" id="stock" value="" placeholder="0" numberOnlyMinComma="true" koreanCurrency="true" class="textBox"> 개
				                   	<input type="hidden" name="reward_stock" value="" id="reward_stock">
				                    <br><br>
				                    배송 여부<br>
				                    <div class="select">
	                               		<input type="radio" id="select" name="reward_ship" value="배송"><label for="select">배송</label>
	                               		<input type="radio" id="select2" name="reward_ship" value="배송안함"><label for="select2">배송안함</label>
                               	 	</div>
				                    발송 시작일<br>
				                    <select name="reward_shipmonth" class="textBox">
					        		<option>연도/월</option>
					        		<option>2022/12</option>
					        		<option>2023/01</option>
					        		<option>2023/02</option>
					        		<option>2023/03</option>
					        		<option>2023/04</option>
					        		<option>2023/05</option>
					        	</select>
					        	<select name="reward_shipdate" class="textBox">
					         		<option>시기</option>
					         		<option>초(1~10일)</option>
					         		<option>중순(11~20일)</option>
					         		<option>말(21~말일)</option>
					         	</select>
					         	<br><br>
						        <small> · 설설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택해 주세요.</small><br>
						        <small> · 종료일+11개월(2023-11-20)까지 리워드 발송이 시작되지 않은 경우, 2023-11-21에 미발송 상태인 서포터의 펀딩금 반환이 자동으로 완료 처리(결제 취소)되니 유의해 주세요.</small><br>
						        <small> · 안내사항 안내사항 안내사항 안내사항 안내사항 안내사항<br></small>
						        <small> · 안내사항 안내사항 안내사항 안내사항 안내사항 안내사항<br></small>
						         	<div id="buttons">
										<input type="button" value="취소하기"  class="main-btn" onclick="return cancelReward();">
										<input type="button" value="추가하기"  class="main-btn" onclick="return createReward();">
									</div>
						     		</div>
					   			</div>
							</div>
						</div>
					</form>
					<!-- 모달영역 끝 -->
         
					<!-- 리워드 -->    
	                <div class="tab-pane fade active show" id="pills-3" role="tabpanel" aria-labelledby="pills-3-tab">
	                	<div class="row">
	                    	<div class="col-lg-6">
	                        	<div class="faq-accordion_">
	                            	<div class="accrodion-grp animated wow fadeInLeft faq-accrodion_" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion_">
	                            	
									<c:if test="${not empty rewList }">
										<c:forEach var="rewList" items="${rewList }">
											<div class="accrodion">
												<div class="accrodion-inner">
													<div class="accrodion-title">
														<h4 style="color: black">${rewList.reward_title }</h4>
													</div>
													<div class="accrodion-content" style="display: none; color: black;" >
														<div class="inner">
															<p style="color: black;">가격 : ${rewList.reward_price }</p>
															<p style="color: black;">재고 : ${rewList.reward_stock }</p>
															<p style="color: black;">내용 : ${rewList.reward_content }</p>
															<p style="color: black;">배송 여부: ${rewList.reward_ship }</p>
															<p style="color: black;">배송 월: ${rewList.reward_shipmonth }</p>
															<p style="color: black;">배송 일: ${rewList.reward_shipdate }</p>
														</div>
														<div>
															<a href="javascript:deleteReward(${rewList.reward_no });" style="font-size: 5px; float: right; padding-right: 3em; padding-bottom: 3em;">삭제</a>
														</div>
													</div>
											
												</div>
											</div>
										</c:forEach>   
									</c:if>   
	                                      
	                            	</div>
	                        	</div>
	                    	</div>
	                	</div>
	                </div>
					<!-- 리워드 -->
					
					<br><br>
					
					<div align="center">
						<input type="button" value="다음"  class="main-btn" onclick="return nextReward();">
	                </div>
                </div>
            </div>
        </div>
    </section>    
    </section>

    <!--====== BLOG DETAILSSTART ======-->

    
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
