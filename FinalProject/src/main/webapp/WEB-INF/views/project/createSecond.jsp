<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- sweetalert -->
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
	function Checkb(){
		
		if(document.fr.check1.checked == false){
			swal('유의사항을 체크해주세요.',"",'info');
			return;
		}
		if(document.fr.check2.checked == false){
			swal('유의사항을 체크해주세요.',"",'info');
			return;
		}
		if(document.fr.check3.checked == false){
			swal('유의사항을 체크해주세요.',"",'info');
			return;
		}
		
		fr.submit();
	}

</script>


	<section class="about-area pt-120 pb-120">
		<section class="project-details-content-area pb-110">
	        <div class="container">
		        <div class="row justify-content-center">
		             <div class="col-lg-8">
	                    <div class="tab-content" id="pills-tabContent">
	                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
	                            <div class="project-details-content-top">
		                           	 <div class="col-lg-4 col-md-7 col-sm-9">
		                           	 </div>
	                            </div>
	                            <div class="project-details-item">
	                                <div class="item">
	                                	<br>
		                           		<p style="font-size: 2.5em; color: black; padding-bottom: 1em">시작 전, 이런 준비가 필요해요!</p>
		 								
		 								<h5 class="title" style="padding-bottom: 1em">프로젝트를 진행하시려면 아래 내용을 준비해주세요.</h5>
				                        
				                        <form role="form" action="/project/createThird" name="fr">
					                        <div class="list">
					                            <ul>
					                                <li style="padding-bottom: 0.5em">
					                                	<input type="checkbox" id="check1"> 
					                                	　대표 창작자는 만 19세 이상의 성인이어야 합니다.
					                               	</li>
					                                <li style="padding-bottom: 0.5em">
					                                	<input type="checkbox" id="check2"> 
					                                	　렛어스에서 연락이 필요한 경우가 있으므로, 본인 명의의 휴대폰 번호와 이메일 주소가 필요합니다.
					                               	</li>
					                                <li style="padding-bottom: 3em">
					                                	<input type="checkbox" id="check3"> 
					                                	　펀딩 성공 후의 정산을 위해 신분증 또는 사업자 등록증, 국내 은행 계좌를 준비해 주세요.
					                           		</li>
					                            </ul>	                           
					                        </div>                     
					                        <a class="main-btn" href="/project/createFirst">뒤로가기</a>
					                        <a class="main-btn" onclick="return Checkb();">다음</a>
				                        </form>
	                                </div>
	                            </div>
	                    	</div>
	                	</div>
	            	</div>
		        </div>
	        </div>
	    </section>
    </section>
    
     
	

<%@ include file="../include/footer.jsp" %>