<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/board2.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://kit.fontawesome.com/90a612e2ef.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
    height:100%;
    width:0%;
    background:#29f0b4;
}
</style>
<script>
$('#changeBtn').one('click',function(){
	$('#changeBtn').hide();
	$('#addr').append(
	'<div>' +
	'<input type="text" style="border: none; width: 150px;">' +
	'<input type="hidden" id="order_no" value="${detailOrder.order_no }">' +
	'<input type="text" id="address_no" style="border: none; width: 70px;">' +
	'<input type="text" id="address" style="border: none; width: 300px;">' +
	'<input type="text" id="address_detail" placeholder="상세주소" style="border: none; width: 130px;">' +
	'<button class="myBtn" onclick="changeAddr();" id="changeAddr">변경</button>' +
	'<button class="myBtn" onclick="change(${detailOrder.order_no});" id="change">저장</button>' +
	'</div>');
});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function changeAddr() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
			    addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
			    addr = data.jibunAddress;
			}
			
			if(data.userSelectedType === 'R'){
			    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			        extraAddr += data.bname;
			    }
			    if(data.buildingName !== '' && data.apartment === 'Y'){
			        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			    }
			    if(extraAddr !== ''){
			        extraAddr = ' (' + extraAddr + ')';
			    }
			    $('#address').attr('value',extraAddr);
			
			}
			
			$('#address_no').attr('value',data.zonecode);
			$('#address').attr('value',addr + extraAddr);
			
			$('#changeAddr').hide();
			document.getElementById("address_detail").focus();
       }
   }).open();
}
</script>
<script type="text/javascript">
function back(num){
	$(document).ready(function(){
		// 회원정보 수정
		$.ajax({
			url:"/mypage/myFunding",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myFunding").html(data);
			}	
		});
	});
}

function deleteOrder(ord_no) {
	Swal.fire({
		title: '주문을 취소하시겠습니까?',
		text: '취소 후 복구는 불가합니다.',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#A4AC85',
		cancelButtonColor: 'grey',
		confirmButtonText: '주문 취소',
		cancelButtonText: '닫기'
	}).then((result) => {
		if (result.isConfirmed) {   
			$.ajax({
				async : true,
			    type:'post',
			    url:"/mypage/deleteOrder",
			    data: {
			    	order_no:ord_no,
				},
			    dataType : "text",
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    success : function(resp) {
			    	Swal.fire({
    					icon : 'success',
    					title : '취소 완료 되었습니다.',
    					confirmButtonText : '확인',
    					confirmButtonColor: '#A4AC85'
    				})
		    		setTimeout(function () {
		    		 	$.ajax({
							url:"/mypage/myFunding",
							type:"get",
							datatype:"html",
							success:function(data){
								$("#myFunding").html(data);
							}	
						});
		    		}, 2000);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("ERROR : " + textStatus + " : " + errorThrown);
			    }        
			});
		} 
	})
}

function change(num) {
	$.ajax({
		async : true,
	    type:'post',
	    url:"/mypage/myFunDetail",
	    data: {
	    	address_no:$('#address_no').val(),
	    	address:$('#address').val(),
	    	address_detail:$('#address_detail').val(),
	    	order_no:$('#order_no').val(),
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) { 
	    	swal('변경되었습니다.','','info');
    		setTimeout(function () {
    		 	$.ajax({
					url:"/mypage/myFunDetail?order_no="+num,
					type:"get",
					datatype:"html",
					success:function(data){
						$("#myFunding").html(data);
					}	
				});
    		}, 2000);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}
</script>
	<br><br>
	<h3 style="text-align: center; color: #414934;" >주문 상세내역</h3>
	<br><br>
	<c:choose>
	<c:when test="${empty detailOrder.address }">
		<div class="board_list">
			<div class="top">
				<div class="num">주문번호</div>
				<div class="title">${detailOrder.order_trade_num }</div>
			</div>
			<div class="top">
				<div class="num">주문일자</div>
				<div class="title"><fmt:formatDate value="${detailOrder.order_date }" pattern="yyyy-MM-dd"/></div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div style=" display: flex; align-items: center; padding-top: 5em;">
				<i class="fa-solid fa-face-smile fa-3x" style="color: #6F7B63;"></i>
				<h3 style="padding-left: 0.5em; color: #838694;">소중한 후원 감사드립니다.</h3>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="board_list">
			<div class="top">
				<div class="num">주문번호</div>
				<div class="title">${detailOrder.order_trade_num }</div>
			</div>
			<div class="top">
				<div class="num">주문일자</div>
				<div class="title"><fmt:formatDate value="${detailOrder.order_date }" pattern="yyyy-MM-dd"/></div>
			</div>
			<div class="top">
				<div class="num">주문자</div>
				<div class="title">${detailOrder.receiver_name }</div>
			</div>
			<div class="top">
				<div class="num">주문처리상태</div>
				<c:choose>
					<c:when test="${detailOrder.order_status == 1}">
						<div class="title">결제완료</div>
					</c:when>
					<c:when test="${detailOrder.order_status == 2}">
						<div class="title">취소요청</div>
					</c:when>
					<c:when test="${detailOrder.order_status == 3}">
						<div class="title">취소완료</div>
					</c:when>
				</c:choose>
			</div>
		</div> <br>
		
		<div class="board_list">
			<div class="top">
				<div class="num">수령인</div>
				<div class="title">${detailOrder.receiver_name }</div>
			</div>
			<div class="top">
				<div class="num">우편번호</div>
				<div class="title">${detailOrder.address_no }</div>
			</div>
			<div class="top" id="addr">
				<div class="num">주소</div>
				<div class="title">${detailOrder.address } ${detailOrder.address_detail }</div>
				<c:if test="${detailOrder.shipping_status == 1 }">
					<div class="num1"><button class="myBtn" id="changeBtn">변경</button></div>
				</c:if>
			</div>
			<div class="top">
				<div class="num">전화번호</div>
				<div class="title">${detailOrder.receiver_phone }</div>
			</div>
		</div>
		<br>
		<div class="board_list">
			<div class="top">
				<div class="num">배송상태</div>
				<c:choose>
					<c:when test="${detailOrder.shipping_status == 1}">
						<div class="title">결제완료</div>
					</c:when>
					<c:when test="${detailOrder.shipping_status == 2}">
						<div class="title">배송준비중</div>
					</c:when>
					<c:when test="${detailOrder.shipping_status == 3}">
						<div class="title">배송중</div>
					</c:when>
					<c:when test="${detailOrder.shipping_status == 4}">
						<div class="title">배송완료</div>
					</c:when>
					<c:when test="${detailOrder.shipping_status == 5}">
						<div class="title">펀딩취소</div>
					</c:when>
				</c:choose>
			</div>
			<div class="top">
				<div class="num">택배사</div>
				<div class="title">${detailOrder.shipping_com }</div>
			</div>
			<div class="top">
				<div class="num">운송장번호</div>
				<div class="title">${detailOrder.shipping_no }</div>
			</div>
		</div>
	</c:otherwise>
	</c:choose>
	
	<br><br>
	<div class="text-center">
		<button class="myBtn" id="back" onclick="back();">돌아가기</button>
		<c:if test="${detailOrder.shipping_status < 2 }">
			<button class="myBtn" id="deleteOrder" onclick="deleteOrder(${detailOrder.order_no});">주문취소</button>
		</c:if>
	</div>