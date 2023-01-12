<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

<section class="about-area pt-120 pb-120">
	<section class="project-details-content-area pb-110">
		<div class="row justify-content-center">
			<div class="col-lg-8" style="display: flex; justify-content: center; text-align: center;">
				<div class="item" style="padding-top: 3em;">
					<p style="font-size: 2.5em; color: #414934; padding-bottom: 1em">
						인증이 완료되었어요!</p>
					<h5 class="title" style="padding-bottom: 2em;">아래의 버튼을 눌러 프로젝트
						작성을 진행해주세요.</h5>
					<form action="/project/confirm" method="post">
						<button type="submit" class="main-btn"
							style="background-color: #6F7B63; border: none;">프로젝트
							시작하기</button>
					</form>

				</div>
			</div>
		</div>
		</div>
	</section>
</section>

<%@ include file="../include/footer.jsp"%>