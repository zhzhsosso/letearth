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
.btn {
	background: #674df0;
    line-height: 30px;
    padding: 0 15px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 3px;
    color: #fff;
    margin-right: 10px;
}
</style>
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
</script>
<script type="text/javascript">
function deleteOrder(ord_no) {
	Swal.fire({
		title: '주문을 취소하시겠습니까?',
		text: '취소 후 복구는 불가합니다.',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
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
			    	swal('취소 완료 되었습니다.','','info');
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
</script>
	<br>
	<h3 style="text-align: center;">주문 상세내역</h3> <br><br>
	<div class="board_list">
		<div class="top">
			<div class="date3">주문번호</div>
			<div class="title">${detailOrder.order_no }</div>
		</div>
		<div class="top">
			<div class="date3">주문일자</div>
			<div class="title"><fmt:formatDate value="${detailOrder.order_date }"/></div>
		</div>
		<div class="top">
			<div class="date3">주문자</div>
			<div class="title"></div>
		</div>
		<div class="top">
			<div class="date3">승인여부</div>
			<div class="title">프로젝트</div>
		</div>
		<div class="top">
			<div class="date3">주문처리상태</div>
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
			<div class="date3">수취인</div>
			<div class="title">${detailOrder.receiver_name }</div>
		</div>
		<div class="top">
			<div class="date3">주소</div>
			<div class="title">${detailOrder.address } ${detailOrder.address_detail }</div>
		</div>
		<div class="top">
			<div class="date3">우편번호</div>
			<div class="title">${detailOrder.address_no }</div>
		</div>
		<div class="top">
			<div class="date3">전화번호</div>
			<div class="title">${detailOrder.receiver_phone }</div>
		</div>
	</div>
	<br>
	<div class="board_list">
		<div class="top">
			<div class="date3">배송상태</div>
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
			<div class="date3">택배사</div>
			<div class="title">${detailOrder.shipping_com }</div>
		</div>
		<div class="top">
			<div class="date3">운송장번호</div>
			<div class="title">${detailOrder.shipping_no }</div>
		</div>
	</div>
	<br><br>
	<div class="text-center">
		<span class="btn" id="back" onclick="back();">돌아가기</span>
		<c:if test="${detailOrder.shipping_status < 3 }">
			<span class="btn" id="deleteOrder" onclick="deleteOrder(${detailOrder.order_no});">주문취소</span>
		</c:if>
	</div>