<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<style>

.plan {
	text-align: left;
	color: #6C9FFF;
	margin-bottom: 30px;
}

.field {
	display: flex;
	vertical-align: middle;
	float: right;
}

#goalP {
	width: auto;
}

#exp {
	border: none;
}

#vat {
	border: none;
}

.step-heading {
	height: 33px;
	padding-bottom: 30px;
	cursor: pointer;
}

.step:last-child .step-heading {
	padding-bottom: 0;
}

.step-heading>a:hover {
	text-decoration: none;
}

.step-heading .num {
	width: 32px;
	height: 32px;
}

.steps .step .line {
	border-left: 1px solid #333;
	left: 16px;
	bottom: -32px;
	top: 32px;
}

.step-body {
	margin: 0px 30px 30px 10px;
	font-size: 15px;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#goalP').one('click', function(){
		$('#gp_div').append('50만원 이상부터 입력이 가능해요');
	});
	
	$('#del_date').one('click', function(){
		$('#del_div').append('대략적인 배송일을 입력해주세요');
	});
});
</script>
<script>
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
			|| keyID == 37 || keyID == 39) {
			if(strVal.length > 1 && (keyID == 109 || keyID == 189)){
				return false;
			} else {
				return;
			}
		} else {
			return false;
		}
	});

	$(document).on("keyup", "input:text[numberOnlyMinComma]", function()	{
		$(this).val( $(this).val().replace(/[^-\.0-9]/gi,"") );
		$(this).val( $(this).val().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") );
		$('#pro_gp').attr('value',removeComma($('#goalP').val()));
	});


	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}
	
	$(function(){
		$("#goalP").blur(function(){
			var goal = $('#pro_gp').val();
			var vat = (goal/100*3)+(goal/100*10);
			var exp = goal-vat;
			$('#vat').attr('value',"-"+comma(vat));
			$('#exp').attr('value',comma(exp));
		});
		
		$("#startDate").blur(function(){
			var start = $('#startDate').val();
			var arr = start.split('-');
			var d = new Date(arr[0],arr[1]-1,arr[2]);
			d.setMonth(d.getMonth()+1);
			d.setDate(d.getDate()+59);
			if(d.getMonth() < 10) {
				var end = d.getFullYear()+'-'+"0"+d.getMonth()+'-'+d.getDate();
			} else {
				end = d.getFullYear()+'-'+d.getMonth()+'-'+d.getDate();
			}
			
			$('#endDate').attr("max",end);
			
		});
		
	});
	
