<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/90a612e2ef.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
	max-width: 100%;
    height:100%;
    width:0%;
    background:#A4AC85;
}
</style>
<script type="text/javascript">
function myProAdmin(num){
	// 주문내역 조회
	$.ajax({
		url:"/mypage/myProAdmin?pro_no="+num,
		type:"get",
		datatype:"html",
		success:function(data){
			$('html, body').scrollTop(0);
			$("#myProject").html(data);
		}	
	});
}
function myProUpdate(num){
	$.ajax({
		url:"/project/create?pro_no="+num,
		type:"get",
		datatype:"html",
		success:function(data){
			$('html, body').scrollTop(0);
			location.href='/project/create';
		}	
	});
}
</script>

<!-- 탭1 : 글 페이지 -->
	<div class="project-details-content-top">
		<!-- 프로젝트 시작 -->
		<div class="row justify-content-center">
		<c:if test="${empty proList }">
			<div class="row justify-content-center">
				<div style=" display: flex; align-items: center; padding-top: 5em;">
					<i class="fa-solid fa-circle-info fa-3x" style="color: #6F7B63;"></i>
					<h3 style="padding-left: 0.5em; color: #838694;">나의 프로젝트가 없습니다.</h3>
				</div>
			</div>
		</c:if>
			<c:forEach var="pro" items="${proList }" >
				<div class="col-lg-4 col-md-6 col-sm-9">
					<div class="explore-projects-item mt-30">
						<div class="explore-projects-thumb">
							<img src="../resources/upload/${pro.pro_thum}" width="100px;" height="300px;"> 
							<a href="/prodetail/info?pro_no=${pro.pro_no}" style="background: none;">
							<i class="fa-solid fa-heart" style="color: A4AC85;"></i>
							</a>
						</div>
						<div class="explore-projects-content">
							<div class="item d-flex align-items-center">
								<span style="background: #6F7B63;">D - ${pro.left_date}</span>
							<c:choose>
								<c:when test="${pro.pro_status == 1}">
									<span style="background: #6F7B63;" style="border: none;">임시저장</span>
								</c:when>
								<c:when test="${pro.pro_status == 2}">
									<span style="background: #6F7B63;" style="border: none;">승인요청</span>
								</c:when>
								<c:when test="${pro.pro_status == 3}">
									<span style="background: #6F7B63;" style="border: none;">승인</span>
								</c:when>
								<c:when test="${pro.pro_status == 4}">
									<span style="background: #6F7B63;" style="border: none;">반려</span>
								</c:when>
								<c:when test="${pro.pro_status == 5}">
									<span style="background: #6F7B63;" style="border: none;">판매중</span>
								</c:when>
								<c:when test="${pro.pro_status == 6}">
									<span style="background: #6F7B63;" style="border: none;">마감</span>
								</c:when>
								<c:when test="${pro.pro_status == 7}">
									<span style="background: #6F7B63;" style="border: none;">판매중지</span>
								</c:when>
								<c:when test="${pro.pro_status == 8}">
									<span style="background: #6F7B63;" style="border: none;">정산완료</span>
								</c:when>
							</c:choose>
							</div>  <br>
							<div>
							<a href="/prodetail/info?pro_no=${pro.pro_no}">
							<c:choose>
						        <c:when test="${fn:length(pro.pro_title) gt 7}">
							        <h3><c:out value="${fn:substring(pro.pro_title, 0, 6)}...">
							        </c:out></h3></c:when>
						        <c:otherwise>
						      	  <h3>${pro.pro_title }</h3>
						        </c:otherwise>
							</c:choose>
							</a>
							<small style="float: right;"><fmt:formatDate value="${pro.pro_cr_dt }" pattern="yyyy-MM-dd"/></small>
							</div>
							<br>
							<div class="projects-range">
								<div class="projects-range-content">
									<ul>
										<li>달성률:</li>
										<li id="rate">${pro.achievement_rate}%</li>
									</ul>
									<div id="rangeGraph">
										<span style="width: ${pro.achievement_rate}%"></span>
									</div>
								</div>
							</div>
							<div class="projects-goal">
								달성 금액: <span><fmt:formatNumber value="${pro.pro_tp }" pattern="#,###" /></span> 원 <br>
								목표 금액: <span><fmt:formatNumber value="${pro.pro_gp }" pattern="#,###" /></span> 원
							</div> <br>
							<c:choose>
								<c:when test="${pro.pro_status == 1}">
									<button type="button" class="myBtn2" style="border: none;" onclick="myProUpdate(${pro.pro_no});">프로젝트 작성</button>
								</c:when>
								<c:when test="${pro.pro_status == 5}">
									<button type="button" class="myBtn2" style="border: none;" onclick="myProAdmin(${pro.pro_no});">판매 관리</button>
								</c:when>
								<c:when test="${pro.pro_status == 6}">
									<button type="button" class="myBtn2" style="border: none;">판매 관리</button>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 프로젝트 끝 -->
	</div>
<!-- 탭1 -->