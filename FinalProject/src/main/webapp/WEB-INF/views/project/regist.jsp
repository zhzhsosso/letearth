<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script type="text/javascript">
function createReward(seq){
	Swal.fire({
	  title: '저장하시겠습니까?',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#A4AC85',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '등록',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
          //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
	 		if($('input:radio[name=par_cat]').is(':checked') == false){
	 		    Swal.fire({
	 		    	icon: 'error',
					title: '구분을 선택해주세요',
					confirmButtonText : '확인',
					confirmButtonColor: '#A4AC85'
				})
	 			return false;
	 		}
	 		if($('#input-file').val() == ""){
	 		    Swal.fire({
	 		    	icon: 'error',
	 		    	title: '사진을 입력해주세요',
	 				confirmButtonText : '확인',
	 				confirmButtonColor: '#A4AC85'
				})
	 			return false;
	 		}
	 		if($('#intro').val() == ""){
	 			Swal.fire({
	 		    	icon: 'error',
	 		    	title: '판매자 소개를 입력해주세요',
	 				confirmButtonText : '확인',
	 				confirmButtonColor: '#A4AC85'
				})
	 			return false;
	 		}
	 		if($("input[name='par_cat']:checked").val() == '사업자') {
				par_num = $('#par_com_num').val();	
				
				if($('#par_com_num').val() == ""){
					 Swal.fire({
		 		    	icon: 'error',
		 		    	title: '사업자등록번호를 입력해주세요',
		 				confirmButtonText : '확인',
		 				confirmButtonColor: '#A4AC85'
					})
		 			return false;
				}
	 		} else if($("input[name='par_cat']:checked").val() == '개인') {
	 			if($('#par_birth').val() == ""){
					 Swal.fire({
		 		    	icon: 'error',
		 		    	title: '생일을 입력해주세요',
		 				confirmButtonText : '확인',
		 				confirmButtonColor: '#A4AC85'
					})
		 			return false;
				}
	 		}
	 		
	 		const sendingData = new FormData();
			sendingData.append('par_cat',$("input[name='par_cat']:checked").val());  
			sendingData.append('par_intro',$('#intro').val());  
			sendingData.append('par_birth',$('#par_birth').val());  
			sendingData.append('file1',$('#input-file')[0].files[0]);
			sendingData.append('file2',$('#input-file2')[0].files[0]);
	 		
	 		$.ajax({
	 		    type:'post',
	 		    url:"/project/regist",
	 		    data: sendingData,
	 		    processData: false,
			    contentType: false,
	 		    success : function(resp) {
	 		    	Swal.fire({
	 					icon : 'success',
	 					title : '저장 되었습니다.',
	 					text : '마이페이지에서 정산 계좌를 등록해주세요.',
	 					confirmButtonText : '확인',
	 					confirmButtonColor: '#A4AC85'
	 				})
		    		setTimeout(function () {
	 		    		location.href="/mypage/mypage";
		    		}, 2000);
	 		    },
	 		    error: function(jqXHR, textStatus, errorThrown) {
	 		        alert("ERROR : " + textStatus + " : " + errorThrown);
	 		    }        
	 		});
	 	 }
	})
}
</script>

<script type="text/javascript">
$(document).ready(function(){
	
    $('#scan').hide();   // 초깃값 설정
    $('#scan2').hide();   // 초깃값 설정
    $('#com_num').hide();
    $('#birth').hide();
		
	$("input[name='par_cat']").change(function(){
		if($("input[name='par_cat']:checked").val() == '개인'){
			$('#scan2').hide();
			$('#com_num').hide();
			$('#scan').show();
			$('#birth').show();
		}	
		else if($("input[name='par_cat']:checked").val() == '사업자'){
			$('#scan').hide();
			$('#birth').hide();
			$('#scan2').show();
			$('#com_num').show();
		}

	});
		
});
</script>

	<!--====== PROJECT CONTENT PART START ====== -->
<form method="post" name="fr" id="fr">
	<div style="display: flex; justify-content: center;">
		<div class="col-lg-8">
			<div class="blog-details__main">
				<div class="meta">
					<div class="blog-details__tags">
						<span>판매자 구분</span>
					</div>
					<small>개인 판매자는 주민등록증, 사업자는 사업자 등록증을 업로드 해주세요.</small>
				</div>
			</div>
			<div class="select">
				<input type="radio" id="select" name="par_cat" value="개인"><label for="select" style="position: inherit;">개인</label>
				<input type="radio" id="select2" name="par_cat" value="사업자"><label for="select2" style="position: inherit;">사업자</label>
			</div>
			
			<label class="btn btn-primary" for="input-file" id="scan" style="background-color: #414934; position: inherit; border: none;">
				주민등록증 추가 </label>
			<div style="display: none">
				<input type="file" id="input-file" name="par_scan" />
			</div>

			<label class="btn btn-primary" for="input-file" id="scan2" style="background-color: #414934; position: inherit; border: none;">
				사업자 등록증 추가 </label>
			<div style="display: none">
				<input type="file" id="input-file" name="par_scan" />
			</div>

			<div class="blog-details__main">
				<div class="blog-details__meta">
					<div class="blog-details__tags">
						<span>프로필 이미지</span>
					</div>
					<small>창작자 개인이나 팀의 사진을 올려주세요</small>
				</div>
			<label class="btn btn-primary" for="input-file2" style="background-color: #414934; position: inherit; border: none;">
				사진 업로드 </label>
			<div style="display: none">
				<input type="file" id="input-file2" name="mem_profile" />
			</div>
			</div>

			<div class="blog-details__main">
				<div class="blog-details__meta">
					<div class="blog-details__tags">
						<span>판매자 소개</span>
					</div>
					<small>2~3문장으로 판매자님의 이력과 간단한 소개를 써주세요.</small>
				</div>
			</div>
			<div id="intro_div">
				<textarea name="par_intro" style="resize: none;" id="intro" placeholder="내용을 입력해주세요." class="textArea">${proVO.par_intro }</textarea>
			</div>

			<div class="blog-details__main">
				<div class="blog-details__meta">
					<div class="blog-details__tags">
						<span>판매자 정보</span>
					</div>
					<small>개인 판매자는 생년월일, 사업자는 사업자 등록번호를 입력해주세요.
					</small>
				</div>
			</div>
			<div id="birth">
				예금주 생년월일 <br>
				<div class="step-body">
					<input type="date" class="textBox" name="par_birth" id="par_birth" value="${proVO.par_birth }">
				</div>
			</div>
			<div id="com_num">
				사업자 등록번호 <br>
				<input type="text" name="par_com_num" id="par_com_num" class="textBox" datetimeonly="true" ${proVO.par_com_num }> <br>
			</div>
			<br>
			<div class="text-center">
				<button type="button" class="main-btn" onclick="createReward();" style="background-color: #A4AC85; border: none;">저장</button>
			</div>
		</div>
	</div>
</form>

<script type="text/javascript">
// 글자수 제어 1
$(document).ready(function() {
	$('#intro').one('click',function(){
		$('#intro_div').append('<div id="intro_cnt">ㅤ0 / 200</div>');
	});
	
    $('#intro').on('keyup', function() {
        $('#intro_cnt').html("ㅤ"+$(this).val().length+" / 200");
 
        if($(this).val().length > 200) {
            $(this).val($(this).val().substring(0, 200));
            $('#intro_cnt').html("ㅤ200 / 200");
        }
    });
});
</script>
