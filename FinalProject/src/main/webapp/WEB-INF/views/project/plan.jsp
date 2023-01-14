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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.plan {
	text-align: left;
	background-color: #A4AC85;
	margin-bottom: 30px;
}

.field {
	float: right;
}

#goalP {
	width: auto;
}

#exp {
	border: none;
	float: right;
}

#vat {
	border: none;
	float: right;
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
		$('#gp_div').append('<small>50만원 이상부터 입력이 가능해요</small>');
	});
	
	$('#del_date').one('click', function(){
		$('#del_div').append('대략적인 배송일을 입력해주세요 (ex. 2023년 3월 경)');
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
	if($('#pro_gp').val() < 500000) {
		Swal.fire({
			icon : 'error',
			title : '목표금액을 입력해주세요!',
			confirmButtonText : '확인',
			confirmButtonColor: '#A4AC85'
		})
		document.fr.pro_gp.focus();
		return false;
	}
	if($('#startDate').val() == "") {
		Swal.fire({
			icon : 'error',
			title : '시작날짜를 입력해주세요!',
			confirmButtonText : '확인',
			confirmButtonColor: '#A4AC85'
		})
		document.fr.pro_gp.focus();
		return false;
	}
	if($('#endDate').val() == "") {
		Swal.fire({
			icon : 'error',
			title : '종료날짜를 입력해주세요!',
			confirmButtonText : '확인',
			confirmButtonColor: '#A4AC85'
		})
		document.fr.pro_ed_dt.focus();
		return false;
	}
	if($('#del_date').val() == "") {
		Swal.fire({
			icon : 'error',
			title : '배송 예정일을 입력해주세요!',
			confirmButtonText : '확인',
			confirmButtonColor: '#A4AC85'
		})
		document.fr.del_date.focus();
		return false;
	}
	$.ajax({
		async : true,
	    type:'post',
	    url:"/project/plan",
	    data: {
	    	pro_gp:$("#pro_gp").val(),
	    	pro_st_dt:$("#startDate").val(),
	    	pro_ed_dt:$('#endDate').val(),
	    	del_date:$('#del_date').val(),
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	$.ajax({
				url:"/project/reward",
				type:"get",
				datatype:"html",
				success:function(data){
					$('html, body').scrollTop(0);
					$("#project").html(data);
				}	
			});
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}
</script>
<!--====== PROJECT CONTENT PART START ====== -->
<form action="/project/plan" method="post" name="fr">
	<div style="display: flex; justify-content: center;">
		<div class="col-lg-8">
			<div class="blog-details__main">
				<div class="blog-details__main">
					<div class="meta">
						<div class="blog-details__tags">
							<span>모금 금액</span>
						</div>
						<small>프로젝트를 완성하기 위해 필요한 금액을 설정해주세요. 목표금액 설정시 꼭 알아두세요. </small>
					</div>
					<div id="gp_div">
						<input type="text" id="goalP" name="gprice" numberOnlyMinComma="true" koreanCurrency="true" class="textBox" value=${proVO.pro_gp }>원
						<input type="hidden" id="pro_gp" name="pro_gp" value="">
					</div>
					<div class="field">
						<span>결제대행 수수료(총 결제액의 3% + VAT)</span>
						<input type="text" id="vat" style="text-align: right" value="0" readonly> 원<br>
						<span>목표금액 달성 시 예상 수령 액</span>
						<input type="text" id="exp" style="text-align: right" value="0" readonly> 원
					</div>
				</div>
				<br>
				<br>

				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>펀딩 일정</span>
						</div>
						<small>설정한 일시가 되면 펀딩이 자동으로 시작됩니다. <br> 펀딩 시작 전까지 날짜를
							변경할 수 있고, 즉시 펀딩을 시작할 수 도 있습니다.
						</small>
					</div>
				</div>
				<div class="blog-author__content">
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

									<div id="collapse1" class="pl-5" aria-labelledby="step1" data-parent="#stepWizard">
										<div class="step-body">
											<input type="date" id="startDate" class="textBox" name="pro_st_dt" value="${proVO.pro_st_dt }" min=<%=today%>>
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
											<input type="date" id="endDate" class="textBox" name="pro_ed_dt" min=<%=today%> max="" value=${proVO.pro_ed_dt }>
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
											<input type="text" name="del_date" class="textBox" id="del_date" value=${proVO.del_date }>
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
	</div>
</form>
		<div class="text-center">
			<button type="button" class="main-btn" onclick="checkPlan();" style="background-color: #A4AC85; border: none;">다음</button>
		</div>