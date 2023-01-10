<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>

$(document).ready(function(){
	$('#btn').click(function(){
		$('#result').attr('value','ok');
	});
});

function createFormObject(tagName, content){
	var object;
	
	object = document.createElement('input');
	object.setAttribute('type', 'hidden');
	object.setAttribute('name', tagName);
	object.setAttribute('value', content);
    
    return object
}

function createReward(seq){
	if(document.getElementById("result").value == ""){
		Swal.fire({
	    icon: 'error',
		title: '광고 심의 가이드 라인을 확인해주세요'
	})
		return false;
	}
	
	if($("input:checkbox[id='check']").is(":checked") != true){
		Swal.fire({
	    icon: 'error',
		title: '광고 심의 가이드 라인 동의에 체크 해주세요.'
	})
		return false;
	}
 		
	var getHtml = editor2.getHTML();
	contentObj = createFormObject("pro_story", getHtml);		
	
	var pro_story=$(contentObj).val();
	$.ajax({
		async : true,
	    type:'post',
	    url:"/project/story",
	    data: {
	    	pro_story:pro_story,
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	$.ajax({
				url:"/project/policy",
				type:"get",
				datatype:"html",
				success:function(data){
					$("#project").html(data);
				}	
			});
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}

</script>
	<!--====== PROJECT CONTENT PART START ====== -->
<form action="/project/story" method="post" name="fr">
	<div style="display: flex; justify-content: center;">
		<div class="col-lg-8">
			<div class="tab-content" id="pills-tabContent">
				<div class="blog-details__main">
					<div class="meta">
						<div class="blog-details__tags">
							<span>프로젝트 스토리</span>
						</div>
						<small>개성이 넘치는 글 & 사진과 함께 프로젝트 스토리를 작성해주세요.</small>
					</div>
				</div>
				<div id="editor2">${proVO.pro_story }</div>
				<script>
				var editor2 = new toastui.Editor({
				    el: document.querySelector('#editor2'),
				    previewStyle: 'vertical',
				    height: '300px',
				    initialValue: "",
				    initialEditType : "wysiwyg",
				    hooks : { // 사진 인식 hook은 필요할 때 자기 알아서 나옴,,,,
				    		addImageBlobHook : function imageConverter(blob, callback){		
				    			
				    		var formData = new FormData();
				        	formData.append('image', blob);		        	
				        	let url = '/images/';								        
				       								        	
				        	$.ajax({
								type: 'POST',
				           		enctype: 'multipart/form-data',
				           		url: '/project/uploadImage',
				           		data: formData,
				           		dataType: 'json',
				           		processData: false,
				           		contentType: false,
				           		cache: false,
				           		timeout: 600000,
				           		success: function(data) {
				           			debugger;
				           			
				           			url += data.filename;		           			
				           			callback(url, 'noImage');
				           		},
				           		error: function(e) {
				           			
				           			
				           			console.log(e);
				           			callback('image_load_fail', 'noImage');
				           		}
				           	});
				        	
				    	}
				    }
				});								
				</script>
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>광고 심의 동의</span>
						</div>
						<small>스토리를 작성하기 전 렛어스에서 제공하는 광고 심의 가이드를 반드시 확인해주세요</small>
					</div>
				</div>
				<div class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btn">가이드 라인 확인</div>
				<br> <br> <input type="checkbox" value="agree" id="check">
				동의하기

				<!-- 모달 영역 시작 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
					<div class="modal-dialog modal-lg modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">광고 심의 가이드라인</h4>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<p style="color: black; font-size: 20px;">&#128172;공통 표시·광고 가이드 라인</p>
								<br>
								<p>- 다른 제품을 비방하는 표시 또는 광고 또는 직·간접적으로
									비교하여 다른 업체의 제품보다 우수한 것으로 오인할 수 있는 표시 · 광고 <br> - 객관적 근거 없이
									본인 또는 리워드를 다른 영업자나 식품 등과 부당하게 비교하는 표시 또는 광고 <br> - 사행심을
									조장하거나 음란한 표현을 사용하여 공중도덕이나 사회윤리를 현저하게 침해하는 표시 또는 광고 <br></p>
								<br>
								<p style="color: black; font-size: 20px;">&#128172;식품 표시·광고 가이드 라인</p>
								<br>
								<p>
									### 식품 표시 · 광고 준수사항을 위반하는 광고 <br> - 질병의 예방 · 치료에 효능이 있는
									것으로 인식할 우려가 있는 표시 또는 광고 <br> - 식품 등을 의약품으로 인식할 우려가 있는 표시
									또는 광고 <br> - 건강기능식품이 아닌 것을 이로 인식할 우려가 있는 표시 또는 광고 <br>
									- 거짓 · 과장된 표시 또는 광고 <br> - 소비자를 기만하는 표시 또는 광고 <br> -
									식품 등을 가공할 때 사용한 원재료나 성분의 효능 ∙ 효과를 해당 식품 등의 효능 ∙ 효과로 오인 또는 혼동하게
									할 우려가 있는 표시 ∙ 광고 <br> - 다른 제품을 비방하는 표시 또는 광고 또는 직·간접적으로
									비교하여 다른 업체의 제품보다 우수한 것으로 오인할 수 있는 표시 · 광고 <br> - 객관적 근거 없이
									본인 또는 리워드를 다른 영업자나 식품 등과 부당하게 비교하는 표시 또는 광고 <br> - 사행심을
									조장하거나 음란한 표현을 사용하여 공중도덕이나 사회윤리를 현저하게 침해하는 표시 또는 광고 <br>
								</p>
								<br>
								<p style="color: black; font-size: 20px;">&#128172;화장품 표시·광고 가이드 라인</p>
								<br>
								<p>
									- 의약품으로 잘못 인식할 우려가 있는 광고 <br> - 기능성 화장품, 천연 화장품 또는 유기농
									화장품이 아님에도 불구하고 잘못 인식할 우려가 있는 광고 <br> - 의사 및 전문가가 이를
									지정/공인/추천/지도/연구/개발 또는 사용하고 있다는 광고 <br> - 외국제품을 국내제품으로 또는
									국내제품을 외국제품으로 잘못 인식할 우려가 있는 광고 <br> - 비교 대상 및 기준이 명확하지 않거나
									객관적으로 확인할 수 없는 내용으로 경쟁상품과 비교하는 표시 또는 광고 또는 배타성을 띤 절대적 표현 <br>
									- 사실과 다르거나 일부를 전체로 서포터가 잘못 인식할 우려가 있는, 소비자를 속이거나 그 우려가 있는 표시·광고
									<br> - 품질 · 효능 등을 객관적으로 확인할 수 없음에도 불구하고 이를 광고하거나 화장품의 범위*를
									벗어나는 표시 · 광고 <br> *인체를 청결ㆍ미화하여 매력을 더하고 용모를 밝게 변화시키거나
									피부ㆍ모발의 건강을 유지 또는 증진하기 위하여 인체에 바르고 문지르거나 뿌리는 등 이와 유사한 방법으로 사용되는
									물품으로 서 인체에 대한 작용이 경미한 것 <br> - 사실 유무에 관계없이 다른 제품을 비방하는 표시
									· 광고 <br>
								</p>
								<br>
								<p style="color: black; font-size: 20px;">&#128172;건강보조기구 표시·광고 가이드 라인</p>
								<br>
								<p>*인체를 청결ㆍ미화하여 매력을 더하고 용모를 밝게 변화시키거나
									피부ㆍ모발의 건강을 유지 또는 증진하기 위하여 인체에 바르고 문지르거나 뿌리는 등 이와 유사한 방법으로 사용되는
									물품으로 서 인체에 대한 작용이 경미한 것 <br> - 사실 유무에 관계없이 다른 제품을 비방하는 표시
									· 광고 <br>/p>
								<br>
							</div>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">닫기</button>
						</div>
					</div>
				</div>
				<!-- 모달영역 끝 -->

				<input type="hidden" name="result" value="" id="result">
				<button type="button" class="main-btn" style="float: right;" onclick="createReward();">다음</button>
			</div>
		</div>
	</div>
</form>


<!--  ====== PROJECT CONTENT PART ENDS ====== -->

