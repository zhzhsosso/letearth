<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="../resources/assets/js/jquery.serialize-object.min.js"></script>

<script type="text/javascript">

</script>
 	
 	<br><br><br><br><br><br><br><br><br>
 	
 	<div class="sidebar__single sidebar__category">
        <form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get">
		<!-- 고정값: code -->
		<input type="hidden" name="response_type" value="code">
		<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
		<input type="hidden" name="client_id" value="be6aa2c4-8b34-4401-9c54-49643df0e522">
		<!-- 사용자인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
		<input type="hidden" name="redirect_uri" value="http://localhost:8080/openbanking/callback">
		<!-- Access Token 권한 범위 -->
		<input type="hidden" name="scope" value="login inquiry transfer oob">
		<!-- CSRF 보안위협에 대응하기 위해 이용기관이 세팅하는 난수값 32자리 -->
		<input type="hidden" name="state" value="12345678123456781234567812345678">
		<!-- 사용자인증타입 구분주 2)(0:최초인증, 1:재인증, 2:인증생략) -->
		<input type="hidden" name="auth_type" value="0">
		
		
		<div class="btnbtn">
	         <div class="blog-btn">
	            <button type="submit" class="main-btn" type="button">사용자 인증</button>
	         </div>
        </div>

	</form>
    </div>
 	 <!-- 인증 요청 작업 수행 -->
	
 	
 	<div class="sidebar__single sidebar__category">
        <h3 class="sidebar__title">토큰발급</h3>
        <ul class="sidebar__category-list">
            <li class="sidebar__category-list-item">access_token : ${responseTokenVO.access_token }</li>
            <li class="sidebar__category-list-item">token_type : ${responseTokenVO.token_type }</li>
            <li class="sidebar__category-list-item">expires_in : ${responseTokenVO.expires_in }</li>
            <li class="sidebar__category-list-item">refresh_token : ${responseTokenVO.refresh_token }</li>
            <li class="sidebar__category-list-item">scope : ${responseTokenVO.scope }</li>
            <li class="sidebar__category-list-item">user_seq_no : ${responseTokenVO.user_seq_no }</li>
        </ul><!-- /.sidebar__category-list -->
    </div>
    
	<div class="sidebar__single sidebar__category">
 		<!-- 오픈뱅킹 자산 조회 버튼 - 토큰 발급 후 이동 -->
		 <!-- sessionToken 값이 있어야 자산 조회 버튼 생성 -->	
<%-- 	     <c:if test="${not empty sessionScope.token}"> --%>
                <!-- 자산 조회를 위한 인증 요청 작업 수행 -->
                <form method="get" action="/openbanking/userInfo" >
                  <input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
                  <input type="hidden" name="user_seq_no" value=${responseTokenVO.user_seq_no }>
				  <input type="submit" value="내 자산조회">
                </form>
<%-- 		</c:if> --%>



		<!-- 출금이체 : 관리자가 구매자 계좌에서 출금 -->
				<form method="post" action="withdraw">
						<input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
						<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }">
						<input type="hidden" name="cntr_account_type" value="N">
						<input type="hidden" name="cntr_account_num" value="1234123412341234"> <!-- 렛어스 계좌번호-->
						<input type="hidden" name="dps_print_content" value="렛어스">
<!-- 						<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> -->
						<input type="hidden" name="fintech_use_num" value="120220234388941212225903"> <!-- 구매자의 핀테크번호 -->
						
						<input type="hidden" name="tran_amt" value="1000"> <!-- 금액 -->
						<input type="hidden" name="tran_dtime" value="20221104070455"> <!-- 날짜 14자리 -->
						<input type="hidden" name="req_client_name" value="정지현"> <!-- 구매자 이름 -->
						<input type="hidden" name="req_client_num" value="HONGGILDONG1211">
						<input type="hidden" name="transfer_purpose" value="TR"> <!-- 송금하기 -->
						<input type="hidden" name="req_client_bank_code" value="011"> <!-- 구매자 은행코드 -->
						<input type="hidden" name="req_client_account_num" value="300000000001"> <!-- 구매자 계좌번호-->
						
						<input type="hidden" name="recv_client_name" value="렛어스"> <!-- 수취인 이름 -->
						<input type="hidden" name="recv_client_bank_code" value="004"> <!-- 렛어스 은행코드 -->
						<input type="hidden" name="recv_client_account_num" value="1234123412341234"> <!-- 렛어스 계좌번호 -->
						
						<input type="submit" value="후원금 받기">	
					</form>
					
					
				
				
				

			<!-- 입금이체 : 관리자가 판매자 계좌로 입금 -->
				<form method="post" action="/openbanking/deposit">
					<input type="hidden" name="access_token" value="${responseTokenVO.access_token }">
					<input type="hidden" name="cntr_account_type" value="N">
					<input type="hidden" name="cntr_account_num" value="1234123412341234">
					<input type="hidden" name="wd_pass_phrase" value="NONE"> <!-- 테스트환경은 NONE을 사용 -->
					<input type="hidden" name="wd_print_content" value="정산해요">
					<input type="hidden" name="name_check_option" value="off">
					<input type="hidden" name="tran_dtime" value="20230106101921">
					<input type="hidden" name="req_cnt" value="1">
					
					<input type="hidden" name="tran_no" value="1">
					<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }">
					<input type="hidden" name="fintech_use_num" value="120220234388941212225903">
<!-- 					<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> -->
					<input type="hidden" name="print_content" value="정산해요">
					<input type="hidden" name="tran_amt" value="500"> <!-- 금액 -->
					
					<input type="hidden" name="req_client_name" value="정지현"> 
					<input type="hidden" name="req_client_bank_code" value="011"> <!-- 은행 코드 -->
					<input type="hidden" name="req_client_account_num" value="300000000001">
					
					<input type="hidden" name="req_client_num" value="HONGGILDONG1211">
					<input type="hidden" name="transfer_purpose" value="TR">
					
					<input type="submit" value="정산하기">
				</form>
	</div>

 	
 	
 	 	<br><br><br><br><br><br><br><br><br> 	<br><br><br><br><br><br><br><br><br>
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	   
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	