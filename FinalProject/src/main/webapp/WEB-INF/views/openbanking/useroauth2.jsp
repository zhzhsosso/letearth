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
<title>정산완료 리스트</title>


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

.settlem2:hover{
	color: #6F7B63;
	font-weight: bold;
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
				<h2 class="box-title" align="center">
					<b style="color: #6c757d;">정산완료</b>
				</h2><hr id="repSelector" align="center">
				<div class="col-xs-12" style="font-size: 16px;">
					<div style="font-size: 1.7rem; cursor: pointer;" align="left">
						<span id="hov"> <a href="/openbanking/useroauth" class="Settlem2" style="color: #B6AD90;">정산하기</a>
							| <a id="list3" class="Settlem1" style="color: #6F7B63; font-weight: bold;">정산완료</a>
						</span>
						<hr id="repSelector1">	
					</div>

					<!-- 어드민 -->
					<br>
					<div class="box" style="border: none;">
						<div style="padding-top: 30px; padding-bottom: 30px;"></div>
						<!-- memAll -->
						<div class="box-body table-responsive no-padding" id="memAll">
							<form role="form" name="fr" id="contact-form" action=""
								method="post">
								<table class="table table-hover">
									<tbody>
										<tr style="background-color: #EDEAE0;">
											<th style="text-align: center; width : 5%; table-layout: fixed; color: #414934; font-weight: bold;">#</th>
											<th style="text-align: center; color: #414934; width : 40%; table-layout: fixed; font-weight: bold;" >프로젝트 이름</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">아이디</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">펀딩 종료날짜</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">목표금액</th>
											<th style="text-align: center; color: #414934; font-weight: bold;">달성금액</th>
<!-- 											<th style="font-size: 15px;">정산상세</th> -->
										</tr>

										<c:forEach var="cp" items="${completeSt }">
											<tr class="blacktb">
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${cp.pro_no }</td>
												<td style="vertical-align:middle; color: #414934; font-weight: bold;">${cp.pro_title }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${cp.mem_id }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${cp.pro_ed_dt }</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;"><fmt:formatNumber
														value="${cp.pro_gp }" />원</td>
												<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;"><fmt:formatNumber
														value="${cp.pro_tp }" />원</td>
<!-- 												<td style="font-size: 15px;"><span -->
<!-- 													class="label label-info"><a -->
<%-- 													href="/openbanking/transferResult?pro_no=${cp.pro_no }" --%>
<!-- 													style="color: green"> 이체내역보기 </a></span></td> -->
													
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
								<li><a href="/openbanking/useroauth2?page=${pvo.startPage-1 }">«</a></li>
								<!-- 10 -->
							</c:if>

							<c:forEach var="idx" begin="${pvo.startPage }"
								end="${pvo.endPage }" step="1">
								<li <c:out value="${idx == pvo.cri.page? 'class=active':'' }"/>><a
									href="/openbanking/useroauth2?page=${idx }">${idx }</a></li>
							</c:forEach>

							<c:if test="${pvo.next }">
								<li><a href=/openbanking/useroauth2?page=${pvo.endPage+1 }">»</a></li>
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

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
</body>
</html>
	