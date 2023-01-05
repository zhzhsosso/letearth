<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	#agreeMo {
		border: 1px solid #dcdcdc;
		position: fixed;
		width: 1000px;
		height: 500px;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		padding: 10px;
		display: none;
		z-index:9999;
		background: #fff;
		color: black;
	}
	
	
	#agreeMoCl {
		background: none;
		border: 0;
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 20px;
	}
	
	#agreeMo-btn {
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
	
	.tab {
		margin: 10px 10px;
		border-top: 1px;
		border-top-style: solid;
		font-size: 14px;
		
	}
	
	.tabd {
		border-bottom: 1px;
		border-bottom-style: solid;
		padding: 5px;
	}
	</style>
	
	<script>
	$(function(){
		
		$("#agree").click(function(){
			$('#agreeMo').fadeIn();
			$("#dark").show();
			
			$(".container").on('scroll thuchmove mousewheel', function(event){
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		
		$("#agreeMoCl").click(function(){
			$('#agreeMo').fadeOut();
			$("#dark").hide();
			
			$(".container").off('scroll thuchmove mousewheel');
		});
		
	});
	</script>
</head>
<body>

	<!-- Modal -->
                <div id="agreeMo" class="modal">
                  <div class="screen">
                  	<div style="margin: 20px 10px;">
                		<button type="button" id="agreeMoCl"><i class="fa-solid fa-circle-xmark"></i></button> 
                		<h4>개인정보 제3자 제공 동의</h4>
                	</div>
               		<div style="margin: 20px 10px;">
               			<p style="font-size: 14px; color: black">회원의 개인정보는 당사의 개인정보 취급방침에 따라 안전하게 보호됩니다. '회사'는 이용자들의
               			개인정보를 개인정보 취급방침의 '제2조 수집하는 개인정보의 항목, 수집방법 및 이용목적'에서
               			고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로
               			이용자의 개인정보를 외부에 공개하지 않습니다.</p>
               		</div>
                		
                		<div align="center">
                			<table class="tab">
                				<tr>
                					<td class="tabd">제공받는 자</td>
                					<td class="tabd">후원 프로젝트의 창작자</td>
                				</tr>
                				<tr>
                					<td class="tabd">제공 목적</td>
                					<td class="tabd">선물 전달 및 배송과 관련된 상담 및 민원처리</td>
                				</tr>
                				<tr>
                					<td class="tabd">제공 정보</td>
                					<td class="tabd">수취인 성명, 휴대전화번호, 배송 주소</td>
                				</tr>
                				<tr>
                					<td class="tabd">보유 및 이용기간</td>
                					<td class="tabd">재화 또는 서비스의 제공이 완료된 즉시 파기<br>
                					(단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)</td>
                				</tr>
                			</table>
                		</div>
                		
                		<div>
                		<p style="margin: 5px 10px; font-size: 14px; color: black">* 동의 거부권 등에 대한 고지</p>
                		<p style="margin:0px 20px; font-size: 14px; color: black">개인정보 제공은 서비스 이용을 위해 꼭 필요합니다. 개인정보 제공을 거부하실 수 있으나,
                		이 경우 서비스 이용이 제한될 수 있습니다.</p>
                		</div>
                  </div>
                </div>
</body>
</html>