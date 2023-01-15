<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	<br><br><br><br><br><br><br><br><br>
 	
 	
 	<div class="sidebar__single sidebar__category">
        <h3 class="sidebar__title">사용자 인증 결과</h3>
        <ul class="sidebar__category-list">
            <li class="sidebar__category-list-item">사용자 번호 :${userInfo.user_seq_no }</li>
            <li class="sidebar__category-list-item"> 이름 : ${userInfo.user_name }</li>
            <li class="sidebar__category-list-item">등록 계좌수 : ${userInfo.res_cnt }</li>
        </ul>
    </div>
    <div class="sidebar__single sidebar__category">
		<form method="get" action="/openbanking/accountList">

			<input type="hidden" name="access_token" value="${sessionScope.access_token }">
			<%-- 		<input type="hidden" name="user_seq_no" value="${responseToken.user_seq_no }"> --%>
			<input type="hidden" name="user_seq_no" value="${userInfo.user_seq_no }"> 
			<input type="hidden" name="include_cancel_yn" value="Y"> 
			<input type="hidden" name="sort_order" value="D">
			<button type="submit" class="tbtn">
			<b style="color: #e3cffc;">내 보유 계좌&nbsp;</b>보러 가기
			</button>
		</form>
	</div>
	 
 	
 	
 	
 		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	