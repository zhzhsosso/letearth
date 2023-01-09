<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<style>
#box {
  width: 300px;
  height: 350px;
  border-radius: 8px;
  overflow: hidden;
  transition: all 0.3s cubic-bezier(0.42, 0.0, 0.58, 1.0);
}

#box:hover {
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
  transform: translateY(-10px);
}
#box * {
  padding: 10px;
}

#box .img {
  display: block;
  width: 100%;
  padding: 0;
}
#box .heading {
  font-size: 28px;
}

#box .data {
  display: flex;
  flex-direction: column;
  font-size: 12px;
  color: #666;
}

#box .data span {
  padding: 0;
}

#box .data .date {
  margin-bottom: 2px;
}

#box .data .user-id {
  font-size: 16px;
  color: #000;
  font-weight: 600;
}

#box .texts {
  font-size: 16px;
  line-height: 10px;
}
</style>
<script type="text/javascript">

$('#reward_content').one('click',function(){
	$('#content_div').append('<div id="content_cnt">ㅤ0 / 100</div>');
});

$('#reward_content').on('keyup', function() {
    $('#content_cnt').html("ㅤ"+$(this).val().length+" / 100");

    if($(this).val().length > 100) {
        $(this).val($(this).val().substring(0, 100));
        $('#content_cnt').html("ㅤ100 / 100");
    }
});

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
	 		if($('#reward_price').val() == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
					text: '금액을 입력해주세요'
				})
	 			return false;
	 		}
	 		if($('#reward_title').val() == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
	 		    	title: '제목을 입력해주세요'
				})
	 			return false;
	 		}
	 		if($('#reward_content').val() == ""){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '설명을 입력해주세요'
				})
	 			return false;
	 		}
	 		if(document.fr.reward_stock.value == ""){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '수량을 입력해주세요'
				})
	 			return false;
	 		}
	 		if($('input:radio[name=reward_ship]').val() == ""){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '배송 여부를 입력해주세요'
				})
	 			return false;
	 		}
	 		if($('#reward_shipmonth').val() == 0){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '배송월을 입력해주세요'
				})
	 			return false;
	 		}
	 		if($('#reward_shipdate').val() == 0){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '배송일을 입력해주세요'
				})
	 			return false;
	 		}
// 	 		$.ajax({
// 	 			async : true,
// 	 		    type:'post',
// 	 		    url:"/project/reward",
// 	 		    data: {
// 	 		    	reward_price:$("#reward_price").val(),
// 	 		    	reward_title:$("#reward_title").val(),
// 	 		    	reward_content:$('#content').val(),
// 	 		    	reward_stock:$('#reward_stock').val(),
// 	 		    	reward_ship:$("input[name=reward_ship]").val(),
// 	 		    	reward_shipmonth:$('#reward_shipmonth').val(),
// 	 		    	reward_shipdate:$('#reward_shipdate').val(),
// 	 			},
// 	 		    dataType : "text",
// 	 		    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
// 	 		    success : function(resp) {
// 	 		    	alert('등록완료');
	 		    	
