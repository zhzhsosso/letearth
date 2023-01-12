<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/board.css">
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
</style>
<script>
function myFunDetail(num){
	// 펀딩 상세 조회
	$.ajax({
		url:"/mypage/myFunDetail?order_no="+num,
		type:"get",
		datatype:"html",
		success:function(data){
			$("#myFunding").html(data);
		}	
	});
}
</script>
<br><br>
<div class="board_list_wrap">
	<div class="board_list">
		<div class="top">
			<div class="date3">주문번호</div>
			<div class="date3">프로젝트</div>
			<div class="date3">구매날짜</div>
			<div class="date3">리워드</div>
			<div class="date3">가격</div>
			<div class="date3">배송상태</div>
		</div>
		
		<c:forEach var="ordList" items="${ordList }">
			<div>
				<div class="date3"><span id="myFunDetail" onclick="myFunDetail(${ordList.order_no });">${ordList.order_trade_num }</span></div>
				<div class="date3"><a href="/prodetail/info?pro_no=${ordList.pro_no}">${ordList.pro_title }</a></div>
				<div class="date3"><fmt:formatDate value="${ordList.order_date }"/></div>
				<div class="date3">${ordList.reward_title }</div>
				<div class="date3"><fmt:formatNumber value="${ordList.total_price }" pattern="##,### 원"/></div>
				<div class="date3">
				<c:choose>
					<c:when test="${ordList.shipping_status == 1 }">
						결제완료
					</c:when>
					<c:when test="${ordList.shipping_status == 2 }">
						배송준비중
					</c:when>
					<c:when test="${ordList.shipping_status == 3 }">
						<a href="#">배송시작</a>
					</c:when>
					<c:when test="${ordList.shipping_status == 4 }">
						배송완료
					</c:when>
					<c:when test="${ordList.shipping_status == 5 }">
						펀딩취소
					</c:when>
				</c:choose>
				</div>
			</div>
		</c:forEach>


	</div>
</div>