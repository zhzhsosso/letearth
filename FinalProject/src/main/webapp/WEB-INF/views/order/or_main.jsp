<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
	<script src="https://kit.fontawesome.com/bd939ba5e2.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	
	<title>LetEarth</title>



<style>
	.ortitle {
		display: flex;
		margin: 20px 0px;
	}
	
	.row {
		margin: 20px 0px 20px 0px;
	}
	
	.proimg {
		padding-left: 20px;
	}
	
	.explain {
		margin: 10px;
		padding: 20px 10px;
	}
	
	.orinfo {
		display: flex;
	}
	
	.info {
		display:flex;
		border: 1px;
		border-style: solid;
		border-radius: 7px;
	}
	
	.tedori {
		padding:15px;
		border: 1px;
		border-style: solid;
		border-radius: 7px;
	}
	
	.info2 {
		display: flex;
		width:100%;
	}
	
	.info > div {
		padding:15px;
	}
	
	#infoth {
		padding: 5px 30px 5px 0px;
		
	}
	
	#dark {
		width: 100%;
		height: 100%;
		position: fixed;
		background-color: #000000;
		opacity:0.6;
		top: 0;
		left: 0;
		z-index:9998;
		display: none;
	}
	
	#gift {
		margin: 5px;
	}
	
	.giftTex {
		border:none;
		width:100%;
	}
	
	
	
</style>

<% Date now = new Date();
SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
String today = date.format(now);%>

<script>
const IMP = window.IMP; // 생략 가능
IMP.init("imp63431637"); // 예: imp00000000a

