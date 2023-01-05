<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>

	
	<img alt="" src="/resources/main_construction.png">
	<section class="contact-form-area">
	<form role="form" method="post">
		<input type="hidden" name="not_no" id="not_no" value="${vo.not_no }">
	</form>
	
		<div class="container">
			
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section-title text-center">
						<h3 class="title">관리자 FAQ 본문</h3>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8">
				
		<!-- form 태그 시작 -->
<!-- 					<form role="form" name="fr" id="contact-form" action="" method="post"> -->
						<div class="conact-form-item">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<div class="input-box mt-20">

										<div class="form-group">
											<label for="not_no">글 번 호</label> 
											<input type="text" name="not_no" class="form-control" id="not_no" value="${vo.not_no }" readonly>
										</div>
						
										<div class="form-group">
											<label for="not_title">제 목</label> 
											<input type="text" name="not_title" class="form-control" id="not_title" value="${vo.not_title }" readonly>
										</div>

										<div class="form-group">
											<label for="not_middle">카테고리</label> 
											<select name="not_middle" class="form-control" id="not_middle">												
													<c:if test="${vo.not_middle != null}">
														<option value="" selected disabled hidden>선택하세요</option>
														<option value="1" disabled="disabled"
														<c:if test="${vo.not_middle == 1}">
														selected="selected"
														</c:if>
														>구매자</option>	
														<option value="2" disabled="disabled"
														<c:if test="${vo.not_middle == 2}">
														selected="selected"
														</c:if>
														>후원자</option>	
														<option value="3" disabled="disabled"
														<c:if test="${vo.not_middle == 3}">
														selected="selected"
														</c:if>
														>판매자</option>	
													</c:if>																																			
											</select>
										</div>

										<div class="form-group">
											<label>글 내 용</label>
											<textarea name="content" class="form-control" rows="3"
												placeholder="내용을 입력하세요." readonly>${vo.not_content }</textarea>
										</div>
									</div>
								</div>
						
						<!-- 버튼 -->
								<div class="box-footer">
					                <button type="submit" class="btn btn-danger">수정</button>
					                <button type="submit" class="btn btn-warning">삭제</button>
					                <button type="submit" class="btn bg-purple">목록</button>
					           </div>
							</div>
						</div>
<!-- 					</form> -->
					<p class="form-message"></p>
				</div>
			</div>
		</div>
	</section>
	
	
	
<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']"); 
		 
		$(".btn-danger").click(function(){
			formObj.attr("action", "/board/adFaqModify");
			formObj.attr("method", "get");
			formObj.submit(); // form태그를 submit방식으로 보내자.
		});
		
		
		// 삭제버튼(bno 가지고 submit-/board/remove)
		$(".btn-warning").click(function(){
			// 바로 삭제동작 -> POST
			formObj.attr("action", "/board/adFaqRemove");
			// formObj.attr("method", "post"); => 기본값이 post라서 굳이 안 적어도 된다.
			formObj.submit(); // form태그를 submit방식으로 보내자.
		});
		
		
		$(".bg-purple").click(function(){
			// 목록으로 이동
			location.href="/board/adFaqList";
		});
	});
</script>
 
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