<%Date now = new Date();
SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
String today = date.format(now);%>
</script>
<script type="text/javascript">
function checkPlan() {
	if(document.fr.pro_gp.value == "") {
		Swal.fire({
			icon : 'error',
			title : '목표금액을 입력해주세요!',
			confirmButtonText : '확인'
		})
		document.fr.pro_gp.focus();
		return false;
	}
	if(document.fr.pro_st_dt.value == "") {
		Swal.fire({
			icon : 'error',
			title : '시작날짜를 입력해주세요!',
			confirmButtonText : '확인'
		})
		document.fr.pro_gp.focus();
		return false;
	}
	if(document.fr.pro_ed_dt.value == "") {
		Swal.fire({
			icon : 'error',
			title : '종료날짜를 입력해주세요!',
			confirmButtonText : '확인'
		})
		document.fr.pro_ed_dt.focus();
		return false;
	}
	if(document.fr.del_date.value == "") {
		Swal.fire({
			icon : 'error',
			title : '배송 예정일을 입력해주세요!',
			confirmButtonText : '확인'
		})
		document.fr.del_date.focus();
		return false;
	}
	fr.submit();
}
</script>
</head>
<body>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>
	
	<!--====== PAGE TITLE PART START ======-->
    
    <section class="page-title-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <h3 class="title" style="color: black; font-size: 3em">2. 일정</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--====== PAGE TITLE PART ENDS ======-->
	
	
	<!--====== PROJECT CONTENT PART START ====== -->
	<form action="/project/plan" method="post">
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
		                            <p style="font-size: 2.5em;">모금금액
	                                    <h5 class="title">프로젝트를 완성하기 위해 필요한 금액을 설정해주세요.</h5>
		                                    목표금액 설정시 꼭 알아두세요. <br>
		                                    1. 어쩌구 블라블라 <br>
		                                    2. 어쩌구 블라블라 <br>
		                                    3. 어쩌구 블라블 <br> <br><br>
		                                <div id="gp_div">    
											<input type="text" id="goalP" name="gprice" numberOnlyMinComma="true" koreanCurrency="true" class="textBox">원
											<input type="hidden" id="pro_gp" name="pro_gp" value="">
										</div>
										<hr>
										<div class="field"> 
											<p>결제대행 수수료(총 결제액의 3% + VAT)</p>
											<input type="text" id="vat" style="text-align: right" value="0" readonly> 원
										</div>
										<div class="field">
											<p>목표금액 달성 시 예상 수령 액</p>
											<input type="text" id="exp" style="text-align: right" value="0" readonly> 원
										</div>
									</p>
									<p style="font-size: 2.5em;">펀딩 일정</p>
	                                    <h5 class="title">설정한 일시가 되면 펀딩이 자동으로 시작됩니다. <br> 펀딩 시작 전까지 날짜를 변경할 수 있고, 즉시
										펀딩을 시작할 수 도 있습니다.</h5>
	                                   <div class="container my-5">
										<div class="my-5">
											<div class="steps" id="stepWizard">
												<div class="step position-relative">
													<div class="step-heading position-static" id="step1">
														<div>
															<div class="num d-inline-flex text-white align-items-center justify-content-center position-relative rounded-circle bg-primary">1</div>
															<div class="pl-3 d-inline-flex title">시작일</div>
														</div>
													</div>
	
													<div class="line position-absolute"></div>
	
													<div id="collapse1" class="pl-5" aria-labelledby="step1"
														data-parent="#stepWizard">
														<div class="step-body">
															<input type="date" id="startDate" class="textBox" name="pro_st_dt" value="" min=<%=today%>>
														</div>
													</div>
												</div>
	
												<div class="step position-relative">
													<div class="step-heading position-static" id="step2">
														<div class="num d-inline-flex text-white align-items-center justify-content-center position-relative rounded-circle bg-primary">2</div>
														<div class="pl-3 d-inline-flex title">펀딩기간</div>
													</div>
	
													<div class="line position-absolute"></div>
	
													<div id="collapse2" class="pl-5" aria-labelledby="step2" data-parent="#stepWizard">
														<div class="step-body">최대 60일</div>
													</div>
												</div>
	
												<div class="step position-relative">
													<div class="step-heading position-static" id="step3">
														<div class="num d-inline-flex text-white align-items-center justify-content-center position-relative rounded-circle bg-primary">3</div>
														<div class="pl-3 d-inline-flex title">종료일</div>
													</div>
	
													<div class="line position-absolute"></div>
	
													<div id="collapse2" class="pl-5">
														<div class="step-body">
															<input type="date" id="endDate" class="textBox" name="pro_ed_dt" min=<%=today%> max="">
														</div>
													</div>
												</div>
												
												<div class="step position-relative">
													<div class="step-heading position-static" id="step3">
														<div class="num d-inline-flex text-white align-items-center justify-content-center position-relative rounded-circle bg-primary">4</div>
														<div class="pl-3 d-inline-flex title">배송 예정일</div>
													</div>
	
													<div class="line position-absolute"></div>
	
													<div id="collapse2" class="pl-5">
														<div class="step-body" id="del_div">
															<input type="text" name="del_date" class="textBox" id="del_date">
														</div>
													</div>
												</div>
	
												<div class="step position-relative">
													<div class="step-heading position-static" id="step4">
														<div class="num d-inline-flex text-white align-items-center justify-content-center position-relative rounded-circle bg-primary">5</div>
														<div class="pl-3 d-inline-flex title">정산일</div>
													</div>
	
	
													<div id="collapse2" class="pl-5">
														<div class="step-body">후원자 결제 종료 다음 날부터 7 영업일</div>
													</div>
												</div>
											</div>
										</div>
									</div>
	                            </div>
	                    	</div>
	                	</div>
							<button type="button" class="main-btn" style="float: right;" onclick="return checkPlan();">다음</button>
	            	</div>
				</div>
	    	</div>
	    </section>
	</form>



	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>