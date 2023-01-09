<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	<br><br><br><br><br><br><br><br><br>
 	
 	<div class="sidebar__single sidebar__category">
        <h3 class="sidebar__title">사용자 > 관리자 후원</h3><!-- /.sidebar__title -->
        <ul class="sidebar__category-list">
            <li class="sidebar__category-list-item">${withdrawOK} </li>
        </ul>
        
        <br><br><br>
        
        <ul class="sidebar__category-list">
       	 <li class="sidebar__category-list-item">거래내역조회 전에 개발자사이트에 데이터넣고오기</li>
        </ul>
        
        <form method="post" action="/openbanking/transfer" >
         	 <input type="hidden" name="access_token" value="${withdrawRequestVO.access_token }">
         	 <input type="hidden" name="check_type" value="1"> <!-- 출금 -->
         	 <input type="hidden" name="tran_dtime" value="20221104070455">
         	 <input type="hidden" name="req_cnt" value="1">
         	 
         	 <input type="hidden" name="tran_no" value="1">
         	 <input type="hidden" name="org_bank_tran_id" value="${withdrawRequestVO.bank_tran_id }">
         	 <input type="hidden" name="org_bank_tran_date" value="20230109"> <!-- 8자리 -->
         	 <input type="hidden" name="org_tran_amt" value="1000">
         	 
			<button type="submit" class="main-btn" type="button">거래내역조회</button>
      	</form>
      	
      	
    </div>
 	
 	
 	
 	
 	
 		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>