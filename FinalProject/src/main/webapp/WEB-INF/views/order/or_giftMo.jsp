<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<style>
	#giftMo {
		border: 1px solid #dcdcdc;
		position: fixed;
		height: 730px;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		padding: 10px;
		display: none;
		z-index:9999;
		background: #fff;
		overflow:auto;
	}
	
	#giftMo > p {
		font-size: 12px;
	}
	
	#giftMoCl {
		background: none;
		border: 0;
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 20px;
	}
	
	#giftMo-btn {
		padding: 5px;
		margin: 10px;
		width: 20%;
		border: 1px;
		border-style: solid;
		border-radius: 5px;
		background: white;
		color: black;
		font-size: 12px;
	}
	
	.giftMoBody {
		height: 600px;
		overflow: auto;
	}
	</style>
	
	<script>
	$(function(){
		
		$("#gift").click(function(){
			$('#giftMo').fadeIn();
			$("#dark").show();
			
			$(".container").on('scroll thuchmove mousewheel', function(event){
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		
		$("#giftMoCl").click(function(){
			$('#giftMo').fadeOut();
			$("#dark").hide();
			
			$(".container").off('scroll thuchmove mousewheel');
		});
		
		
	});
	
	
	function nonegift() {
		
		var plus0 = $('#plus0').val();
// 		var plus0com = plus0.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		if(plus0 == 0) {
			$('#re_no').attr("value",0);
			$('#re_title').attr("value", "선물없이 후원하기");
			$('#re_price').attr("value", 0);
			$('#order_plus').attr("value", 1000);
			$('#re_shipmonth').attr("value",null);
			$('#re_shipdate').attr("value",null);
			
			$('#totalRe').attr("value",1000);
			alert("변경 되었습니다!");
			
			$('#receiver_name').attr("disabled",true);
			$('#receiver_phone').attr("disabled",true);
			$('#sample6_postcode').attr("disabled",true);
			$('#searchPost').attr("disabled",true);
			$('#searchPost').attr("disabled",true);
			$('#sample6_address').attr("disabled",true);
			$('#sample6_detailAddress').attr("disabled",true);
			$('#shipping_req').attr("disabled",true);
			
			$('#giftMoCl').click();
		} else {
			$('#re_no').attr("value",0);
			$('#re_title').attr("value", "선물없이 후원하기");
			$('#re_price').attr("value", 0);
			$('#order_plus').attr("value", plus0);
			$('#re_shipmonth').attr("value",null);
			$('#re_shipdate').attr("value",null);
			
			$('#totalRe').attr("value",plus0);
			alert("변경 되었습니다!");
			
			$('#receiver_name').attr("disabled",true);
			$('#receiver_phone').attr("disabled",true);
			$('#sample6_postcode').attr("disabled",true);
			$('#searchPost').attr("disabled",true);
			$('#searchPost').attr("disabled",true);
			$('#sample6_address').attr("disabled",true);
			$('#sample6_detailAddress').attr("disabled",true);
			$('#shipping_req').attr("disabled",true);
			
			$('#giftMoCl').click();
		}
	}
	
	function choice(re_no) {
		var plus = $('#plus'+re_no).val();
		
		$.ajax({
			type:'get',
			data: {"reward_no":re_no},
			url:'${pageContext.request.contextPath}/order/getReward',
			success:function(vo){
				$('#re_no').attr("value", vo.reward_no);
				$('#re_title').attr("value", vo.reward_title);
				$('#re_price').attr("value",vo.reward_price);
				$('#order_plus').attr("value",plus);
				$('#re_shipmonth').attr("value",vo.reward_shipmonth);
				$('#re_shipdate').attr("value",vo.reward_shipdate);
				
				var total = parseInt((vo.reward_price))+parseInt((plus));
				$('#totalRe').attr("value",total);
				alert("변경 되었습니다!");
				
				$('#receiver_name').attr("disabled",false);
				$('#receiver_phone').attr("disabled",false);
				$('#sample6_postcode').attr("disabled",false);
				$('#searchPost').attr("disabled",false);
				$('#sample6_address').attr("disabled",false);
				$('#sample6_detailAddress').attr("disabled",false);
				$('#shipping_req').attr("disabled",false);
				
				$('#giftMoCl').click();
			}
		});
		
	}
	
	function one(re_no) {
		$('#plus'+re_no).attr("value","5000")
	}
	
	function two(re_no) {
		$('#plus'+re_no).attr("value","10000")
	}
	
	function three(re_no) {
		$('#plus'+re_no).attr("value","50000")
	}
	
	function four(re_no) {
		$('#plus'+re_no).attr("value","100000")
	}
	
	</script>
</head>
<body>

	<!-- Modal -->
                <div id="giftMo" class="modal">
                  <div class="screen">
                  	<div style="margin: 15px 10px;">
                		<button type="button" id="giftMoCl"><i class="fa-solid fa-circle-xmark"></i></button> 
                		<h4>선물 변경</h4>
                		<hr>
                	</div>
                	<div class="giftMoBody">
                		<div class="tedori" style="padding: 20px; margin: 20px">
                			<div style="display: flex;">
                			<h4 style="width:90%">1,000원 +</h4>
                			<button type="button" id="giftMo-btn" style="margin-top: 0px; background: #6F7B63; color: white;" onclick="nonegift()">선택</button>
                			</div>
                			<a style="font-size: 13px">선물없이 후원하기</a> 
                			<div>
	                		  <details>
	                		  	<summary style="color: blue; text-align: center;">추가 후원하기</summary>
	                		  	<hr>
	                			<p style="font-size: 13px">추가 후원금(선택)</p>
	                			<input type="text" id="plus0" value="0" oninput="this.value = this.value.replace(/\d(?=(?:\d{3})+$)/g, '$&,')">
	                			<p style="font-size: 13px">* 더 후원해주시면 프로젝트 성사가 앞당겨집니다.</p>
	                			<div style="text-align: center">
	                			<button id="giftMo-btn" style="margin-left: 0px" onclick="one(0)">+ 5천원</button>
	                			<button id="giftMo-btn" onclick="two(0)">+ 1만원</button>
	                			<button id="giftMo-btn" onclick="three(0)">+ 5만원</button>
	                			<button id="giftMo-btn" style="margin-right: 0px;" onclick="four(0)">+ 10만원</button>
	                			</div>
	                		  </details>
	                		  </div>
                			   
                		</div>
                		
                		<c:forEach var="re" items="${rewardList}">
                		<c:choose>
                		<c:when test="${re.reward_stock != 0 }">
                		<div class="tedori" style="padding: 20px; margin: 20px">
                		  <div>
                		  	<div style="display: flex;">
                		  	<input type="hidden" id="re_no" value="${re.reward_no }">
                			<h4 style="width:90%"><fmt:formatNumber>${re.reward_price }</fmt:formatNumber> +</h4>
                			<button type="button" id="giftMo-btn" style="margin-top: 0px; background: #6F7B63; color: white;" onclick="choice(${re.reward_no})">선택</button>
                			</div>
                			<p style="font-size: 13px">${re.reward_title }</p>
                			<p style="font-size: 13px">수량 ${re.reward_stock }</p>
                			<p style="font-size: 13px">예상 전달일 ${re.reward_shipmonth } ${re.reward_shipdate }</p>
                		  </div>
                		<div>
                		  <details>
                		  	<summary style="color: blue; text-align: center;">추가 후원하기</summary>
                		  	<hr>
                			<p style="font-size: 13px">추가 후원금(선택)</p>
                			<input type="text" id="plus${re.reward_no }" value="0">
                			<p style="font-size: 13px">* 더 후원해주시면 프로젝트 성사가 앞당겨집니다.</p>
                			<div style="text-align: center">
                			<button id="giftMo-btn" style="margin-left: 0px" onclick="one(${re.reward_no})">+ 5천원</button>
                			<button id="giftMo-btn" onclick="two(${re.reward_no})">+ 1만원</button>
                			<button id="giftMo-btn" onclick="three(${re.reward_no})">+ 5만원</button>
                			<button id="giftMo-btn" style="margin-right: 0px;" onclick="four(${re.reward_no})">+ 10만원</button>
                			</div>
                		  </details>
                		  </div>
                		</div>
                		</c:when>
                		<c:otherwise>
                			<div class="tedori" style="padding: 20px; margin: 20px; opacity: 0.5">
                		  <div>
                		  	<div style="display: flex;">
                		  	<input type="hidden" id="re_no" value="${re.reward_no }">
                			<h4 style="width:90%"><fmt:formatNumber>${re.reward_price }</fmt:formatNumber> +</h4>
                			<button type="button" id="giftMo-btn" style="margin-top: 0px; background: #6F7B63; color: white;" onclick="choice(${re.reward_no})" disabled>품절</button>
                			</div>
                			<p style="font-size: 13px">${re.reward_title }</p>
                			<p style="font-size: 13px">수량 ${re.reward_stock }</p>
                			<p style="font-size: 13px">예상 전달일 ${re.reward_shipmonth } ${re.reward_shipdate }</p>
                		  </div>
                		<div>
                		  <details>
                		  	<summary style="color: blue; text-align: center;">추가 후원하기</summary>
                		  </details>
                		  </div>
                		</div>
                		</c:otherwise>
                		</c:choose>
                		</c:forEach>
                			
                	</div>
                  </div>
                </div>
</body>
</html>