<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function fidCk(){
		if(document.fr.mem_name.value==""){
			swal('이름을 입력해주세요!',"",'info');
			return false;
		}
		if(document.fr.mem_email.value==""){
			swal('이메일을 입력해주세요!',"",'info');
			return false;
		}
		
		document.fr.submit();
	}

</script>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
    
    <section class="contact-form-area">
        <div class="container" style="margin-top: 110px; margin-bottom: 110px;">
            <div class="section-title text-center" style="padding-bottom: 10px;">
                  <span>가입하셨던 이름과 이메일을 입력해주세요!</span>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">
                
                    <form id="contact-form" action="/member/findId" method="post" name="fr">
                        <div class="conact-form-item">
                            <div class="row" style="flex-direction: column; align-items: center;">
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="이름을 입력해주세요" name="mem_name" style="color: #D7D1B9;">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="email" placeholder="이메일을 입력해주세요" name="mem_email" style="color: #D7D1B9;">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="input-box mt-20 text-center">
                             <button class="fid_btn" type="button" onclick="return fidCk()" style="background: #A4AC85; color: #414934; border: 0px; width: 180px; height: 60px; cursor: pointer;">아이디 찾기</button>
                             <button class="fpw_btn" type="button" onclick="location.href='/member/findPw'" style="background: #A4AC85; color: #414934; border: 0px; width: 180px; height: 60px; cursor: pointer;">비밀번호 찾기</button>
                        </div>
                    </form>
             	</div>
          </div>
                
        </div>
    </section>
    

	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	
