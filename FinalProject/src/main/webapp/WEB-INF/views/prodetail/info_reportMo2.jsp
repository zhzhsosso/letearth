<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<meta charset="UTF-8">

	<script type="text/javascript">

	function rprpcheck(){
		if(document.rprpfr.rep_reason.value == ""){
			swal('신고사유를 선택하세요','','warning');
			return false;
		}
		if(document.rprpfr.rep_content.value == ""){
			swal('신고내용을 입력하세요','','warning');
			return false;
		}
		swal('신고가 정상적으로 접수 되었습니다','','info').then(function(){
			document.rprpfr.submit();
		});
		
	}
	</script>
	<style>
		.rrbtn {
		width: 125px;
	    border: 0px;
	    background: #A4AC85;
	    height: 45px;
	    border-radius: 5px;
	}
	
	.ccbtn {
		width: 125px;
	    border: 0px;
	    background: #D7D1B9;
	    height: 45px;
	    border-radius: 5px;
	}
	</style>
</head>
<body>

                
    <!-- 답글 모달-->
	<div class="modal fade" id="reportreplyMo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	      <div class="modal-content" style="height: 460px; width: 570px;">
	        <div class="modal-header">
	          <h4 class="modal-title" id="exampleModalLabel">신고하기</h4>
	          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">x</span>
	          </button>
	        </div>
			<div class="modal-body">
		         <!-- 답글 작성하기 판매자만 -->
	   			 <div class="comment-form">
	                  <form role="form" class="contact-one__form" name="rprpfr" method="post">
	                  
	                   <input type="hidden" id="pro_no" name="pro_no" value="${pdvo.pro_no }">
                		<input type="hidden" id="reply_no" name="reply_no">
                		<input type="hidden" id="reper_id" name="reper_id" value="${sessionScope.mem_id }">
                		<input type="hidden" id="rep_cat" name="rep_cat" value="1">
                		<input type="hidden" id="rep_status" name="rep_status" value="N">
						
	                      <div class="row">
           					
           					<div class="blog-author__content" style="text-align: center; padding-left: 120px; margin-bottom: 50px;">
								<p style="font-size: 18px; margin-bottom: -8px;">신고사유</p>
                				<select name="rep_reason" class="textBox" style="padding-top: -12px; margin-bottom: -39px; width: 290px;">
                					<option value="" selected disabled="hidden">신고사유를 선택해주세요</option>
                					<option value="욕설">욕설</option>
                					<option value="불법정보 포함">불법정보 포함</option>
                					<option value="청소년에게 유해한 내용">청소년에게 유해한 내용</option>
                					<option value="불쾌한 표현">불쾌한 표현</option>
                					<option value="기타">기타</option>
                				</select>
                			</div>
               				
	                          <div class="col-lg-12">
	                          	<div class="rere">
	                              <div class="input-box">
	                                  <textarea placeholder="상세내용을 작성해주세요" name="rep_content" style="resize: none; width: 535px; height: 195px;"></textarea>
	                            	</div>
	                            </div>
	                          </div>
	                         
               				
               				
	                          <div class="col-lg-12 text-left">
	                            <div class="comment-one__single">
		                              <div class="blog-btn" style="margin: 7px;">
			                             <button class="rrbtn" type="button" onclick="rprpcheck();">신고하기</button>
								         <button class="ccbtn" type="button" data-dismiss="modal">취소하기</button>
			                          </div>
			                         
	                         </div>
	                          </div>
	                      </div>
	                  </form>
	             	</div>
	  				<!-- 댓글 작성하기 -->
			</div>
	        
		        
			</div>
		</div>
	</div> 
</body>
</html>