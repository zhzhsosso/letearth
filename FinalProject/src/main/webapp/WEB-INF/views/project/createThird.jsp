<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function() {
			$('#result').attr('value', 'ok');
		});
	});
</script>
<script>
	function ckModal() {
		if (document.getElementById("result").value == "") {
			Swal.fire({
				icon : 'error',
				title : '심사 기준을 확인해주세요.'
			})
			document.fr.reward_stock.focus();
			return false;
		}

		location.href = "/project/verification";
	}
</script>

<section class="about-area pt-120 pb-120">
	<section class="project-details-content-area pb-110">
		<div class="row justify-content-center">
			<div class="col-lg-8" style="display: flex; justify-content: center; text-align: center;">
				<div class="item" style="padding-top: 3em;">
					<br>
					<p style="font-size: 2.5em; color: #414934; padding-bottom: 1em">
						프로젝트 심사기준을 확인해주세요</p>
					<h5 class="title" style="padding-bottom: 1em">심사 기준을 준수하면 보다
						빠른 프로젝트 승인이 가능합니다.</h5>
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btn" style="background-color: #6F7B63; border: none;">심사 기준 전문
						보기</button>
					<br> <br>
					
					<h4>승인 가능 프로젝트</h4>
					<br>
					<ul style="list-style-type: square; text-align: left; display: inline-block;">
						<li>기존에 없던 새로운 시도</li>
						<li>기존에 없던 작품, 제품, 디지털 콘텐츠, 활동, 행사</li>
						<li>창작자의 이전 제품 및 콘텐츠는 새로운 선물에 부수적으로 제공 가능</li>
					</ul>
					<br> <br> <br>

					<h4>반려 대상 프로젝트</h4>
					<br>
					<ul style="list-style-type: square; text-align: left; display: inline-block;">
						<li>기존 상품· 콘텐츠의 판매 및 홍보</li>
						<li>제3자에 후원금 또는 물품 기부</li>
						<li>시중에 판매 및 유통되었던 제품·콘텐츠 제공</li>
						<li>현금, 주식, 지분, 복권, 사이버머니, 상품권 등 수익성 상품 제공</li>
						<li>추첨을 통해서만 제공되는 선물</li>
						<li>무기, 군용장비, 라이터 등 위험 품목</li>
					</ul> <br> <br>
					<input type="hidden" name="result" id="result" value="">
					<a class="main-btn" href="/project/createSecond" style="margin-right: 2em; background-color: #A4AC85; border: none;">뒤로가기</a>
					<a class="main-btn" onclick="ckModal();" style="background-color: #A4AC85; border: none;">다음</a>

					<!-- 모달 영역 시작 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel">
						<div class="modal-dialog modal-lg modal-dialog-scrollable"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">광고 심의 가이드라인</h4>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
								</div>
								<div class="modal-body" align="left">
									<h2>프로젝트 심사 기준</h2>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제1조 목적</p> <br>
									<p>
									렛어스에서 진행되는 모든 프로젝트는 이용약관에 따라,
									모금상의 신뢰와 안전을 위해 공개되기 전에 렛어스 심사팀(이하 ‘운영자’)의 심사를 거칩니다.
									이 기준은 창작자가 작성한 프로젝트를 운영자가 심사하는 ‘심사’ 절차상 승인 및 반려 요건을 규정하기 위해 작성되었습니다.
									</p>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제2조 용어의 정의</p> <br>
									① 이 기준에서 사용하는 용어의 뜻은 다음과 같습니다.<br>
										1. ‘심사’란 창작자의 프로젝트를 운영자가 검수·심사하여 승인 또는 반려하는 것을 말합니다.<br>
										2. ‘승인’이란 프로젝트가 심사를 통과하여 모금을 진행할 수 있게 된 상태를 뜻합니다.<br>
										3. ‘반려’란 프로젝트가 심사 기준에 맞지 않아 모금을 진행할 수 없다고 판단하는 것을 뜻합니다.<br>
										4. '프로젝트'란 기존에 없던 작품, 제품, 디지털 콘텐츠, 활동, 행사 등을 제작하고 실현시키기 위한 활동을 뜻합니다.<br>
									② 본 기준에서는 본 조에서 정한 용어가 우선적으로 적용되며, 본 조에서 정의되지 않은 용어는 렛어스 이용약관 및 관련 법령·관습에 따릅니다.<br>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제3조 심사 절차</p> <br>
									<p>
									① 심사는 창작자가 프로젝트 올리기를 통해 작성하신 후 심사 요청하여야 진행됩니다.<br>
									② 내용이 모두 작성되지 않았거나, 보완 요청 사항을 반영하지 않은 채로 심사를 요청하는 경우 프로젝트가 반려될 수 있습니다.<br>
									③ 운영자는 창작자가 작성한 내용과 제출한 자료를 심사하여 수정을 요청하거나 반려할 수 있으며, 개별 반려 사유에 대한 세부 내용은 공개하지 않습니다.<br>
									④ 심사 과정상 운영자와 창작자 간의 소통은 창작자 계정에 등록된 이메일로 하며, 이메일 소통이 불가한 경우에는 심사가 진행되지 않습니다.<br>
									⑤ 창작자가 심사 요건에 위배되는 사항을 숨기거나 사실과 다른 내용을 기재하는 경우 심사 승인이 취소될 수 있습니다.<br>
									</p>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제4조 프로젝트 모금 목적</p> <br>
									<p>
									① 프로젝트는 구체적인 목표를 달성하기 위한 비용을 마련한다는 모금 목적이 뚜렷해야 하며, 분명한 완료의 기준과 예상 결과물이 있어야 합니다.<br>
									② 기존의 제품·콘텐츠를 추가 제작하거나 단순히 복제, 소분, 재포장하여 제공하기 위한 프로젝트는 진행할 수 없습니다.<br>
									③ 후원금의 일부 또는 전체를 제3자에게 금액으로 전달하거나 물품을 구매하여 기부하기 위한 프로젝트는 진행할 수 없습니다.</p>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제5조 예산 및 제작·전달 계획</p> <br>
									<p>
									① 예산은 프로젝트의 제작 및 실현과 무관한 목적으로 기재해서는 안 됩니다.<br>
									② 프로젝트가 현재 어느 단계까지 준비되었는지 사실대로 기재해야 하며, 아직 만들어지지 않은 결과물이 이미 존재하는 것처럼 오인될 수 있는 표현을 사용해서는 안 됩니다.<br>
									③ 운영자는 구동이나 체험이 가능한 가제품·샘플 제작 여부 확인을 요청할 수 있습니다.<br>
									④ 만들고자 하는 결과물의 예상되는 사양, 견본 이미지, 영상 등을 기재하여 후원자가 상세한 내용을 가늠할 수 있어야 합니다.<br>
									⑤ 후원자에게 선물을 전달할 방법(배송, 현장 수령, 렛어스 메시지 등)을 명시해야 하며, 선물 수령을 위해 추후 후원금 외 별도 비용이나 불필요한 타서비스 가입, 개인 정보 등을 요구할 수 없습니다.<br>
									⑥ 선물은 프로젝트가 성사되어 후원자의 결제가 종료된 이후에 전달해야 합니다.<br>
									⑦ 프로젝트의 계획에 불확실한 사항이나 위험 요소가 있는 경우 이를 고지하고, 이로 인해 진행에 차질이 발생할 경우의 대처 방안을 기재해야 합니다.<br>
									⑧ 선물 전달 과정에서 파손이나 불량이 발생할 경우를 위한 기준 및 대처방안을 기재해야 합니다. 참가권이나 사용권 형태의 선물이 있는 경우 타인 양도 가부, 사용범위 등 선물 전달 및 사용에 관한 정책을 기재해야 합니다.</p>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제6조 창작자 신뢰도</p> <br>
									<p>
									① 프로젝트를 실제로 진행하는 개인 또는 사업자가 프로젝트를 작성하고 관리해야 하며 다음과 같이 인증 및 서류 제출을 완료해야 합니다.<br>
									개인은 만 19세 이상의 본인 인증 및 신분증 사본을 제출해야 합니다.<br>
									개인 사업자는 만 19세 이상의 본인 인증 및 사업자등록증을 제출해야 합니다.<br>
									법인 사업자는 만 19세 이상의 대표자 또는 사업자에 속한 담당자의 본인인증 및 사업자등록증을 제출해야 합니다.<br>
									창작자는 한국에서 개설된, 창작자 본인 명의의 입금 가능한 은행 계좌를 등록해야 합니다.<br>
									창작자는 연락 가능한 한국 통신사의 핸드폰 번호를 등록해야 합니다.<br>
									② 프로젝트를 여러 주체가 공동 기획하였거나 제작·관리하는 경우, 계정에 등록된 창작자가 프로젝트와 후원자에 대한 모든 책임을 지며 각 참여자의 참여 범위를 프로젝트에 분명하게 기재해야 합니다.<br>
									③ 렛어스 또는 타 크라우드 펀딩 플랫폼에서 앞서 진행한 프로젝트가 있는 창작자는 다음과 같은 경우 새 프로젝트 진행이 제한됩니다. 본 항의 진행 제한은 계정 단위가 아닌 창작자 단위로 이루어집니다.<br>
									펀딩이 성사된 첫 프로젝트가 선물 전달을 완수하기 전인 경우 (단, 일부 후원자만 선물 수령 포기 등 부득이한 사유로 전달하지 못한 경우는 완수한 것으로 간주)<br>
									앞서 진행한 프로젝트의 선물 전달이 지연되고 있거나 해결되지 않은 분쟁이 있는 경우<br>
									④ 프로젝트에 관한 중대한 논란 또는 법적 분쟁 중이거나 약관 위반으로 이용 정지 중인 창작자는 새로운 프로젝트 진행이 제한됩니다. 본 항의 진행 제한은 창작자의 모든 계정에 적용됩니다.<br>
									⑤ 동일한 모금 목적으로 여러 플랫폼(국내·해외 무관)에서 동시에 프로젝트를 진행하거나, 외부 모금(계좌 입금 유도 등)을 병행할 수 없습니다.</p>
									<br>
									<p style="color: black; font-size: 20px;">&#128172;제7조 선물 제공 불가 항목</p> <br>
									<p>
									① 아래 선물들은 렛어스의 취지, 커뮤니티의 안전, 현행법 준수를 위해 제공할 수 없습니다.<br>
										1. 시중에 판매·유통되었던 제품·콘텐츠 (단, 창작자가 이전에 제작한 제품·콘텐츠를 새 프로젝트 선물에 부수적으로 구성하는 것은 허용)<br>
										2. 수익성 항목 (현금, 주식, 지분, 복권, 사이버머니, 상품권 등)<br>
										3. 추첨을 통해서만 선물을 받을 수 있는 자격<br>
										4. 무기류, 군복 및 군용장구, 경찰 제복 및 장비, 라이터 등 위험 품목<br>
									② 본 조의 제한은 쿠폰이나 추후 지급권, 또는 프로젝트 심사 이후에 추가된 선물에도 동일하게 적용됩니다.<br>
									</p><br>
									<p style="color: black; font-size: 20px;">&#128172;제8조 후원자 개인 정보 보호</p> <br>
									<p>
									① 후원자 대상 공지나 문의 처리 등의 소통을 위해 렛어스 커뮤니티와 메시지 기능을 우선적으로 사용하여야 하며, 외부 채널을 주된 문의처로 기재할 수 없습니다.<br>
									② 후원자의 배송정보와 연락처는 렛어스 시스템을 통해 개인 정보 제공 동의를 거쳐 수집된 배송정보와 연락처를 사용하여야 하며, 부득이한 사유 없이 별도의 배송정보를 수집해서는 안 됩니다.<br>
									</p>
								</div>
							</div>
						</div>
					</div>
					<!-- 모달영역 끝 -->

				</div>
			</div>
		</div>
	</section>
</section>

<%@ include file="../include/footer.jsp"%>