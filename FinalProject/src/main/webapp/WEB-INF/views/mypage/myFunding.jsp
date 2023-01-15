<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/board.css">
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
    background:#A4AC85;
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
			$('html, body').scrollTop(0);
			$("#myFunding").html(data);
		}	
	});
}
</script>
			
<c:if test="${empty ordList }">
	<div class="row justify-content-center">
		<div style=" display: flex; align-items: center; padding-top: 5em;">
			<i class="fa-solid fa-circle-info fa-3x" style="color: #6F7B63;"></i>
			<h3 style="padding-left: 0.5em; color: #838694;">펀딩 프로젝트가 없습니다.</h3>
		</div>
	</div>
</c:if>
<c:if test="${not empty ordList }">
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
					<div class="date3">
						<c:choose>
					        <c:when test="${fn:length(ordList.pro_title) gt 10}">
						        <a href="/prodetail/info?pro_no=${ordList.pro_no}">
						        <c:out value="${fn:substring(ordList.pro_title, 0, 9)}...">
						        </c:out></a>
					        </c:when>
					        <c:otherwise>
								<a href="/prodetail/info?pro_no=${ordList.pro_no}">${ordList.pro_title }</a>
					        </c:otherwise>
						</c:choose>
					</div>
					<div class="date3"><fmt:formatDate value="${ordList.order_date }" pattern="yyyy-MM-dd"/></div>
					<c:choose>
						<c:when test="${not empty ordList.reward_title && fn:length(ordList.reward_title) gt 10}">
							<div class="date3">
						        <c:out value="${fn:substring(ordList.reward_title, 0, 9)}...">
						        </c:out></div>
						</c:when>
						<c:when test="${empty ordList.reward_title }">
							<div class="date3">후원</div>
						</c:when>
						<c:otherwise>
							<div class="date3">${ordList.reward_title }</div>
						</c:otherwise>
					</c:choose>
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
</c:if>



