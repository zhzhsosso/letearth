<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->

<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>정산</title>


<style type="text/css">


#sbtn {
	position: absolute;
	top: 0px;
	right: -23%;
	background-color: #A4AC85;
	height: 35px;
}

#repSelector {
  width : 15%;
  height : 4px;
  background-color : #D7D1B9;
  border : 0;
  
   position: relative;
   top: -10px; 
/*    left: 380px;  */
   left: 42.5%;
}

#repSelector1{
   position: relative;
   top: -15px; 
   
}

  /*페이징*/
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #89A378;
    border-color: #89A378;
}

/*셀렉트 꾸미기*/
/* The container must be positioned relative: */
.fcntr {
  position: relative;
  font-family: Arial;
}

.fcntr select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: #BFCC97;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {
  color: #6c757d;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  font-weight: bolder;
  border-radius : 0.25rem;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: #EEF5E6;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}


/*모달 관리자 */
.form-control1 {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    
}

.sidebar__single sidebar__category .btnbtn .main-btn {
	color: #A4AC85;
}


</style>
</head>
<body>

    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	
 	
<!-- 관리자 페이지 -->
 	
 	<c:if test="${sessionScope.mem_id eq 'admin' }">
 	<section class="contact-form-area">
		<div style="display: flex;">

			<!-- 사이드바 -->
			<%@ include file="../include/adSide1.jsp"%>

			<div class="container">
				<br> <br> <br> <br> <br> <br>

				<!-- 어드민 -->
				<h2 class="box-title" align="center">
					<b style="color: #6F7B63">정산관리</b> <br> <br> <br>
				</h2>
				<hr id="repSelector" align="center">
				<div class="col-xs-12" style="font-size: 16px;">
					<div style="font-size: 1.5rem; cursor: pointer;" align= "left" id="aaadiv">
						<span id="hov"> <a id="list2">정산하기</a>
							| <a href="/openbanking/useroauth2">정산완료</a>
						</span>
							<hr id="repSelector1">	
					</div>

					<!-- 어드민 -->
					<br>
					<div class="box" style="border: none;">
						<br>
						<div class="box-header">
							<br>
						</div>
						<br>
						<!-- memAll -->
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action="" method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0" " id="vc">
											<th style="text-align: center; width : 7%; table-layout: fixed;">프로젝트 번호</th>
											<th style="text-align: center;" >프로젝트 이름</th>
											<th style="text-align: center;">아이디</th>
											<th style="text-align: center;">펀딩 종료날짜</th>
											<th style="text-align: center;">목표금액</th>
											<th style="text-align: center;">달성금액</th>
											<th style="text-align: center;">정산상세</th>
										</tr>

										<c:forEach var="st" items="${fproList }">
											<tr>
												<td style="padding-left: 10px; text-align:center; vertical-align:middle; color: #414934;">${st.pro_no }</td>
												<td style="font-size: 15px;">${st.pro_title } </a></td>
												<td style="font-size: 15px;">${st.mem_id }</td>
												<td style="font-size: 15px;">${st.pro_ed_dt }</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${st.pro_gp }" />원</td>
												<td style="font-size: 15px;"><fmt:formatNumber
														value="${st.pro_tp }" />원</td>
												<td style="font-size: 15px;"><span
													class="label label-info"><a
													href="/openbanking/stDetail?pro_no=${st.pro_no }"
													style="color: green"> 정산상세 </a></span></td>
													
											</tr>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- memAll -->

					</div>

					<!-- 페이징처리 -->
					<div class="box-footer clearfix" id="paging">
						<ul class="pagination pagination-sm no-margin pull-left">
							<c:if test="${pvo.prev }">
								<li><a href="/openbanking/useroauth?page=${pvo.startPage-1 }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="/openbanking/useroauth?page=${idx }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li><a href=/openbanking/useroauth?page=${pvo.endPage+1 }">»</a></li>
								<!-- 11 -->
							</c:if>
						</ul>
					</div>
					<!-- 페이징처리 -->
				</div>
			</div>
		</div>
	</section>
	</c:if>
	
	
	
