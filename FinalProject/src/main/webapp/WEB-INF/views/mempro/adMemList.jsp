<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 헤더 -->
<%@ include file="../include/header.jsp"%>


<h1>admin/mempro/adMemList.jsp</h1>

<section class="contact-form-area">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="section-title text-center">
					<h3 class="title">회원리스트</h3>

				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-8">
			
<table border="1">
	<tr>
		<td>회원 아이디</td>
		<td>회원 이름</td>
		<td>회원 연락처</td>
		<td>회원 분류</td>
		<td>블랙리스트</td> <!-- mem_bdate 가 있다면 Y 없다면 N -->
		<td>상세정보</td>
	</tr>

	<c:forEach var="memVO" items="${memList }">
		<tr>
<%-- 		<td><a href="/mempro/adMemDetail?mem_id=${memVO.mem_id }">${memVO.mem_id }</a></td>--%>
			<td>${memVO.mem_id }</td>
			<td>${memVO.mem_name }</td>
			<td>${memVO.mem_phone }</td>
			
<!-- 회원분류 -->
			<c:choose>
				<c:when test="${memVO.mem_status == 0}">
					<td>구매회원</td>
				</c:when>
				<c:when test="${memVO.mem_status == 1}">
					<td>판매회원</td>
				</c:when>
				<c:when test="${memVO.mem_status == 2}">
					<td>관리자</td>
				</c:when>
				<c:when test="${memVO.mem_status == 3}">
					<td>블랙리스트</td>
				</c:when>
			</c:choose>
			
<!-- 블랙리스트 -->			
			<c:choose>
				<c:when test="${not empty memVO.mem_bdate }">
					<td>Y</td>
				</c:when>
				<c:when test="${empty memVO.mem_bdate }">
					<td>N</td>
				</c:when>
			</c:choose>
			<td><a href="/mempro/adMemDetail?mem_id=${memVO.mem_id }">상세정보</a>
		</tr>
	</c:forEach>

</table>

				<!-- 페이징처리 -->
				<div>
					<ul>

						<c:if test="${pvo.prev }">
							<li><a
								href="/report/adBlackList?page=${pvo.startPage-1 }">«</a></li>
							<!-- 10 -->
						</c:if>

						<c:forEach var="idx" begin="${pvo.startPage }"
							end="${pvo.endPage }" step="1">
							<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
								href="/report/adBlackList?page=${idx }">${idx }</a></li>
						</c:forEach>

						<c:if test="${pvo.next }">
							<li><a
								href="/report/adBlackList?page=${pvo.endPage+1 }">»</a></li>
							<!-- 11 -->
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

</section>
<!-- 푸터 -->
<%@ include file="../include/footer.jsp"%>
