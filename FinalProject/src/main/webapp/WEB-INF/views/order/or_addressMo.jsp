<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
	#shipMo {
		border: 1px solid #dcdcdc;
		position: fixed;
		height: 500px;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		padding: 10px;
		display: none;
		z-index:9999;
		background: #fff;
	}
	
	#shipMoCl {
		background: none;
		border: 0;
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 20px;
	}
	
	#shipMo-btn {
		padding: 5px;
		margin: 10px;
		width: 20%;
		border: 1px;
		border-style: solid;
		border-radius: 5px;
		background: white;
		color: black;
		font-size: 12px;
	}
	
	#shipAddMo {
		border: 1px solid #dcdcdc;
		position: fixed;
		height: 530px;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		padding: 10px;
		display: none;
		z-index:9999;
		background: #fff;
	}
	
	#shipAddMoCl {
		background: none;
		border: 0;
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 20px;
	}
	
	.shipbtn {
		box-shadow: 1px 1px 3px 1px black;
		padding: 5px;
		margin: 10px;
		width: 20%;
		border: 1px;
		border-radius: 5px;
		background: white;
		color: black;
		font-size: 12px;
	}
	
	.adress > input {
		border: 1px solid;
		border-radius:5px;
		margin: 3px 0px;
		padding: 3px;
	}
	</style>
	
	<script>
	$(function(){
		
		$("#shipChange").click(function(){
			$('#shipAddMo').fadeIn();
			$("#dark").show();
			
			$(".container").on('scroll thuchmove mousewheel', function(event){
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		
		$("#shipAddMoCl").click(function(){
			$('#shipAddMo').fadeOut();
			$("#dark").hide();
			
			$(".container").off('scroll thuchmove mousewheel');
		});
		
		
		$("#shipAddMo-btn").click(function(){
			var order_no = $("#orderN").val();
			var receiver_name = $('#receiver_name').val();
			var address_no = $('#sample6_postcode').val();
			var address = $('#sample6_address').val();
			var address_detail = $('#sample6_detailAddress').val();
			var receiver_phone = $('#receiver_phone').val();
			var shipping_req = $('#shipping_req').val();
			var order_status = $("#orderS").val();
			
			if(order_status == 2) {
				alert("후원취소 진행 중이므로 배송지 변경 불가합니다.");
				
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
			
			$.ajax({
				url:'${pageContext.request.contextPath}/order/shipChange',
				type:'post',
				data:
					{"order_no":order_no, "receiver_name":receiver_name,
					"address_no":address_no,"address":address,
					"address_detail":address_detail,"receiver_phone":receiver_phone,
					"shipping_req":shipping_req},
				success:function(shipResult){
					if(shipResult==1){
						alert("배송지가 변경되었습니다.");
						$("#shipAddMoCl").click();
						
						$("#shipInfo").load(window.location.href+ " #shipInfo");
					}
				}, 
				error:function(){
					alert("실패");
				}
			});
		});
		
	});
		
// 		$("#shipAdd").click(function(){
// 			$('#shipAddMo').show();
			
			
// 			$(".container").on('scroll thuchmove mousewheel', function(event){
// 				event.preventDefault();
// 				event.stopPropagation();
// 				return false;
// 			});
// 		});
		
// 		$("#shipAddMoCl").click(function(){
// 			$('#shipAddMo').hide();
// 			$('#shipMo').hide();
// 			$("#dark").hide();
			
// 			$(".container").off('scroll thuchmove mousewheel');
// 		});
		
// 		$(".addCancle").click(function(){
// 			$('#shipAddMo').hide();
			
// 			$(".container").off('scroll thuchmove mousewheel');
// 		});
		
// 	});
	
	
	
	
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

                
                
     	<!-- Modal -->
                <div id="shipAddMo" class="modal">
                  <div class="screen">
                  	<div style="margin: 20px 10px;">
                		<button type="button" id="shipAddMoCl"><i class="fa-solid fa-circle-xmark"></i></button> 
                		<h4><b>배송지 추가</b></h4>
                		<hr>
                	</div>
                		<div style="margin: 20px">
                		  <div style="margin: 10px 0px">
                			<p style="color: black">받는 사람</p>
                			<input type="text" id="receiver_name" placeholder="받는분 성함" style="border: 1px solid; margin: 3px 0px; padding: 3px; border-radius:5px;">
                		  </div>
                		  <div class="adress">
                			<p style="color: black">주소</p>
                			<input type="text" id="sample6_postcode" placeholder="우편번호" readonly>
							<button type="button" class="shipbtn" onclick="sample6_execDaumPostcode()" style="background-color:#6F7B63; color:white; font-size:15px; padding: 5px; width:25%">우편번호 찾기</button><br>
							<input type="text" id="sample6_address" placeholder="주소" style="width:100%" readonly><br>
							<input type="text" id="sample6_detailAddress" style="width:100%" placeholder="상세주소" >
						  </div>
						   <div style="margin: 10px 0px">
                			<p style="color: black">연락처</p>
                			<input type="text" id="receiver_phone" placeholder="받는분 연락처" style="border: 1px solid; margin: 3px 0px; padding: 3px; border-radius:5px;">
                		  </div>
                		  <div style="margin: 10px 0px">
                			<p style="color: black">배송 메세지</p>
                			<input type="text" id="shipping_req" placeholder="배송 메세지" style="border: 1px solid; margin: 3px 0px; padding: 3px; border-radius:5px;">
                		  </div>
                		</div>
                	  
                		<div style="text-align: center; margin: 0px 20px;">
                		<button class="shipbtn" id="shipAddMo-btn" style="width: 100%; background: #6F7B63; color: white; margin:0px; font-size:15px; padding: 5px">변경하기</button>
<!--                 		<button class="addCancle" id="shipAddMo-btn" style="width: 100%; background: red; color: white; margin:0px;">취소</button> -->
                		</div>
                  </div>
                </div>
</body>
</html>