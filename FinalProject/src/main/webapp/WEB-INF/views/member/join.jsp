<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.join-btn{
	width: 165px;
	height: 70px;
	background: #606C38; 
	color: white;
	border: 0;
}
.ccl-btn{
	width: 165px;
	height: 70px;
	background: #FEFAEO; 
	border: 0;
}
</style>



	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#mem_id").keyup(function(){
				if($("#mem_id").val().length < 5 || $("#mem_id").val().length > 20){
					$("#mem_id_chk").html("<font color='red'>5-20자리의 아이디를 입력해주세요!</font color>");
				} else{
					// alert('체크');
					$.ajax({
						type: "get",
						url: "/members/chkID",
						data: {mem_id:$("#mem_id").val()},
						success: function(data){
							if(data == "OK"){
								$("#mem_id_chk").html("<font color='blue'> 사용 가능한 아이디입니다! </font color>");
							} else{
								$("#mem_id_chk").html("<font color='red'> 이미 사용 중인 아이디입니다! </font color>");
							}
						}
						
					});
				}
			})
		});
	
	
	function chk(){
		var mem_id = $("#mem_id").val();
		var mem_pw = $("#mem_pw").val();
		var mem_pw2 = $("#mem_pw2").val();
		var mem_name = $("#mem_name").val();
		var mem_phone = $('#mem_phone').val();
		var mem_email = $('#mem_email').val();
		
 		if (mem_id == ""){
 			swal('아이디를 입력해주세요!',"",'info');
			document.fr.mem_id.focus();
			return false;
		} 
		
		if (mem_pw == "") {
			swal('비밀번호를 입력해주세요!',"",'info');
			document.fr.mem_pw.focus();
			return false;
		} 
		
// 		if (member_pw.length < 8 || member_pw.length > 20){
// 			alert("비밀번호를 8글자~20글자 사이로 입력해주세요");
// 			document.fr.member_pw.focus();
// 			return false;
// 		} 

		if (mem_pw == mem_pw2) {
			
		} else {
			swal('비밀번호가 일치하지 않습니다!',"",'info');
			return false;
		}
		
		if (mem_name == ""){
			swal('이름을 입력해주세요!',"",'info');
			document.fr.mem_name.focus();
			return false;
		} 
		
		if (mem_phone == ""){
			swal('휴대폰 번호를 입력해주세요!',"",'info');
			document.fr.mem_phone.focus();
			return false;
		} 

		if (mem_email == ""){
			swal('이메일을 입력해주세요!',"",'info');
			document.fr.mem_email.focus();
			return false;
		}  


		//swal('회원가입이 완료되었습니다!',"로그인 후 이용해주세요",'success');
		swal('회원가입이 완료되었습니다!',"로그인 후 이용해주세요",'success').then(function(){
			document.fr.submit();
		})
		
	}
	
	
	</script>


    <!--====== FORM PART START ======-->
    
    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>회원가입</span>
                        <h3 class="title">Join</h3>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form id="contact-form" name="fr" action="/member/join" method="post">
                        <div class="conact-form-item">
                            <div class="row" style="flex-direction: column; align-items: center;">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="아이디를 입력해주세요" id="mem_id" name="mem_id">
                                        <div id="mem_id_chk"></div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="비밀번호를 입력해주세요" id="mem_pw" name="mem_pw" maxlength="20">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="비밀번호 확인" id="mem_pw2" name="mem_pw2" maxlength="20">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="이름을 입력해주세요" id="mem_name" name="mem_name">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="휴대폰 번호를 입력해주세요" id="mem_phone" name="mem_phone" maxlength="11">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="email" placeholder="이메일을 입력해주세요" id="mem_email" name="mem_email">
                                    </div>
                                </div>
                               
                                </div>
                                
                            </div>
	                            <div class="btn" style="margin-top: 55px; margin-left: 202px;">
	                                <button class="join-btn" type="button" onclick="chk();">가입하기</button>
	                                <button class="ccl-btn" type="button" onclick="history.back();">이전</button>
	                            </div>
                            </form>
                        </div>

                </div>
                
            </div>

    </section>
    
    <!--====== FORM PART ENDS ======-->
	
	

	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
