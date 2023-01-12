<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://kit.fontawesome.com/bd939ba5e2.js" crossorigin="anonymous"></script>


<title>LetEarth</title>

<style>
	.proimg {
		margin: 10px 0px;
		padding: 10px 0px;
	}

	.ortitle {
		display: flex;
	}

	.tedori {
		padding:15px;
		border: 1px;
		border-style: solid;
		border-radius: 7px;
	}
	
	.explain {
		margin: 10px;
		padding: 10px 10px;
	}
	
	.explain-list {
		display: table-cell;
		vertical-align: middle;
	}
	
	#ship {
		width: 100%;
		table-layout: fixed;
	}
	
	#sh {
		padding: 5px;
		text-align: center;
		color: black;
		width: 30%;
	}
	
	#sd {
		padding: 5px;
		color: black;
		text-align: center;
	}
	

	#dark {
		width: 100%;
		height: 100%;
		position: fixed;
		background-color: #000000;
		opacity:0.6;
		top: 0;
		left: 0;
		z-index:9998;
		display: none;
	}
</style>

<script>


$(function(){
	
// 	$("#shipCancel").click(function(){
// 		var order_no = $("#orderN").val();
		
// 		$.ajax({
// 			url:'${pageContext.request.contextPath}/order/shipChange',
// 			type:'post',
// 			data: {"order_no":order_no},
// 			success:function(){
				
// 			}, 
// 			error:function(){
// 				alert("실패");
// 			}
// 		});
// 	});
	
	
	$("#orderCancel").click(function() {
		var order_trade_num = $("#tradeNum").val();
		var order_status = $("#orderS").val();
		
		if(order_status == 2) {
			alert("이미 취소요청 진행 중인 후원입니다.");
			
			return;
		}
		
		
		$.ajax({
			url:'${pageContext.request.contextPath}/order/orderCancel',
			type:'post',
			data:{"order_trade_num":order_trade_num},
			success:function(result){
				if(result == 1){
					alert('취소요청이 정상 처리 되었습니다.\n취소 처리까지 카드 영업일 기준 최대 3~5일 소요됩니다. ');
					$('#cmsg').html("취소 요청");
				} else {
					alert('실패');
				}
			}
			
		});
	});
	
});


		
		