<!-- 관리자 페이지 -->	




<!-- 판매자 계좌등록 처음일때 -->
	<c:if test="${sessionScope.mem_id ne null && sessionScope.mem_id ne 'admin'}">
	<section class="contact-form-area">
        <div class="container">
		<br><br><br><br><br><br>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>계좌 등록하기</span>
                        <h3 class="title">사용자 인증을 진행해주세요</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form id="contact-form" action="assets/contact.php" method="post">
                        <div class="conact-form-item">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    
                                    <div class="input-box mt-20 text-center">
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
                                </div>
                            </div>
                        </div>
                    </form>
                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>
    </c:if>
    
<!-- 판매자 계좌등록 처음일때 -->
	
 	

 	
 	<br><br><br><br><br><br><br><br><br>
 	<!-- 사용자인증 -->
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
 	 
 	 
 	
	
 	
<!--  	<div class="sidebar__single sidebar__category"> -->
<!--         <h3 class="sidebar__title">토큰발급</h3> -->
<!--         <ul class="sidebar__category-list"> -->
<%--             <li class="sidebar__category-list-item">access_token : ${responseTokenVO.access_token }</li> --%>
<%--             <li class="sidebar__category-list-item">token_type : ${responseTokenVO.token_type }</li> --%>
<%--             <li class="sidebar__category-list-item">expires_in : ${responseTokenVO.expires_in }</li> --%>
<%--             <li class="sidebar__category-list-item">refresh_token : ${responseTokenVO.refresh_token }</li> --%>
<%--             <li class="sidebar__category-list-item">scope : ${responseTokenVO.scope }</li> --%>
<%--             <li class="sidebar__category-list-item">user_seq_no : ${responseTokenVO.user_seq_no }</li> --%>
<!--         </ul>/.sidebar__category-list -->
<!--     </div> -->
    
    
    
    
<!-- 	<div class="sidebar__single sidebar__category"> -->
<!--  		<!-- 오픈뱅킹 자산 조회 버튼 - 토큰 발급 후 이동 --> -->
<!-- 		 <!-- sessionToken 값이 있어야 자산 조회 버튼 생성 -->	 -->
<%-- <%-- 	     <c:if test="${not empty sessionScope.token}"> --%> --%>
<!--                 자산 조회를 위한 인증 요청 작업 수행 -->
<!--                 <form method="get" action="/openbanking/userInfo" > -->
<!-- <!--                   <input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE3MTk1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2ODEyMDMwMTUsImp0aSI6IjZjODZkM2Q4LTE4YTUtNDEyZS1iMjRkLWYyYzdkMDFhNGYzOSJ9.zfT7xFPJiL9BD5bc9IBrcP3PSVA_wnI69vjJhokrq4g"> --> -->
<%--                   <input type="hidden" name="access_token" value="${responseTokenVO.access_token }"> --%>
<!-- <!--                   <input type="hidden" name="user_seq_no" value="1101017195"> --> -->
<%--                   <input type="hidden" name="user_seq_no" value=${responseTokenVO.user_seq_no }> --%>
<!-- 				  <input type="submit" value="내 자산조회"> -->
<!--                 </form> -->
<%-- <%-- 		</c:if> --%> --%>



		<!-- 출금이체 : 관리자가 구매자 계좌에서 출금 -->
<!-- 				<form method="post" action="withdraw"> -->
<%-- 						<input type="hidden" name="access_token" value="${responseTokenVO.access_token }"> --%>
<%-- 						<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }"> --%>
<!-- 						<input type="hidden" name="cntr_account_type" value="N"> -->
<!-- 						<input type="hidden" name="cntr_account_num" value="1234123412341234"> 렛어스 계좌번호 -->
<!-- 						<input type="hidden" name="dps_print_content" value="렛어스"> -->
<!-- <!-- 						<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> --> -->
<!-- 						<input type="hidden" name="fintech_use_num" value="120220234388941212225903"> 구매자의 핀테크번호 -->
						
