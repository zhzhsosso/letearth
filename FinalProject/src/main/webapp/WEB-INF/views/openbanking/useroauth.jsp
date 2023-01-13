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
  width : 8%;
  height : 4px;
  background-color : #D7D1B9;
  border : 0;
  
   position: relative;
   top: -10px; 
/*    left: 380px;  */
   left: 46%;
}

#repSelector1{
   position: relative;
   top: -15px; 
   
}

/*hover*/
#hov a:hover{
  color : #6F7B63;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
  
 } 

 /*페이징*/
.paging {
    display: inline-block;
}

.paging a{
	display: block;
	text-decoration: none;
	color: #414934;
	float: left;
	line-height: 1.5;
	border-radius:50%;
	padding: 8px 16px;
}

.paging a:hover {
	background-color: #B6AD90;
	color: #E8E4D7;
	
}

.paging a.active{
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
}

.pagination a:active{
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
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

.label1{
	 background: #A4AC85;
    line-height: 30px;
    padding: 0 13px;
    font-size: 15px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    color: #f4f4f4;
    margin: 15px;
    border-radius: 0.2rem;
    border: none;
    text-align: center;
    cursor: pointer;
}

.blacktb a{
	color: 	#414934;
	
}
.blacktb a:hover{
  color : #EDEAE0;
  transition : 0s;
  font-weight: bolder;
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
			<%@ include file="../include/adSide.jsp"%>

			<div class="container">
				<br> <br> <br> <br> <br>

				<!-- 어드민 -->
				<h2 class="box-title" align="center"><b style="color: #6F7B63;">정산관리</b></h2>
				<hr id="repSelector" align="center">
				<div class="col-xs-12" style="font-size: 16px;">
					<div style="font-size: 1.7rem; cursor: pointer;" align= "left" id="aaadiv">
						
						<span id="hov"> 
							<a id="list2" class="Settlem1" style="color: #6F7B63; font-weight: bold;">정산하기</a>
							| 
							<a href="/openbanking/useroauth2" class="Settlem2" style="color: #B6AD90;">정산완료</a>
						</span>
							<hr id="repSelector1">	
					</div>

					<!-- 어드민 -->
					
					<div class="box" style="border: none;">
					<div style="padding-top: 30px; padding-bottom: 30px;"></div>	
						
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action="" method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0;">
											<th style="text-align: center; width : 5%; table-layout: fixed; color: #414934; font-weight: bold;">#</th>
											<th style="text-align: center; color: #414934; width : 40%; table-layout: fixed; font-weight: bold;" >프로젝트 이름</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">아이디</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">펀딩 종료날짜</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">목표금액</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">달성금액</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">정산상세</th>
										</tr>

										<c:forEach var="st" items="${fproList }">
											<tr class="blacktb">
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${st.pro_no }</td>
												<td style="vertical-align:middle; color: #414934; font-weight: bold;">${st.pro_title }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${st.mem_id }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${st.pro_ed_dt }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
													<fmt:formatNumber value="${st.pro_gp }" />원
												</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
													<fmt:formatNumber value="${st.pro_tp }" />원
												</td>
												<td style="text-align: center; vertical-align:middle; font-weight: bold;"><span
													class="label1"><a
													href="/openbanking/stDetail?pro_no=${st.pro_no }"
													> 정산상세 </a></span></td>
													
											</tr>
										</c:forEach>
								</table>
							</form>
						</div>
						<!-- memAll -->

					</div>
<br><br><br>
					<!-- 페이징처리 -->
					<div class="pagination" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination" style="font-size: 18px;">
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
								<li><a href="/openbanking/useroauth?page=${pvo.endPage+1} ">»</a></li>
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


	<br><br><br><br><br><br><br><br><br>


 	 
 	 
 	
	
 	
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
<!--  		<!-- 오픈뱅킹 자산 조회 버튼 - 토큰 발급 후 이동 -->
<!-- 		 <!-- sessionToken 값이 있어야 자산 조회 버튼 생성 -->	
<%-- <%-- 	     <c:if test="${not empty sessionScope.token}"> --%> 
<!--                 자산 조회를 위한 인증 요청 작업 수행 -->
<!--                 <form method="get" action="/openbanking/userInfo" > -->
<!-- <!--                   <input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE3MTk1Iiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2ODEyMDMwMTUsImp0aSI6IjZjODZkM2Q4LTE4YTUtNDEyZS1iMjRkLWYyYzdkMDFhNGYzOSJ9.zfT7xFPJiL9BD5bc9IBrcP3PSVA_wnI69vjJhokrq4g"> -->
<%--                   <input type="hidden" name="access_token" value="${responseTokenVO.access_token }"> --%>
<!-- <!--                   <input type="hidden" name="user_seq_no" value="1101017195"> -->
<%--                   <input type="hidden" name="user_seq_no" value=${responseTokenVO.user_seq_no }> --%>
<!-- 				  <input type="submit" value="내 자산조회"> -->
<!--                 </form> -->
<%-- <%-- 		</c:if> --%>



		<!-- 출금이체 : 관리자가 구매자 계좌에서 출금 -->
<!-- 				<form method="post" action="withdraw"> -->
<%-- 						<input type="hidden" name="access_token" value="${responseTokenVO.access_token }"> --%>
<%-- 						<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }"> --%>
<!-- 						<input type="hidden" name="cntr_account_type" value="N"> -->
<!-- 						<input type="hidden" name="cntr_account_num" value="1234123412341234"> 렛어스 계좌번호 -->
<!-- 						<input type="hidden" name="dps_print_content" value="렛어스"> -->
<!-- <!-- 						<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> -->
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
<!-- <!-- 					<input type="hidden" name="access_token" value="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiIxMTAxMDE3MDIxIiwic2NvcGUiOlsiaW5xdWlyeSIsImxvZ2luIiwib29iIiwidHJhbnNmZXIiXSwiaXNzIjoiaHR0cHM6Ly93d3cub3BlbmJhbmtpbmcub3Iua3IiLCJleHAiOjE2ODEwODc2MDIsImp0aSI6IjEwOTFlM2MwLWQxMDMtNDVkOC04ZTU1LWFjNGE2YTcxYTUwMSJ9.0FAFGwfG12VFnFoTA-L1LKDLOlS-j2JKWeLtvfcOOGk"> -->
<!-- 					<input type="hidden" name="cntr_account_type" value="N"> -->
<!-- 					<input type="hidden" name="cntr_account_num" value="1234123412341234"> -->
<!-- 					<input type="hidden" name="wd_pass_phrase" value="NONE"> 테스트환경은 NONE을 사용 -->
<!-- 					<input type="hidden" name="wd_print_content" value="정산해요"> -->
<!-- 					<input type="hidden" name="name_check_option" value="off"> -->
<!-- 					<input type="hidden" name="tran_dtime" value="20230106101921"> -->
<!-- 					<input type="hidden" name="req_cnt" value="1"> -->
					
<!-- 					<input type="hidden" name="tran_no" value="1"> -->
<%-- <%-- 					<input type="hidden" name="bank_tran_id" value="${responseTokenVO.bank_tran_id }"> --%> 
<!-- 					<input type="hidden" name="bank_tran_id" value="M202202343U123456789"> -->
<!-- 					<input type="hidden" name="fintech_use_num" value="120220234388941212225903"> -->
<!-- <!-- 					<input type="hidden" name="fintech_use_num" value="120220234388941212453442"> -->
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
 	
 	
 	
 	
 <script type="text/javascript" src="jquery-3.6.3.min.js"></script>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$(".Settlem1").css("color","#6F7B63"); 
 		$(".Settlem1").css("font-weight","bolder");
 		$(".Settlem2").css("color","#B6AD90"); 
 		$(".Settlem2").css("font-weight","normal");
 		
 		$(".Settlem2").hover(function(){
 			$(this).css('color', '#6F7B63'); // 마우스 오버 시
 			$(this).css('font-weight', 'bolder'); 
 		}, function(){
 			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
 			$(this).css('font-weight', 'normal'); 
 		});
 	});
 
 </script>	
 	
 	
 	
 	
 	
 	
 	
 	   
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	</body>
	</html>
	