// 	 		    	$('body').removeClass('modal-open');        
// 	 		        $('body').css('padding-right', '');
// 	 		        $(".modal-backdrop").remove();
// 	 		        $('#myModal').hide();
// 	 		    	$.ajax({
// 	 					url:"/project/reward",
// 	 					type:"get",
// 	 					datatype:"html",
// 	 					success:function(data){
// 	 						$("#plan").html(data);
// 	 						$('#plan').load(location.href+' #plan');
// 	 					}	
// 	 				});
// 	 		    },
// 	 		    error: function(jqXHR, textStatus, errorThrown) {
// 	 		        alert("ERROR : " + textStatus + " : " + errorThrown);
// 	 		    }        
// 	 		});
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
		 	$.ajax({
					url:"/project/story",
					type:"get",
					datatype:"html",
					success:function(data){
						$("#reward").html(data);
					}	
				});
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
    <!--====== BLOG DETAILS PART ENDS ======-->

    <section class="blog-details">
    <section class="project-details-content-area pb-110">
        <div class="container">
            <div class="row justify-content-center">
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
					<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<form method="post" name="fr">
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
				                    <input type="text" name="reward_price" value="" id="reward_price">
				                    <br><br>
				                    리워드 명<br>
				                    <input type="text" name="reward_title" id="reward_title" size="40" placeholder="예시) [얼리버드] 친환경 샴푸바 1세트" class="textBox">
				                    <br><br>
				                    리워드 설명<br>
				                    <div id="content_div">	
				                   	 <textarea name="reward_content" id="reward_content" class="textArea" style="width: auto;"></textarea>
				                    </div>
				                    <br><br>
				                    제한 수량<br>
				                    <input type="text" name="stock" id="stock" value="" placeholder="0" numberOnlyMinComma="true" koreanCurrency="true" class="textBox"> 개
				                   	<input type="text" name="reward_stock" value="" id="reward_stock">
				                    <br><br>
				                    배송 여부<br>
				                    <div class="select">
	                               		<input type="radio" id="select" name="reward_ship" value="배송"><label for="select">배송</label>
	                               		<input type="radio" id="select2" name="reward_ship" value="배송안함"><label for="select2">배송안함</label>
                               	 	</div>
				                    발송 시작일<br>
				                    <select name="reward_shipmonth" id="reward_shipmonth" class="textBox">
					        		<option value="0">연도/월</option>
					        		<option value="2023/01">2023/01</option>
					        		<option value="2023/02">2023/02</option>
					        		<option value="2023/03">2023/03</option>
					        		<option value="2023/04">2023/04</option>
					        		<option value="2023/05">2023/05</option>
					        	</select>
					        	<select name="reward_shipdate" id="reward_shipdate" class="textBox">
					         		<option value="0">시기</option>
					         		<option value="초(1~10일)">초(1~10일)</option>
					         		<option value="중순(11~20일)">중순(11~20일)</option>
					         		<option value="말(21~말일)">말(21~말일)</option>
					         	</select>
					         	<br><br>
						        <small> · 설설정한 발송 시작일까지 리워드가 발송되지 않을 경우, 서포터가 펀딩금 반환을 신청할 수 있으니 신중하게 선택해 주세요.</small><br>
						        <small> · 종료일+11개월(2023-11-20)까지 리워드 발송이 시작되지 않은 경우, 2023-11-21에 미발송 상태인 서포터의 펀딩금 반환이 자동으로 완료 처리(결제 취소)되니 유의해 주세요.</small><br>
						        <small> · 안내사항 안내사항 안내사항 안내사항 안내사항 안내사항<br></small>
						        <small> · 안내사항 안내사항 안내사항 안내사항 안내사항 안내사항<br></small>
						         	<div id="buttons">
										<input type="button" value="추가"  class="main-btn" onclick="createReward();">
									</div>
						     		</div>
					   			</div>
							</div>
						</form>
					</div>
					<!-- 모달영역 끝 -->
         
					<!-- 리워드 -->
					<c:if test="${not empty rewList }">
						<c:forEach var="rewList" items="${rewList }">
							<div id="box">
								<div style="padding:1em;">
									<h1 class="heading">${rewList.reward_title }</h1>
									<div class="data">
<!-- 										<span class="date">2021-10-21</span> -->
<!-- 										<span class="user-id">user ID</span> -->
									</div>
									<p class="texts">가격 : ${rewList.reward_price }</p>
									<p class="texts">재고 : ${rewList.reward_stock }</p>
									<p class="texts">재고 : ${rewList.reward_stock }</p>
									<p class="texts">내용 : ${rewList.reward_content }</p>
									<p class="texts">배송 여부: ${rewList.reward_ship }</p>
									<p class="texts">배송 월: ${rewList.reward_shipmonth }</p>
									<p class="texts">배송 일: ${rewList.reward_shipdate }</p>
									<a href="javascript:deleteReward(${rewList.reward_no });">삭제</a>
								</div>
							</div>

						</c:forEach>
					</c:if>
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
