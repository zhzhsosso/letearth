<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
    height:100%;
    width:0%;
    background:#29f0b4;
}
.user-img {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 80px;
    height: 80px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
}
</style>
 <script>
$("#account").click(function(){
	$("#okk").click();
});

function ok() {
	document.oauth.submit();
}

function modifyMember() {
	$.ajax({
		async : true,
	    type:'post',
	    url:"/mypage/myModify",
	    data: {
			mem_id:$("#mem_id").val(),
			mem_name:$("#mem_name").val(),
			mem_phone:$('#mem_phone').val(),
			mem_email:$('#mem_email').val(),
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	Swal.fire({
				icon : 'success',
				title : '수정되었습니다.',
				confirmButtonText : '확인',
				confirmButtonColor: '#A4AC85'
			})
    		setTimeout(function () {
		    	$.ajax({
					url:"/mypage/myInfo",
					type:"get",
					datatype:"html",
					success:function(data){
						$("#myInfo").html(data);
					}	
				});
    		}, 2000);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}
</script>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<span class="user-img" style="background-image: url('${memVO.mem_profile}'); vertical-align: middle;"></span> <br><br>
				<span style="color: #414934; font-weight: bold;'"><fmt:formatDate value="${memVO.mem_cr_dt }"/> 가입</span>
			</div>
		</div>
	</div>
	<hr style="margin:2em;"> 
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="section-title text-center">
				<form action="/mypage/myModify" method="post">
				아이디 <input type="text" name="mem_id" id="mem_id" value="${memVO.mem_id }" class="textBox" readonly="readonly"> <br>
				이름 <input type="text" name="mem_name" id="mem_name" value="${memVO.mem_name }" class="textBox"> <br>
				전화번호 <input type="text" name="mem_phone" id="mem_phone" value="${memVO.mem_phone }" class="textBox"> <br>
				이메일 <input type="text" name="mem_email" id="mem_email" value="${memVO.mem_email }" class="textBox"> <br>
				거래은행 <input type="text" name="name" value="${memVO.bank_name }" class="textBox" readonly="readonly"> 
				<button type="button" class="myBtn2" id="account">계좌 등록</button><br>
				예금주명 <input type="text" name="name" value="${memVO.bank_acc_name }" class="textBox" readonly="readonly"> <br>
				계좌번호 <input type="text" name="name" value="${memVO.bank_acc }" class="textBox" readonly="readonly"> <br>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<button type="button" class="myBtn" id="myModify" onclick="modifyMember();">수정</button>
			</div>
		</div>
	</div>
	<!-- 계좌등록 -->
	<div id="userauth" style="display: none">
		<div>
			<form action="https://testapi.openbanking.or.kr/oauth/2.0/authorize" method="get" name="oauth">
				<!-- 고정값: code -->
				<input type="hidden" name="response_type" value="code">
				<!-- 오픈뱅킹에서 발급한 이용기관 앱의 Client ID -->
				<input type="hidden" name="client_id" value="497a96be-b96b-4f3c-9a29-c8cbed7bd6b5">
				<!-- 사용자인증이 성공하면 이용기관으로 연결되는 URL callback_uri -->
				<input type="hidden" name="redirect_uri" value="http://localhost:8080/openbanking/callback">
				<!-- Access Token 권한 범위 -->
				<input type="hidden" name="scope" value="login inquiry transfer oob">
				<!-- CSRF 보안위협에 대응하기 위해 이용기관이 세팅하는 난수값 32자리 -->
				<input type="hidden" name="state" value="12345678123456781234567812345678">
				<!-- 사용자인증타입 구분주 2)(0:최초인증, 1:재인증, 2:인증생략) -->
				<input type="hidden" name="auth_type" value="0">

				<div class="btnbtn">
					<div class="blog-btn">
						<button class="main-btn" type="button" onclick="ok()" id="okk">
						사용자 인증
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 리워드 추가 / 모달창 -->         
</div>