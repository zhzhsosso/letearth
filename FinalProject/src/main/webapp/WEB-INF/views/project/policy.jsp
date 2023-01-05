<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
// 글자수 제어 1
$(document).ready(function() {
	$('#pro_policy').on('click',function(){
 		$('#policy_div').append('<div id="policy_cnt">ㅤ(0 / 800)</div>');
	});
	
    $('#pro_policy').on('keyup', function() {
        $('#policy_cnt').html("("+$(this).val().length+" / 800)");
 
        if($(this).val().length > 800) {
            $(this).val($(this).val().substring(0, 800));
            $('#policy_cnt').html("(800 / 800)");
        }
    });
});
</script>
<script type="text/javascript">
function updatePolicy(seq){
	if(document.fr.pro_policy.value == "") {
		Swal.fire({
			title : '프로젝트 정책을 입력해주세요!',
			icon : 'error',
			confirmButtonText : '확인'
		})
		document.fr.pro_policy.focus();
		return false;
	}
	fr.submit();
}

</script>

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
    
	<!--====== PROJECT CONTENT PART START ====== -->
	<form action="/project/policy" method="post" name="fr">
	    <section class="project-details-content-area pb-110">
	        <div class="container">
	            <div class="row justify-content-center">
	            
	          		<!-- 사이드 바 -->
					<%@ include file="../include/proSidebar.jsp" %>
					<!-- 사이드 바 -->
					
	                <div class="col-lg-8">
	                    <div class="tab-content" id="pills-tabContent">
	                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
	                            <div class="project-details-content-top">
		                           	 <div class="col-lg-4 col-md-7 col-sm-9">
		                           	 </div>
	                            </div>
	                            <div class="project-details-item">
		                            <p style="font-size: 2.5em;">프로젝트 정책</p>
	                                <div class="item">
	                                    <i class="flaticon-checkmark"></i>
	                                    <h5 class="title">펀딩 종료 후 후원자의 불만 또는 분쟁 발생 시 중요한 기준이 될 수 있습니다.<br> 신중하게 작성해주세요</h5>
	                                    <p>(예시) 아래와 같은 사항을 고려해서 작성해주세요. 진행하는 프로젝트에 해당되지 않는 항목은 삭제해주세요. <br>
											· 펀딩 마감 이후에는 후원금액이 창작자에게 전달되기에 텀블벅을 통해 환불이 불가합니다.
											  환불은 창작자가 환불계좌를 받아 반환하는 방식으로만 가능하며, 어떤 경우에 환불이 가능한지를 기재해주세요. <br>
											· 펀딩 성사 후 지연 또는 선물 전달에 문제가 발생했을 때에 어떤 식으로 대응하시겠어요?
											  이 프로젝트 특성상 발생할 수 있는 문제에 대한 추가적인 정책이나 약속이 있다면 기재해주세요. (후원금 환불, 대체 보상 등) <br>
											· 배송이 필요한 선물에 문제가 발생한 경우 교환, A/S는 어떻게 진행되나요? <br>
											· 디지털 콘텐츠 리워드는 타인에게 양도가 가능한가요? <br>
											· 오프라인으로 전달되는 선물(공연, 전시 등)은 타인에게 양도가 가능한가요?
										</p>
										<div id="policy_div">
										<textarea class="bigTextArea" name="pro_policy" id="pro_policy"></textarea>
										</div>
	                                </div>
	                            </div>
	                    	</div>
	                	</div>
	                       <button type="button" class="main-btn" style="float: right;" onclick="return updatePolicy();">다음</button>
	            	</div>
				</div>
	    	</div>
	    </section>
    </form>
    
<!--     ====== PROJECT CONTENT PART ENDS ====== -->

<%@ include file="../include/footer.jsp"%>
