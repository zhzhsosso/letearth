<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function changePw(){
		if(document.fr.mem_id.value==""){
			swal('아이디를 입력해주세요!',"",'info');
			return false;
		}
		if(document.fr.mem_pw.value==""){
			swal('비밀번호를 입력해주세요!',"",'info');
			return false;
		}
		if(document.fr.mem_pw2.value==""){
			swal('비밀번호를 입력해주세요!',"",'info');
			return false;
		}
		if(document.fr.mem_pw.value != document.fr.mem_pw2.value){
			swal('비밀번호가 일치하지 않습니다','다시 한 번 확인해주세요!','error');
			return false;
		}
		
		swal('비밀번호가 변경되었습니다!','로그인 해주세요','success');
		
		document.fr.submit();
	}

</script>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	

    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
            <div class="section-title text-center" style="padding-bottom: 10px;">
                  <span>비밀번호를 변경해주세요</span>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <form id="contact-form" action="/member/findPwAfter" method="post" name="fr">
                        <div class="conact-form-item">
                            <div class="row" style="flex-direction: column; align-items: center;">
                            	<div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="아이디 입력해주세요" name="mem_id">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="새 비밀번호를 입력해주세요" name="mem_pw">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="password" placeholder="다시 한 번 입력해주세요" name="mem_pw2">
                                    </div>
                                </div>
                                
                            </div>

                            </div>
                            <div class="input-box mt-20 text-center">
            						<button class="changePw" type="button" onclick="return changePw()" style="background: #A4AC85; color: #414934; border: 0px; width: 180px; height: 60px; cursor: pointer;">변경</button>
                                </div>
                            </form>
                        </div>
                </div>
        </div>

    </section>

	
	
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
	
