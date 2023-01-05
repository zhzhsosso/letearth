<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<meta charset="UTF-8">
	<style>
		#reportMo {
			border: 1px solid #dcdcdc;
			position: fixed;
			width: 600px;
			height: 720px;
			left: 50%;
			top: 50%;
			transform: translate(-50%,-50%);
			padding: 10px;
			display: none;
			z-index:9999;
			background: #fff;
		}
		
		#reportMo > p {
			font-size: 12px;
		}
		
		#reportMoCl {
			background: none;
			border: 1;
			position: absolute;
			right: 10px;
			top: 10px;
			font-size: 20px;
			margin-top: 20px;
			margin-right: 18px;
		}
		
		#reportMo-btn {
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
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(function(){
		
		$("#rePort").click(function(){
			$('#reportMo').fadeIn();
			$("#dark").show();
			
			$(".container").on('scroll thuchmove mousewheel', function(event){
				event.preventDefault();
				event.stopPropagation();
				return false;
			});
		});
		
		$("#reportMoCl").click(function(){
			$('#reportMo').fadeOut();
			$("#dark").hide();
			
			$(".container").off('scroll thuchmove mousewheel');
		});
		
	});
	
	
	function rpcheck(){
		if(document.rpfr.rep_reason.value == ""){
			swal('신고사유를 선택하세요','','warning');
			return false;
		}
		if(document.rpfr.rep_content.value == ""){
			swal('신고내용을 입력하세요','','warning');
			return false;
		}
		swal('신고가 정상적으로 접수 되었습니다','','info').then(function(){
			document.rpfr.submit();
		});
	}
	</script>
</head>
<body>


				<!-- Modal -->
                <div id="reportMo" class="modal">
                	<form name="rpfr" method="post">
                		<input type="hidden" id="pro_no" name="pro_no" value="${pdvo.pro_no }">
                		<input type="hidden" id="reper_id" name="reper_id" value="${sessionScope.mem_id }">
                		<input type="hidden" id="rep_cat" name="rep_cat" value="2">
                		<input type="hidden" id="rep_status" name="rep_status" value="N">
                 	<div class="screen">
                  	<div style="margin: 20px 10px;">
                		<button type="button" id="reportMoCl">Ｘ</button> 
                		<h4>신고하기</h4>
                		<hr>
                	</div>
                		<div class="tedori" style="padding: 20px; margin: 20px">
                			<div style="text-align: center">
								<p style="font-size: 18px; margin-bottom: 10px;">작성자</p>
								<input type="text" value="${sessionScope.mem_id }" placeholder="제목을 입력해주세요" class="longTextBox" 
								style="height: 42px; width: 285px; margin-top: -3px;" readonly>
                			</div>
							<div class="blog-author__content" style="text-align: center; padding-left: 0px;">
								<p style="font-size: 18px; margin-bottom: -8px;">신고사유</p>
                				<select name="rep_reason" class="textBox" style="padding-top: -12px; margin-bottom: -39px; width: 290px;">
                					<option value="" selected disabled="hidden">신고사유를 선택해주세요</option>
                					<option value="욕설">욕설</option>
                					<option value="광고성 프로젝트">광고성 프로젝트</option>
                					<option value="지식 재산권 침해">지식 재산권 침해</option>
                					<option value="프로젝트 이행 문제">프로젝트 이행 문제</option>
                					<option value="기타">기타</option>
                				</select>
                			</div>
							<div style="text-align: center; margin-top: 67px;">
								<p style="font-size: 18px; margin-bottom: 10px;">상세내용</p>
								<div>
									<textarea class="bigTextArea" name="rep_content" style="resize: none; width: 450px; height: 220px;" placeholder="상세내용을 작성해주세요."></textarea>
								</div>
                			</div>
                			<div style="text-align: center">
                				<button id="reportMo-btn" style="width: 35%; height: 45px; background: #a2a8a6; color: black; margin:25px 0px;">닫기</button>
                				<button type="button" id="reportMo-btn" style="width: 35%; height: 45px; background: #29f0b4; color: black; margin:25px 0px;" onclick="rpcheck();">제출</button>
                			</div>
                		</div>
                  	</div>
                  	</form>
                </div>
                
</body>
</html>