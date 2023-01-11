<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
#contentArea{
	height:600px;
	overflow: auto;
}
		
#contentArea::-webkit-scrollbar {
	width: 10px;
}
	  	
#contentArea::-webkit-scrollbar-thumb {
	background-color: #2f3542;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}
	  	
#contentArea::-webkit-scrollbar-track {
	background-color: none;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
}
	  
</style>

<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
	function chkbtn(){
		var chk1 = $('#ckbx1').prop('checked');
		var chk2 = $('#ckbx2').prop('checked');
		
		if(chk1 && chk2){
			location.href="/member/join";
		} else{
			swal('필수약관에 동의해주세요!','약관에 모두 동의하셔야 회원가입이 가능합니다.','info');
		}
	}  
</script>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
		<section class="contact-form-area" style="padding-bottom: 0px;">
			<div class="container" style="margin-top: 110px; margin-bottom: 30px;">
			        
				<div class="row justify-content-center">
					<div class="col-lg-8">
						<div class="section-title text-center">
							<h3 class="title">Join</h3>
			                <span>회원가입 전 약관에 동의해주세요!</span>
			            </div>
			       </div>
			   </div>
			</div>
		</section>	
	
		<section class="project-details-content-area pb-110">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade active show" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">
                            <div class="project-details-updates">
                                <div class="project-details-updates-top" style="padding-bottom: 0px;">
                                    <h3 class="title"><input type="checkbox" id="ckbx1" style="zoom: 1.5; accent-color: green;"> 개인정보 처리방침(필수)</h3>
                                </div>
                                <div id="contentArea">  
                                <div class="project-details-updates-content">
                                    <p> 
                                    <b>제1조 의의</b><br>
									회사는 이용자(이하 "회원" 또는 "이용자")의 동의를 기반으로 개인정보를 수집·이용·제공하고 있으며, 「정보통신망 이용촉진 및 정보보호에 관한 법률」(이하 "정보통신망법")을 준수하여 이용자의 개인정보 자기결정권을 적극적으로 보장합니다. 본 「개인정보처리방침」을 통하여 이용자는 자신의 개인정보가 어떠한 용도와 방식으로 취급되고 있으며, 회사가 개인정보 보호를 위해 어떠한 조치들을 취하고 있는지 알 수 있습니다.<br>
									<br>
									「개인정보처리방침」은 다음과 같은 의미를 가지고 있습니다.<br>
									<br>
									회사가 어떤 정보를 수집하고, 어떻게 이용하며, 어떻게 위탁 또는 제공하고, 언제 어떤 방식으로 파기하는지에 관한 사항을 규정합니다.<br>
									정보주체로서 이용자가 자신의 개인정보에 대해 갖는 권리(변경 및 삭제)와 이를 행사하는 방법을 안내해 드립니다.<br>
									개인정보 침해사고가 발생하는 경우 추가 피해를 예방하고 발생한 피해를 복구하기 위한 도움처를 알려드립니다.<br>
									「개인정보처리방침」에서 별도로 정의하지 않는 용어는 「렛어스 웹사이트 이용약관」제2조(용어의 정리)를 참조하시기 바랍니다.<br>
									<br>
									「개인정보처리방침」은 정부의 법령 및 지침의 변경 또는 나은 서비스의 제공을 위하여 그 내용이 변경될 수 있습니다. 회사는 「개인정보처리방침」을 개정하는 경우, 홈페이지에 공지할 것입니다.<br> </p><br>
                                    <p>
					                <b> 제2조 개인정보의 수집범위 및 방법</b> <br>
									회사는 이용자들에게 다양한 서비스를 제공하고 이용자들의 계정 생성을 돕기 위해 개인 정보를 제공받고 이를 활용하여야 합니다. 회사는 이용자들이 제공받는 서비스에 따라 다음과 같은 방법으로 개인정보를 수집합니다.<br>
									<br>
									회원가입 시 수집하는 개인정보는 아래와 같습니다.<br>
									- 일반 회원 가입: 성명, 아이디, 비밀번호, 이메일 주소, 휴대폰 번호 <br>
									- 카카오 간편 가입:카카오 간편가입시 자동 수집되는 정보<br>
									<br>
									"창작자"로부터 프로젝트 신청시 추가로 수집하는 개인정보는 아래와 같습니다. <br>
									- 성명(사업자가 법인인 경우에는 그 명칭과 대표자 성명), 주소, 본인인증 휴대폰번호나 전화번호, 사업자등록번호(사업자), 이메일 주소, 생년월일(개인)<br>
									- 은행명, 계좌번호, 예금주명, 계좌종류(개인/사업자)<br>
									별도의 창작자에 대한 확인절차를 위해 창작자의 신분증 사본, 통장 사본, 법인인감 등의 자료를 요구할 수 있습니다.<br>
									"후원자"가 후원금을 후원하는 경우 추가로 아래의 정보를 수집합니다.<br>
									- 이름, 휴대폰번호, 결제정보, 배송정보(수령인 이름, 배송지 주소, 수령인 연락처)<br>
									- 서비스 이용과정에서 IP 주소, 쿠키, 서비스이용기록, 기기정보가 생성되어 수집될 수 있습니다.<br>
									<br>
									회사는 아래의 방법을 통해 개인정보를 수집합니다.<br>
									회원 가입 및 서비스 이용과정에서 이용자가 개인정보 수집에 대해 동의하고 직접 정보를 입력하는 경우 해당 개인정보를 수집합니다.<br>
									프로젝트 신청, 진행시 직접 해당 개인정보를 입력 또는 제출하는 방식을 통해 창작자의 개인정보를 수집합니다.<br>
									프로젝트 후원 시 직접 해당 개인정보를 입력하는 방식을 통해 후원자의 개인정보를 수집합니다.<br>
									회사와 제휴한 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 정보통신망법에 따라 제휴사에서 이용자에게 개인정보 제공 등을 받은 후에 회사에 제공합니다.<br>
									기기정보와 같은 생성정보는 PC 웹, 모바일 웹, 모바일 어플리케이션 이용과정에서 자동으로 생성되어 수집될 수 있습니다.<br>
                                    </p> <br>
                                    
                                    <p>
                                    <b>제3조 수집한 개인정보의 이용</b> <br>
									회사는 회원관리, 서비스개발, 제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. <br>
									<br>
									- 회원 가입 의사의 확인, 연령 확인, 이용자의 본인 확인, 이용자 식별, 회원 탈퇴 의사의 확인 등 회원관리<br>
									- 부정이용 방지, 비인가사용 방지, 계정 도용, 서비스의 원활한 운영에 지장을 주는 행위에 대한 이용제한 조치, 분쟁조정을 위한 기록보존, 불만이나 민원의 처리, 약관 개정 등의 고지사항 전달 등 이용자 보호 및 서비스 운영<br>
									- 프로젝트 공개신청 승인여부 판단, 권고사항 전달, 프로젝트 진행 시 발생하는 민원 처리, 후원금액 결제, 프로젝트 성사 시 후원금액 결제, 세금계산서 및 현금영수증 발급, 선물전달, 프로젝트 이행과 관련된 상담 및 관련 민원처리<br>
									- 설문조사, 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅<br>
									- 신규 서비스(콘텐츠) 개발 및 특화, 서비스 이용기록과 접속빈도 분석, 서비스 이용에 대한 통계 서비스 분석 및 통계에 따른 맞춤 서비스 제공 <br>
                                    </p> <br>
                                    
                                    <p>
                                    <b>제4조 개인정보수집 및 이용에 대한 동의</b> <br>
									회사는 회원이 회사의 「개인정보 수집 및 이용에 대한 동의」에 대해 '동의합니다' 버튼 또는 '동의하지 않습니다' 버튼을 클릭할 수 있는 절차를 마련하여, '동의합니다' 버튼을 클릭하면 개인정보수집에 대해 동의한 것으로 봅니다. <br>
									회사는 개인정보의 수집, 이용, 제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않으며 동의 거절 시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보에 관한 이용자의 동의 거절을 이유로 회원 가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br>
									이메일 등 개인정보가 부정확하여 서비스 제공에 지장을 초래하는 경우 회사가 해당 정보의 수정이나 삭제를 회원에게 요청할 수 있습니다.<br>
									회원이 온라인 상에서 자발적으로 제공하는 개인정보는 제3자가 수집하여 사용할 수 있으며 이에 대한 책임은 회원이 부담합니다.<br>
                                    </p>
                                </div>
                                </div>
                            </div>
                            <div class="project-details-updates">
                                <div class="project-details-updates-top" style="padding-bottom: 0px;">
                                    <h3 class="title"><input type="checkbox" id="ckbx2" style="zoom: 1.5; accent-color: green;"> 필수약관 동의(필수)</h3>
                                </div>
                                <div id="contentArea"> 
	                                <div class="project-details-updates-content">
	                                    <p>
	                                    <b>제1조 목적</b> <br>
										이 약관은 렛어스 (이하 "회사"라 합니다)가 운영하는 사이트 LETEARTH(이하 “사이트”라 합니다)에서 제공하는 모든 웹서비스(이하 “서비스”라 합니다)를 이용함에 있어 회사와 회원의 권리와 의무, 책임 사항 및 회원의 서비스 이용 절차에 관한 사항을 규정함을 목적으로 합니다. <br>
	                                    </p> <br>
	                                    <p>
	                                    <b>제2조 용어의 정의</b> <br>
										① 이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br>
										<br>
										- "회사"라 함은 텀블벅 주식회사를 지칭하며 사이트 내에서 창조적인 분야를 총 망라하는 온라인 크라우드 펀딩 플랫폼을 서비스를 제공하는 주체를 의미합니다.<br>
										
										- "회원"이라 함은 사이트에 접속하여 본 약관에 동의함으로써 회사에 회원등록을 하고 회사가 제공하는 서비스를 지속해서 이용할 수 있는 이용자를 의미합니다.<br>
										
										- "창작자"라 함은 사이트에서 프로젝트를 게시하고 운영하여 다수로부터 후원을 받는 회원을 의미합니다.<br>
										
										- "후원자"라 함은 사이트 내에 게시된 프로젝트가 실현될 수 있도록 일정한 금액을 지불하는 방식으로 자금을 조달하는 회원을 의미합니다. 이러한 후원자의 행위는 프로젝트를 “후원”한다고 하거나 “프로젝트 밀어주기”라고 지칭합니다.<br>
										
										- "프로젝트"라 함은 사이트 내에서 타 회원들에게 자신이 수행하고자 하는 창작 작업에 대한 창작의 목적, 내용, 계획, 선물 등에 대한 사항을 소개함으로써 후원을 받을 수 있는 단위를 지칭합니다.<br>
										
										- "목표 기금액"이라 함은 프로젝트에서 최종적으로 모금하고자 하는 목표 금액을 의미합니다.<br>
										
										- "리워드"라 함은 프로젝트의 결과물로서 프로젝트가 목표 기금액만큼의 모금을 달성할 경우 창작자가 후원자에게 후원계약에서 약정한 만큼 제공하는 보상을 일컫는 말입니다.<br>
										<br>
										② 본 약관에 대해서는 본 조에서 정한 용어가 우선적으로 적용되며, 본 조에서 정의되지 않은 약관 상의 용어는 관련법령 및 관습에 따릅니다.
	                                    </p> <br>
	                                    <p>
	                                    <b>제3조 회원가입</b> <br>
										① 이용자는 회사가 정한 가입양식에 따라 회원 정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. 회사는 이용자가 기입한 내용에 대해 전문기관을 통한 본인인증을 요청할 수 있습니다. <br>
										
										② 회사는 만 14세 미만의 이용자에 대하여는 회원가입을 불허하는 것이 원칙이며 회사가 회원이 만 14세임을 알게 된 경우 회원가입을 취소할 수 있습니다.<br>
										
										③ 회사는 다음에 해당하는 경우에는 이용신청을 승낙하지 아니할 수 있습니다.<br>
										- 이미 가입된 회원과 이메일 주소가 동일한 경우<br>
										- 회원가입 신청서의 내용을 허위로 기재하였을 때<br>
										- 타인의 정보를 도용하여 신청하였을 때<br>
										- 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청했을 때<br>
										- 기타 회사가 정한 이용신청 요건이 미비되었을 때<br>
										
										④ 회사는 다음 각 호에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보 또는 일부서비스 이용을 제한할 수 있습니다.<br>
										- 서비스 관련 용량이 부족한 경우<br>
										- 기술상 장애 사유가 있는 경우<br>
										- 기타 회사가 필요하다고 인정한 경우<br>
										
										⑤ 회원가입계약의 성립 시기는 회사의 승낙이 회원에게 도달한 시점으로 합니다.
	                                    </p> <br>
	                                    
	                                    
	                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="btn" style="margin-top: 70px;">
		            	<input type="button" value="확인" style="width: 370px; height: 50px; background: #6F7B63; border: 0;" onclick="return chkbtn();">
		            	<input type="button" value="취소" style="width: 370px; height: 50px; background: #A4AC85; border: 0;" onclick="location.href='/member/main'">
            		</div>    
                </div>
            </div>
        </div>
    </section>
	
	
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	