</script>
</head>
<body>
	
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	

    <!--====== FORM PART START ======-->
    
    <!--====== PAGE TITLE PART START ======-->
   
    <section class="page-title-area bg_cover" style="background-image: url(assets/images/page-title-bg.jpg);">

    </section>
    <br>
    
    <!--====== PAGE TITLE PART ENDS ======-->

    <!--====== PROJECT DETAILS PART START ======-->
    
    
   <div class="container" align="center">
   	<div class="about-introduction-content" style="margin-bottom: 30px" >
       <h2 style="padding:20px 0px; color:black; text-decoration: underline; text-underline-offset:12px; text-decoration-thickness:4px; text-decoration-color: #D7D1B9 ">후 원 완 료</h2>
    </div>
   </div>
    
    <div class="container" align="center">
    	<div class="about-introduction-content" style="margin-bottom: 30px; width:60%" align="justify">
    	  <div style="padding: 20px">
    	  <div style="background-color: #A4AC85; height: 40px">
           <h5 style="padding:10px 5px; background-color:transparent; color: white; display: inline;">상품 정보</h5>
           <font id="cmsg" color="red" size="4"></font>
           <c:if test="${ovo.order_status==2 || ovo2.order_status==2 }">
           <font color="red" size="4">취소 요청</font>
           </c:if>
           <!-- 공간용 -->
           <button type="button" class="btn" style="color:blue; visibility: hidden;">변경</button>
           <!-- 공간용 -->
           </div>
           <input type="hidden" id="tradeNum" value="${param.or_tr_n }">
           <c:choose>
          	<c:when test="${ovo2.reward_no != 0 }">
          		<input type="hidden" id="orderN" value="${ovo.order_no }">
          		<input type="hidden" id="orderS" value="${ovo.order_status }">
           		<input type="hidden" id="totalP" value="${ovo.total_price }">
            </c:when>
            <c:otherwise>
            	<input type="hidden" id="totalP" value="${ovo2.total_price }">
            	<input type="hidden" id="orderN" value="${ovo2.order_no }">
            	<input type="hidden" id="orderS" value="${ovo2.order_status }">
            </c:otherwise>
           </c:choose>
			<c:choose>
          	<c:when test="${ovo2.reward_no != 0 }">
           	 <table id="ship" border="1">
				<tr>
					<td id="sd" rowspan="7" style="border-right: none; width:40%"><img src="${ovo.pro_file }" width="200" height="200" alt=""></td>
					<td id="sd" style="visibility: hidden; border-bottom: none; border-left: none;">안녕 공간차지용이에요</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; font-size: 13px;">결제완료일 ${ovo.o_date } │ 주문번호 ${ovo.order_trade_num }</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; font-size:25px;"><b>${ovo.pro_title }</b></td>
				</tr>
				<tr>
					<td id="sd" style="border: none;">· ${ovo.reward_title }</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; color:red;">예상전달일 ${ovo.reward_shipmonth } ${ovo.reward_shipdate }</td>
				</tr>
				<tr>
					<td id="sd" style="border: none;"><b><fmt:formatNumber>${ovo.total_price}</fmt:formatNumber> 원 결제 완료</b></td>
				</tr>
				<tr>
					<td id="sd" style="visibility: hidden; border-top: none; border-left: none;">안녕 공간차지용이에요</td>
				</tr>
           	 </table>
           	  </c:when>
           <c:otherwise>
            <table id="ship" border="1">
				<tr>
					<td id="sd" rowspan="7" style="border-right: none; width:40%"><img src="${ovo2.pro_file }" width="200" height="200" alt=""></td>
					<td id="sd" style="visibility: hidden; border-bottom: none; border-left: none;">안녕 공간차지용이에요</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; font-size: 13px;">결제완료일 ${ovo2.o_date } │ 주문번호 ${ovo2.order_trade_num }</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; font-size:25px; font-weight: bold;"><b style="color:green">${mvo.mem_name }</b>님의 소중한 후원이 전달되었습니다.</td>
				</tr>
				<tr>
					<td id="sd" style="border: none;">후원은 창작자에게 큰 힘이 됩니다!</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; color:red;"></td>
				</tr>
				<tr>
					<td id="sd" style="border: none;"><b><fmt:formatNumber>${ovo2.total_price}</fmt:formatNumber> 원 결제 완료</b></td>
				</tr>
				<tr>
					<td id="sd" style="visibility: hidden; border-top: none; border-left: none;">안녕 공간차지용이에요</td>
				</tr>
           	 </table>
           </c:otherwise>
           </c:choose>
           </div>
           
           
          <div style="padding: 20px">
          	<c:if test="${ovo2.reward_no != 0 }">
          	<div style="background-color: #A4AC85;">
           <h5 style="padding:10px 5px; background-color:transparent; color: white; display: inline;">배송지 정보</h5>
           <button type="button" class="btn" id="shipChange" style="color:blue; cursor: pointer;">변경</button>
           </div>
           <div id="shipInfo" >
            <table id="ship" border="1" >
            	<tr>
            		<th id="sh">받는 사람</th>
            		<td id="sd">${ovo.receiver_name }</td>
            	</tr>
            	<tr>
            		<th id="sh">주소</th>
            		<td id="sd">[${ovo.address_no }] ${ovo.address }</td>
            	</tr>
            	<tr>
            		<th id="sh">상세주소</th>
            		<td id="sd">${ovo.address_detail }</td>
            	</tr>
            	<tr>
            		<th id="sh">연락처</th>
            		<td id="sd">${ovo.receiver_phone }</td>
            		
            	</tr>
            	<tr>
            		<th id="sh">배송 메세지</th>
            		<td id="sd">${ovo.shipping_req }</td>
            	</tr>
            </table>
           </div> 
            </c:if>

           </div>
            <div align="center">
           	 	<a href="https://wwfkorea.campaignus.me/fy21polarbear_emforce?utm_medium=blog&utm_source=influencer&utm_campaign=fy21polarbear&utm_content=11%EC%9B%94_%EB%B6%81%EA%B7%B9%EA%B3%B0" target="_blank">
           	 	<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjAxMTlfMTMz%2FMDAxNjQyNTI3NDEwOTY2.pqnGJY4Btq51DPgSSpdnp8UffxYWuTjYly5Nlm9MWscg.EysUzecTV_8vWq-jJxcmjcZZX3tEsZ5yYKBZx7m89wsg.JPEG.studio_namoo%2F8.jpg&type=sc960_832"
           	 	 width="100%" height="300" style="padding: 20px"></a>
           	 </div>
            
            
           <div align="center">
           		<button class="main-btn" id="orderCancel" style="line-height:10px; padding:10px; margin:10px; background-color:#6F7B63; color:white; font-size: 15px; box-shadow: 1px 1px 3px 1px black;" id="shipCancel" type="button">후원 취소</button>
           		<button class="main-btn" style="line-height:10px; padding:10px; margin:10px; background-color:#6F7B63; color:white; font-size: 15px; box-shadow: 1px 1px 3px 1px black;" type=button
           		 onclick="location.href='/main/all';">메인으로</button>
           </div>
            
            
            
       </div>
    </div>
    
    
    
     <!-- modal -->
     <div id="dark"></div>
     <%@ include file="or_addressMo.jsp" %>
    
    
    
    
    
    
    
    
    
    
    
	 <!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>

</body>
</html>