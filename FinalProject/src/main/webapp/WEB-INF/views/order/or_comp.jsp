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
	
	.bttn {
		padding: 5px;
		margin: 10px;
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
	
	$("#shipCancel").click(function(){
		var order_no = ${ovo.order_no};
		
		$.ajax({
			url:'${pageContext.request.contextPath}/order/shipChange',
			type:'post',
			data: {"order_no":order_no},
			success:function(){
				
			}, 
			error:function(){
				alert("실패");
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
    
    <!--====== PAGE TITLE PART ENDS ======-->

    <!--====== PROJECT DETAILS PART START ======-->
    
    
   <div class="container" align="center">
   	<div class="about-introduction-content" style="margin-bottom: 30px" >
       <h3 style="padding:10px 0px">후원 완료</h3>
    </div>
   </div>
    
    <div class="container" align="center">
    	<div class="about-introduction-content" style="margin-bottom: 30px; width:55%" align="justify">
    	  <div style="padding: 20px">
           <h5 style="padding:10px 0px">상품 정보</h5>
<%--            <input type="hidden" id="or_no" value="${ovo.order_ }"> --%>
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
					<td id="sd" style="border: none;"><fmt:formatNumber>${ovo.total_price}</fmt:formatNumber> 원 결제 완료</td>
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
					<td id="sd" style="border: none; font-size:25px;"><b>후원 해주셔서 감사합니다!</b></td>
				</tr>
				<tr>
					<td id="sd" style="border: none;">후원은 창작자에게 큰 힘이 됩니다!</td>
				</tr>
				<tr>
					<td id="sd" style="border: none; color:red;">♡</td>
				</tr>
				<tr>
					<td id="sd" style="border: none;"><fmt:formatNumber>${ovo2.total_price}</fmt:formatNumber> 원 결제 완료</td>
				</tr>
				<tr>
					<td id="sd" style="visibility: hidden; border-top: none; border-left: none;">안녕 공간차지용이에요</td>
				</tr>
           	 </table>
           </c:otherwise>
           </c:choose>
           </div>
           
           
          <div style="padding: 20px">
          <c:choose>
          	<c:when test="${ovo2.reward_no != 0 }">
           <h5 style="padding:10px 0px; display: inline;">배송지 정보</h5>
           <button type="button" class="btn" id="shipChange" style="color:blue">변경</button>
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
           </c:when>
           <c:otherwise>
           	 <div align="center">후원 해주셔서 감사합니다!<br>
           	 후원은 창작자에게 큰 힘이 됩니다!</div>
           </c:otherwise>
           </c:choose>
           </div>
            
           <div align="center">
           		<button class="bttn" id="shipCancel" type=button>후원 취소</button>
           		<button class="bttn" type=button>메인으로</button>
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