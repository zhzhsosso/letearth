<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<!-- sweetalert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
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
.btn {
	background: #674df0;
    line-height: 30px;
    padding: 0 15px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 3px;
    color: #fff;
    margin-right: 10px;
}
</style>
 <script>
$(document).ready(function(){
	// 회원정보 수정
	$('#myModify').click(function() {
		$.ajax({
			url:"/mypage/myModify",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myInfo").html(data);
			}	
		});
	});
});
</script>
<script type="text/javascript">
function deleteMember() {
	if($('#mem_pw').val() == ""){
	    Swal.fire({
		    	icon: 'error',
		    	title: '비밀번호를 입력해주세요',
		    	confirmButtonText : '확인'
		})
		return false;
	}
	
	Swal.fire({
		title: '탈퇴하시겠습니까?',
		text: '탈퇴 후 복구가 불가능합니다. 신중히 생각해주세요!',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: 'grey',
		confirmButtonText: '탈퇴',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {   
			$.ajax({
				async : true,
			    type:'post',
			    url:"/mypage/passChk",
			    data: {
			    	mem_pw:$("#mem_pw").val(),
				},
			    dataType : "text",
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    success : function(resp) { 
			    	if(resp == 0) {
			 		    Swal.fire({
			 		    	icon: 'error',
			 		    	title: '비밀번호를 다시 확인해주세요.',
			 		    	confirmButtonText : '확인'
						})
			    		return false;
			    	} else {
			    		swal('탈퇴 완료 되었습니다.','자동으로 메인페이지로 이동합니다.','info');
			    		setTimeout(function () {
			    			$.ajax({
				    			async : true,
				    		    type:'post',
				    		    url:"/mypage/myDelete",
				    		    data: {
				    		    	mem_pw:$("#mem_pw").val(),
				    			},
				    		    dataType : "text",
				    		    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				    		    success : function(resp) { 
				    		    	location.href="/project/createFirst";
				    		    },
				    		    error: function(jqXHR, textStatus, errorThrown) {
				    		        alert("ERROR : " + textStatus + " : " + errorThrown);
				    		    }        
				    		});
			    		}, 2000);
			    	}
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("ERROR : " + textStatus + " : " + errorThrown);
			    }        
			});
		} 
	})
}
</script>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<span class="user-img" style="background-image: url('${memVO.mem_profile}'); vertical-align: middle;"></span> <br><br>
				<span style="color: black;"><fmt:formatDate value="${memVO.mem_cr_dt }"/> 가입</span>
				
			</div>
		</div>
	</div>
	<hr style="margin:2em;"> 
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="section-title text-center">
				<form id="contact-form" action="assets/contact.php" method="post">
				아이디 <input type="text" name="name" value="${memVO.mem_id }" class="textBox" readonly="readonly"> <br>
				이름 <input type="text" name="name" value="${memVO.mem_name }" class="textBox" readonly="readonly"> <br>
				전화번호 <input type="text" name="name" value="${memVO.mem_phone }" class="textBox" readonly="readonly"> <br>
				이메일 <input type="text" name="name" value="${memVO.mem_email }" class="textBox" readonly="readonly"> <br>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<button type="button" class="btn" id="myModify">수정</button>
				<span class="btn" data-toggle="modal" data-target="#delete">탈퇴</span>
			</div>
		</div>
	</div>
	<!-- 리워드 추가 / 모달창 -->         
	<!-- 모달 영역 시작 (탈퇴) -->
	<form action="/mypage/myDelete" method="post" name="fr">
		<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">비밀번호 입력</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					</div>
					<div class="modal-body">
						<div class="text-center">
							<input type="password" name="mem_pw" id="mem_pw" class="textBox">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						<button type="button" class="btn btn-primary" onclick="deleteMember();">확인</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 모달영역 끝 -->
</div>