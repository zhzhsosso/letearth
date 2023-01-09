<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp"%>

	
	<img alt="" src="/resources/main_construction.png">
	<section class="contact-form-area">	
	
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="section-title text-center">
						<h3 class="title">관리자 FAQ 수정페이지</h3>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-lg-8">
				
		<!-- form 태그 시작 -->
					<form role="form" name="fr" method="post">
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
											<input type="text" name="not_title" class="form-control" id="not_title" value="${vo.not_title }">
										</div>

										<div class="form-group">
											<label for="not_middle">카테고리</label> 
											<select name="not_middle" class="form-control" id="not_middle">
												<c:choose>
													<c:when test="${vo.not_middle != null}">
														<option value="" selected hidden>선택하세요</option>
														<option value="1"
														<c:if test="${vo.not_middle == 1}">
														selected="selected"
														</c:if>
														>구매자</option>	
														<option value="2"
														<c:if test="${vo.not_middle == 2}">
														selected="selected"
														</c:if>
														>후원자</option>	
														<option value="3"
														<c:if test="${vo.not_middle == 3}">
														selected="selected"
														</c:if>
														>판매자</option>	
													</c:when>
													<c:when test="${vo.not_middle == null }">
														<option value=""></option>
														<option value="1">구매자</option>
														<option value="2">후원자</option>
														<option value="3">판매자</option>
													</c:when>																								
												</c:choose>
											</select>
										</div>

										<div class="form-group">
											<label>글 내 용</label>
											<textarea name="content" class="form-control" rows="3"
												placeholder="내용을 입력하세요.">${vo.not_content }</textarea>
										</div>
									</div>
								</div>
						
						<!-- 버튼 -->
								<div class="box-footer">
					                <button type="submit" class="btn btn-danger">수정</button>
					                <button type="reset" class="btn btn-warning">취소</button>
					           </div>
							</div>
						</div>
					</form>
					<p class="form-message"></p>
				</div>
			</div>
		</div>
	</section>
	
	
	
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){	
		
		$(".btn-warning").click(function(){
			location.href="/board/adFaqRead?not_no=${vo.not_no}";
		});

	});
</script>
 
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