function requestPay() {
	let reward_no = $('#re_no').val();
	let phone = $('#phone').val();
	let receiver_name = $('#receiver_name').val();
	let receiver_phone = $('#receiver_phone').val();
	let address_no = $('#sample6_postcode').val();
	let address_detail = $('#sample6_detailAddress').val();
	let hidcheck = $('#hidcheak').val();
	let agree1 = $('#agree1');
	let agree2 = $('#agree2');
	
	let reward_title = $('#re_title').val();
	let total_price = $('#totalRe').val();
	let today= <%=today%>
	let trade_num = today+"-"+(${order_no}+1);
	
	if(reward_no != 0 ){
		if(phone.length == 0){
			alert('연락처를 입력해주세요');
			$('#phone').focus();
			
		 	return;
		}
		
		if(receiver_name.length == 0){
			alert('받는 분 성함을 입력해주세요');
			$('#receiver_name').focus();
			
		 	return;
		}
		
		if(address_no.length == 0){
			alert('주소를 입력해주세요');
			$('#sample6_postcode').focus();
			
		 	return;
		}
		
		if(address_detail.length == 0){
			alert('상세주소를 입력해주세요');
			$('#sample6_detailAddress').focus();
			
		 	return;
		}
		
		if(receiver_phone.length == 0){
			alert('받는 분 연락처를 입력해주세요');
			$('#receiver_phone').focus();
			
		 	return;
		}
		
		if(hidcheck == 0){
			alert('연락처 본인 인증을 완료해주세요');
			$('#phone').focus();
			
		 	return;
		}
		
	}
		// 약관 동의 체크
		if(!agree1[0].checked) {
			alert("개인정보이용에 동의해주세요");
			return;
		}
		
		if(!agree2[0].checked) {
			alert("후원 유의사항 확인에 동의해주세요");
			return;
		}
	
		
   	  IMP.request_pay({
      pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: trade_num,   // 주문번호
      name: reward_title,
      amount: total_price,       // 숫자 타입
      buyer_name: "${session.mem_id}",
      buyer_tel: "010-9554-9537",  //
    }, function (rsp) { // callback
      if (rsp.success) {
    	  alert('후원이 완료되었습니다.');
    	  document.fr.submit();
      } else {
          alert('문제가 생겼습니다.');
      }
    });
  }
  

	
	function getCookie(name) {
		var value = document.cookie.match('(^|;)?'+name+'=([^;]*)(;|$)');
		return value? unescape(value[2]) : null;
	}
	
	
  var timer = null;
  var isRunning = false;

  function startTimer(count, display) {
      
		var minutes, seconds;
        timer = setInterval(function () {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);
 
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
 
        display.html(minutes + ":" + seconds);
 
        var hid = $("#hidcheck").val();
        
        // 타이머 끝
        if (--count < 0 || hid == 1 ) {
	     clearInterval(timer);
	     display.html("");
	     $('#sendPhone').attr("disabled",false);
	     isRunning = false;
        }
    }, 1000);
         isRunning = true;
}
  
	$(function(){
		
		// 연락처 인증번호 
		$("#sendPhone").click(function(){
			var phone = $("#phone").val();
			var pro_no = $("#prono").val();
// 			var sec = 180;

			if(phone == ""){
				alert('연락처를 입력해주세요.')
				
				return;
			}
			
			alert("인증번호를 보냈습니다.");
			$("#sendPhone").attr('disabled','disabled')
			$('#phoneCheck').css('visibility','visible');
			$('#checkNum').css('visibility','visible');
			
			var display = $('#timer');
	      	var leftSec = 60;
	      	startTimer();
	      	// 남은 시간
	      	// 이미 타이머가 작동중이면 중지
	      	if (isRunning){
	      		clearInterval(timer);
	      		display.html("");
	      		startTimer(leftSec, display);
	      	}else{
	      	startTimer(leftSec, display);
	      		
	      	}
			
			
			
			$.ajax({
				url:'${pageContext.request.contextPath}/order/sendAuthSMS',
				type:'post',
				data:{"phone":phone, "pro_no":pro_no},
				success:function(){
					var code= getCookie("code");

					$("#phoneCheck").click(function(){
						var checkNum = $("#checkNum").val();
						
						if(checkNum == ""){
							alert('인증번호를 입력해주세요.')
						} else if(getCookie("code") == checkNum) {
							alert('인증되었습니다.');
							$('#phoneCheck').hide();
							$('#checkNum').hide();
							$("#sendPhone").hide();
							$("#timer").hide();
							$("#phone").attr('readonly',true);
							$("#phone").css('border','none');
							$("#hidcheck").attr('value','1');
							
							$.ajax({
								url:'${pageContext.request.contextPath}/order/updateMem',
								type:'post',
								data:{"phone":phone},
								success:function(result){
									if(result == 1){
										console.log('저장 성공');
									} else {
										alert('저장 실패. 관리자에게 문의하세요.');
									}
								}
								
							});
							
						} else if(getCookie("code")==null) {
							alert('인증시간이 지났습니다. 인증번호를 다시 받아주세요.');							
						} else if(getCookie("code") != checkNum){
							alert('인증번호가 틀립니다.');
						}
					});
						
				},
				error:function(){
					alert("문제가 생겼습니다.");
				}
			});
		});
		
		
		// 후원 유의사항 이벤트
		$('#read').click(function(){
			var read = $('#read').val();
			if(read == "열기 ▼") {
				$('#read').attr("value","닫기 ▲");
				$('.readme').slideDown('slow');
			} 
			
			if(read == "닫기 ▲") {
				$('#read').attr("value","열기 ▼");
				$('.readme').slideUp('slow');
			}
		});
		
	});


	// 우편번호 api
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
//                     document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
//                     document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
	
	
</script>

