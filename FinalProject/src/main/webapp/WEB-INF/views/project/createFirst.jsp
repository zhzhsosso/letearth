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
						${mem_id }님,반갑습니다!
						</p>
						<p>
							프로젝트 개설을 축하드려요.<br> 서포터님들께 제품과 서비스를 드리며 잊지 못할 경험을 선물해 보세요. <br>
							${mem_id }님이 펀딩에 성공할 수 있도록 Let Earth가 함께할게요.<br>
							<br> 그럼 출발 해볼까요?<br>
							<br>
							<br>
						</p>
						<div align="center">
							<a class="main-btn" href="/project/createSecond"
								style="background-color: #A4AC85; border: none;">프로젝트 만들기</a>
						</div>
					</div>
			</div>
		</div>
	</section>
</section>



<%@ include file="../include/footer.jsp"%>