<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style>
		#rewardMo {
			border: 1px solid #dcdcdc;
			position: fixed;
			width: 500px;
			height: 300px;
			left: 50%;
			top: 50%;
			transform: translate(-50%,-50%);
			padding: 10px;
			display: none;
			z-index:9999;
			background: #fff;
		}
		
		#rewardMo > p {
			font-size: 12px;
		}
		
		#rewardMoCl {
			background: none;
			border: 1;
			position: absolute;
			right: 10px;
			top: 10px;
			font-size: 20px;
			margin-top: 20px;
			margin-right: 18px;
		}
		
		#rewardMo-btn {
			padding: 5px;
			margin: 10px;
			width: 20%;
			border: 0px;
			border-style: solid;
			border-radius: 5px;
			background: #29f0b4;
			color: black;
			font-size: 12px;
		}
	</style>
	<script>
	
	function chkMoney(){
		alert("클릭");
		document.mfr.submit();
	}
	
	$(function(){
		
		$("#withoutReward").click(function(){
			$('#rewardMo').fadeIn();
			$("#dark").show();
			
			$(".container").on('scroll thuchmove mousewheel', function(event){
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		
		$("#rewardMoCl").click(function(){
			$('#rewardMo').fadeOut();
			$("#dark").hide();
			
			$(".container").off('scroll thuchmove mousewheel');
		});
		
	});
	</script>
</head>
<body>


				<!-- Modal -->
                <div id="rewardMo" class="modal">
                  <div class="screen">
                  	<div style="margin: 20px 10px;">
                		<button type="button" id="rewardMoCl">Ｘ</button> 
                		<h4>리워드 없이 후원하기</h4>
                		<hr>
                	</div>
                		<form action="/order/or_main" name="mfr" method="get">
                		<div class="tedori" style="padding: 20px; margin: 20px">
								<div style="text-align: center">
									<p style="font-size: 18px; margin-bottom: 10px;">
										* 원하는 금액의 후원금을 입력해주세요.
									</p>
									<input type="hidden" name="pro_no" value="${info[0].pro_no }">
	                				<input type="text" name="mny" style="width: 265px; height: 30px;"> 원
	                			</div>
	                			<div style="text-align: center">
	                				<button type="button" id="rewardMo-btn" onclick="chkMoney();" 
	                				style="width: 35%; height: 45px; background: #29f0b4; color: black; margin:25px 0px;">후원하기</button>
	                			</div>
                		</div>
                		</form>
                  	</div>
                </div>
                
</body>
</html>