</head>
<body>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	

    <!--====== FORM PART START ======-->
    
    <!--====== PAGE TITLE PART START ======-->
   
    <section class="page-title-area bg_cover" style="background-image: url(assets/images/page-title-bg.jpg);">

    </section>
    <br>

    <!--====== PAGE TITLE PART ENDS ======-->

    <!--====== PROJECT DETAILS PART START ======-->
    <div class="container" style="background:#674df0">
      <div class="row">
                
	    <div class="ortitle">
	        <div class="proimg">
	            <img src="${pvo.pro_file }" width="150" height="150" alt="">
	        </div>
	        <div class="explain">
	            <div class="explain-list">
	                <p>${pvo.cat_name }</p>
	                <h3 style="color:white">${pvo.pro_title }</h3>
	                <span><b><fmt:formatNumber> ${pvo.pro_tp }</fmt:formatNumber>원</b></span> 
	                <span style="color:red">${pvo.achievement_rate }%</span> 
	                <span>${pvo.left_date }일 남음</span> 
	            </div>
	        </div>                            
	    </div>
    
      </div>
    </div>
    
        <div class="container" style="margin-top: 20px; margin-bottom: 50px">
        <div class="about-introduction-content">
           <form name="fr" action="/order/or_main" method="post" onsubmit="return false">
        	<div class="orinfo">
                <div style="width:80%;">
                    <div class="about-introduction-content" style="margin-bottom: 30px">
                      <h3 style="padding:10px 0px">리워드정보</h3>
                       <div class="tedori">
                        <div class="info2">
                          <div style="width:20%">
                          	<p>리워드 구성</p>
                          </div>
                          <div style="width:80%">
                          <c:choose>
                           <c:when test="${rvo.reward_no != null }">
                          	<input type="hidden" id="re_no" name="reward_no" value="${rvo.reward_no }">
                          	<input type="text" class="giftTex" id="re_title" value="${rvo.reward_title }" readonly>
                          	</c:when>
                           <c:otherwise>
                            <input type="hidden" id="re_no" name="reward_no" value="0">
                          	<input type="text" class="giftTex" id="re_title" value="선물없이 후원하기" readonly>
                           </c:otherwise>
                          </c:choose>
                          </div>
                          <div class="blog-btn">
                          	<input type="button" class="main-btn" id="gift" value="변경" style="line-height:10px; padding:10px">
                          </div>
                         </div>
                         <div class="info2">
                          <div style="width:20%">
                          	<p>리워드 금액</p>
                          </div>
                          <div style="width:80%">
                          <c:choose>
                           <c:when test="${rvo.reward_no != null }">
                          	<input type="text" class="giftTex" id="re_price" name="order_price" value="${rvo.reward_price }" style="width:30%;" readonly>원
                          	 </c:when>
                           <c:otherwise>
                           	<input type="text" class="giftTex" id="re_price" name="order_price" value="0" style="width:30%;" readonly>원
                            </c:otherwise>
                          </c:choose>
                          </div>
                           <!--  공간 맞추기용 -->
                          <div>
                          	<input type="button" id="gift" value="변경" style="visibility: hidden;" >
                          </div>
                           <!--  공간 맞추기용 -->
                         </div>
                         <div class="info2">
                          <div style="width:20%">
                          	<p>추가 후원금</p>
                          </div>
                          <div style="width:80%">
                          <c:choose>
                           <c:when test="${rvo.reward_no != null }">
                          	<input type="text" class="giftTex" id="order_plus" name="order_plus" value="0" style="width:30%; " readonly>원
                           </c:when>
                           <c:otherwise>
                            <input type="text" class="giftTex" id="order_plus" name="order_plus" value="${param.mny }" style="width:30%; " readonly>원
                           </c:otherwise>
                          </c:choose>
                          </div>
                           <!--  공간 맞추기용 -->
                          <div>
                          	<input type="button" id="gift" value="변경" style="visibility: hidden;">
                          </div>
                           <!--  공간 맞추기용 -->
                         </div>
                         <div class="info2">
                          <div style="width:20%">
                          	<p>예상 전달일</p>
                          </div>
                          <div style="width:80%">
                          	<input type="text" class="giftTex" id="re_shipmonth" value="${rvo.reward_shipmonth }" style="width:15%" readonly>
                          	<input type="text" class="giftTex" id="re_shipdate" value="${rvo.reward_shipdate }" style="width:30%" readonly>
                          </div>
                          <!--  공간 맞추기용 -->
                          <div>
                          	<input type="button" id="gift" value="변경" style="visibility: hidden;">
                          </div>
                           <!--  공간 맞추기용 -->
                         </div>
                        </div>
                        
                         
                    </div>
                    
                    <div class="about-introduction-content" style="margin-bottom: 30px">
                        <h3 style="padding:10px 0px">후원자 정보</h3>
                        <div class="tedori">
                        
                         <div class="info2">
	                          <div style="width:20%; padding-right: 10px">
	                          	<h5>연락처 *</h5>
	                          </div>
	                          <c:choose>
	                          	<c:when test="${mvo.mem_phone != null }">
	                         	 <div style="margin-bottom:15px">
	                          		<input type="text" id="phone" name="phone" value="${mvo.mem_phone }" style="margin-bottom:10px; width:100%; border:none" readonly>
	                          		<input type="hidden" id="hidcheck" value="1">
	                          		<!-- 공간 맞추기용 쓸모x -->
		                          	<input type="text" value="dddd" style="visibility: hidden;">
		                          	<!-- 공간 맞추기용 -->
	                          	 </div>
	                          	 <div style="margin-bottom:15px; margin-left:10px; visibility: hidden;">
		                          <!-- 공간 맞추기용 쓸모 x -->
		                          <input type="button" value="인증번호 발송">
		                          <input type="button" value="인증 확인">
		                          <!-- 공간 맞추기용 -->
		                          </div>
	                          	</c:when>
	                         	<c:otherwise>
	                         	<div style="margin-bottom:15px">
	                          	<input type="text" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요." style="margin-bottom:10px; width:100%"
	                          	 onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11">
	                          	<input id="checkNum" type="text" placeholder="인증번호를 입력해주세요." style="width:100%; visibility: hidden;">
	                          </div>
	                          <div style="margin-bottom:15px; margin-left:10px; text-align:right; width:30%">
	                          	<button type="button" class="main-btn" id="sendPhone" style="margin-bottom:10px; line-height:10px; padding:10px">인증번호 발송</button><br>
	                          	<input type="hidden" id="hidcheck" value="0">
	                          	<span id="timer" style="margin-right: 5px; color: red"></span><button class="main-btn" id="phoneCheck" type="button" style="visibility:hidden; line-height:10px; padding:10px" onclick="check()">인증 확인</button>
	                          </div>
	                          </c:otherwise>
	                          </c:choose>
                          </div>
                        
                        <div class="info2">
                        	<div style="width:20%; padding-right: 10px">
	                          	<h5>이메일</h5>
	                          </div>
	                          <div>
	                          	<input type="text" value="${mvo.mem_email }" name="pur_email" readonly style="border: none;">
	                          	<!-- 공간 맞추기용 쓸모x -->
	                          	<input type="text" value="dddd" style="visibility: hidden;">
	                          	<!-- 공간 맞추기용 -->
	                          </div>
	                          <div style="margin-bottom:15px; margin-left:10px; visibility: hidden; width:20%">
	                          <!-- 공간 맞추기용 쓸모 x -->
	                          <input type="button" value="인증번호 발송">
	                          <input type="button" value="인증 확인">
	                          <!-- 공간 맞추기용 -->
	                          </div>
                        </div>
                        
                        <div>
                        <p>* 위 연락처와 이메일로 후원 관련 소식이 전달됩니다.</p>
                        <p>* 연락처 및 이메일 변경은 설정 > 계정 설정에서 가능합니다.</p>
                        </div>
                        
                        </div>
                     </div>
                      
                      
                      <div class="about-introduction-content" style="margin-bottom: 30px">
                        <h3 style="padding:10px 0px; display: inline">배송지</h3> * 리워드 선택 시 필수입력 사항입니다.
                        <div id="shipping">
                      <c:choose>
                        <c:when test="${rvo.reward_no != null || vo.reward_no != null}">
                        <div class="tedori">
                        <div style="margin: 20px">
                		  <div style="margin: 20px 0px">
                			<p style="color: black">받는 사람 *</p>
                			<input type="text" id="receiver_name" name="receiver_name" placeholder="받는분 성함" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" maxlength="20">
                		  </div>
                		  <div class="adress">
                			<p style="color: black">주소 *</p>
                			<input type="text" id="sample6_postcode" name="address_no" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" placeholder="우편번호" readonly>
							<input type="button" class="main-btn" style="line-height:10px; padding:10px;" id="searchPost" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" readonly><br>
							<input type="text" id="sample6_address" name="address" placeholder="주소" style="width:100%; border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" readonly><br>
							<input type="text" id="sample6_detailAddress" name="address_detail" style="width:100%; border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" placeholder="상세주소" >
						  </div>
						   <div style="margin: 20px 0px">
                			<p style="color: black">연락처 *</p>
                			<input type="text" id="receiver_phone" name="receiver_phone" placeholder="받는분 연락처" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;"
                			 onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11">
                		  </div>
                		  <div style="margin: 20px 0px">
                			<p style="color: black">배송 메세지</p>
                			<input type="text" id="shipping_req" name="shipping_req" placeholder="배송 메세지" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px; width:100%" maxlength="30">
                		  </div>
                		</div>
                        </div>
                        </c:when>
                        <c:otherwise>
                        <div class="tedori">
                        <div style="margin: 20px">
                		  <div style="margin: 20px 0px">
                			<p style="color: black">받는 사람 *</p>
                			<input type="text" id="receiver_name" name="receiver_name" placeholder="받는분 성함" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" maxlength="20" disabled>
                		  </div>
                		  <div class="adress">
                			<p style="color: black">주소 *</p>
                			<input type="text" id="sample6_postcode" name="address_no" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" placeholder="우편번호" disabled>
							<input type="button" class="main-btn" style="line-height:10px; padding:10px;" id="searchPost" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" disabled><br>
							<input type="text" id="sample6_address" name="address" placeholder="주소" style="width:100%; border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" disabled><br>
							<input type="text" id="sample6_detailAddress" name="address_detail" style="width:100%; border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;" placeholder="상세주소" disabled>
						  </div>
						   <div style="margin: 20px 0px">
                			<p style="color: black">연락처 *</p>
                			<input type="text" id="receiver_phone" name="receiver_phone" placeholder="받는분 연락처" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px;"
                			 onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11" disabled>
                		  </div>
                		  <div style="margin: 20px 0px">
                			<p style="color: black">배송 메세지</p>
                			<input type="text" id="shipping_req" name="shipping_req" placeholder="배송 메세지" style="border: 1px solid gray; margin: 3px 0px; padding: 3px; border-radius:5px; width:100%" maxlength="30" disabled>
                		  </div>
                		</div>
                        </div>
                        </c:otherwise>
                        </c:choose>
                        </div>
                    </div>
                    
                   
                    
                   
                      
                    </div>
                
                
                <div style="margin-left:20px; width:60%">
                
                 <div class="about-introduction-content">
                        <h3 style="padding:10px 0px">결제수단</h3>
                        <div class="tedori">
                          <div>
                           <div>
                          	<input type="radio" > 카드 및 계좌
                          	<input type="radio" > 네이버페이
                           </div>
                           <hr>
                           
                           	<div class="info2" style="margin:10px 0px">
                        	 <div class="ortitle" style="width:100%; margin-top: 0px">
						        <div class="proimg" style="margin-right: 10px; padding-left: 0px">
						            <img src="${pvo.pro_file }" width="100" height="50" alt="">
						        </div>
						        <div>
						            <div class="explain-list">
						                <span><b>@@카드</b></span> 
						                <p>************1234</p>
						            </div>
						        </div>                            
						    </div>
	                          <div>
	                          	<input type="button" class="main-btn" value="변경" style="line-height:10px; padding:10px;">
	                          </div>
						   </div>
			            <div>
			            	<input type="checkbox"> 기본 결제수단으로 등록
			            </div>
						 
                          </div>
                        </div>
                    </div>
                
                    <div class="about-introduction-content" style="margin-bottom: 30px">
                    	<div class="info" style="margin-top: 55px; font-size: 20px">
                    		<div style="width:30%; margin-right: 30px">
                    			<p style="color:red; font-size: 20px;"><b>최종 후원 금액</b></p>
                    		</div>
                    		<div>
                    			<input type="hidden" id="prono" name="pro_no" value="${pvo.pro_no }">
                    			<c:choose>
                    			 <c:when test="${rvo.reward_no != null }">
                    				<input type="text" id="totalRe" name="total_price" value="${rvo.reward_price }" style="width:80%; text-align: right; padding-right: 15px; border:none" readonly >원
                    			 </c:when>	
                    			 <c:otherwise>
                    			 	<input type="text" id="totalRe" name="total_price" value="${param.mny}" style="width:80%; text-align: right; padding-right: 15px; border:none" readonly >원
                    			 </c:otherwise>
                    			</c:choose>
                    		</div>
                           </div>
                       </div>
                         
                         <div style="padding-bottom: 20px">
                         <p>프로젝트가 무산되거나 중단된 경우, 예약된 결제는 자동으로 취소됩니다.</p>
                         </div>
                         
                         <div>
                           <div>
                             <div style="display:inline-block; width: 85%">
                           	 <input type="checkbox" id="agree1"> 개인정보 제 3자 동의
                           	 </div>
                           	 <div style="display:inline-block;">
                           	 	<button type="button" id="agree" style="border:none; background-color: transparent; color: blue"> 내용보기 </button>
                           	 </div>
                           </div>
                           <div>
                            <div style="display:inline-block; width: 85%">
                           	 <input type="checkbox" id="agree2"> 후원 유의사항 확인
                           	</div>
                           	<div style="display:inline-block;">
                           		<input id="read" type="button" value="열기 ▼" style="border:none; background-color: transparent;">
                           	</div>
                           	<div class="readme" style="display: none; margin: 10px 0px;">
                           		<p style="font-size: 14px; color:black">* 후원은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.</p>
	                           	 <p style="margin-left: 10px; font-size: 14px; color:black">LetEarth에서의 후원은 아직 실현되지 않은 프로젝트가 실현될 수 있도록
	                           	 제작비를 후원하는 과정으로, 기존의 상품 또는 용역을 거래의 대상으로
	                           	 하는 매매와는 차이가 있습니다. 따라서 전자상거래법상 청약철회 등의
	                           	 규정이 적용되지 않습니다.
	                           	 </p>
	                           	 <br>
	                           	 <p style="font-size: 14px; color: black;">* 프로젝트는 계획과 달리 진행될 수 있습니다.</p>
	                           	 <p style="margin-left: 10px; font-size: 14px; color:black">예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연,
	                           	 변경되거나 무산될 수도 있습니다. 본 프로젝트를 완수할 책임과 권리는 창작자에게 있습니다.
	                           	 </p>
                           	</div>
                           <div>
                           	 <input type="hidden" name="order_no" value="${order_no }">
                           	 <input type="button" value="후원하기" style="width:100%" onclick="requestPay()">
                           </div>
                         </div>
                        
                   </div>
	            </div>
                
                
          </div>
          </form>
         </div>
         </div>
               <!-- modal -->
               <div id="dark"></div>
               <%@ include file="or_giftMo.jsp" %>
<%--                <%@ include file="or_addressMo.jsp" %> --%>
               <%@ include file="or_agreeMo.jsp" %>
    
    <!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>

</body>
</html>