<!-- 						<input type="hidden" name="tran_amt" value="1000"> 금액 -->
<!-- 						<input type="hidden" name="tran_dtime" value="20221104070455"> 날짜 14자리 -->
<!-- 						<input type="hidden" name="req_client_name" value="정지현"> 구매자 이름 -->
<!-- 						<input type="hidden" name="req_client_num" value="HONGGILDONG1211"> -->
<!-- 						<input type="hidden" name="transfer_purpose" value="TR"> 송금하기 -->
<!-- 						<input type="hidden" name="req_client_bank_code" value="011"> 구매자 은행코드 -->
<!-- 						<input type="hidden" name="req_client_account_num" value="300000000001"> 구매자 계좌번호 -->
						
<!-- 						<input type="hidden" name="recv_client_name" value="렛어스"> 수취인 이름 -->
<!-- 						<input type="hidden" name="recv_client_bank_code" value="004"> 렛어스 은행코드 -->
<!-- 						<input type="hidden" name="recv_client_account_num" value="1234123412341234"> 렛어스 계좌번호 -->
						
<!-- 						<input type="submit" value="후원금 받기">	 -->
<!-- 					</form> -->
					
					
				
				
				

			<!-- 입금이체 : 관리자가 판매자 계좌로 입금 -->
<!-- 				<form method="post" action="/openbanking/deposit"> -->
<%-- 					<input type="hidden" name="access_token" value="${responseTokenVO.access_token }"> --%>
<!-- <!-- 					<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE3MDIxIiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2ODEwODc2MDIsImp0aSI6IjEwOTFlM2MwLWQxMDMtNDVkOC04ZTU1LWFjNGE2YTcxYTUwMSJ9.0FAFGwfG12VFnFoTA-L1LKDLOlS-j2JKWeLtvfcOOGk"> --> -->
<!-- 					<input type="hidden" name="cntr_account_type" value="N"> -->
<!-- 					<input type="hidden" name="cntr_account_num" value="1234123412341234"> -->
<!-- 					<input type="hidden" name="wd_pass_phrase" value="NONE"> 테스트환경은 NONE을 사용 -->
<!-- 					<input type="hidden" name="wd_print_content" value="정산해요"> -->
<!-- 					<input type="hidden" name="name_check_option" value="off"> -->
<!-- 					<input type="hidden" name="tran_dtime" value="20230106101921"> -->
<!-- 					<input type="hidden" name="req_cnt" value="1"> -->
					
<!-- 					<input type="hidden" name="tran_no" value="1"> -->
<%-- <%-- 					<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }"> --%> --%>
<!-- 					<input type="hidden" name="bank_tran_id" value="M202202343U123456789"> -->
<!-- 					<input type="hidden" name="fintech_use_num" value="120220234388941212225903"> -->
<!-- <!-- 					<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> --> -->
<!-- 					<input type="hidden" name="print_content" value="정산해요"> -->
<!-- 					<input type="hidden" name="tran_amt" value="500"> 금액 -->
					
<!-- 					<input type="hidden" name="req_client_name" value="정지현">  -->
<!-- 					<input type="hidden" name="req_client_bank_code" value="011"> 은행 코드 -->
<!-- 					<input type="hidden" name="req_client_account_num" value="300000000001"> -->
					
<!-- 					<input type="hidden" name="req_client_num" value="HONGGILDONG1211"> -->
<!-- 					<input type="hidden" name="transfer_purpose" value="TR"> -->
					
<!-- 					<input type="submit" value="정산하기"> -->
<!-- 				</form> -->
<!-- 	</div> -->

 	
 	
 	 	<br><br><br><br><br><br><br><br><br> 	<br><br><br><br><br><br><br><br><br>
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	   
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	</body>
	</html>
	