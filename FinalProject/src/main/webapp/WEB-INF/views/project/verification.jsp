<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>

<script type="text/javascript">
	function veriFy() {

		var IMP = window.IMP; // 생략 가능
		IMP.init("imp26572603"); // 예: imp00000000

		IMP.certification({
			pg : 'MIIiasTest'
		}, function(rsp) { // callback
			if (rsp.success) { // 인증 성공 시
				// jQuery로 HTTP 요청
				jQuery.ajax({
					url : "/project/confirm",
					method : "POST",
					headers : {
						"Content-Type" : "application/json"
					},
					data : {
						imp_uid : rsp.imp_uid
					},
				});
				Swal.fire({
					icon : 'success',
					title : '인증에 성공했습니다.',
					text : '프로젝트 작성 페이지로 이동합니다.',
					confirmButtonText : '확인',
					confirmButtonColor: '#A4AC85'
				})
				setTimeout(function () {
					location.href = "/project/confirm?result=success";
				}, 3000);
			} else {
				Swal.fire({
					icon : 'error',
					title : '인증에 실패하였습니다.',
					confirmButtonText : '확인',
					confirmButtonColor: '#A4AC85'
				})
			}
		});

	}
</script>

<section class="about-area pt-120 pb-120">
	<section class="project-details-content-area pb-110">
		<div class="row justify-content-center">
			<div class="col-lg-8" style="display: flex; justify-content: center; text-align: center;">
				<div class="item" style="padding-top: 3em;">
					<p style="font-size: 2.5em; color: #414934; padding-bottom: 1em">
						본인 임을 인증해주세요.</p>
					<h5 class="title" style="padding-bottom: 2em;">
						대표 창작자는 본인 인증 후 프로젝트 작성이 가능합니다. <br> 아래의 버튼을 눌러 본인인증을 해주세요.
					</h5>
					<a class="btn btn-primary btn-lg" href="javascript:veriFy()"
						style="background-color: #6F7B63; border: none;"> 인증하기
					</a> <br><br><br>
					<a class="main-btn" href="/project/createThird"
						style="background-color: #A4AC85; border: none;"">뒤로가기</a>
				</div>
			</div>
		</div>
	</section>
</section>



<%@ include file="../include/footer.jsp"%>