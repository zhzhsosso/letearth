<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" type="text/css" href="fontawesome-free-5.15.1-web/css/fontawesome.min.css">
<script src="https://kit.fontawesome.com/90a612e2ef.js" crossorigin="anonymous"></script>

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

function createFormObject(tagName, content){
	var object;
	
	object = document.createElement('input');
	object.setAttribute('type', 'hidden');
	object.setAttribute('name', tagName);
	object.setAttribute('value', content);
    
    return object
}

function createReward(seq){
	Swal.fire({
	  title: '저장하시겠습니까?',
	  icon: 'info',
	  showCancelButton: true,
	  confirmButtonColor: '#3085d6',
	  cancelButtonColor: 'grey',
	  confirmButtonText: '저장',
	  cancelButtonText: '취소'
	}).then((result) => {
	  if (result.value) {
        //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
		if(document.getElementById("result").value == ""){
			Swal.fire({
		    	icon: 'error',
			text: '광고 심의 가이드 라인을 확인해주세요'
		})
		return;
		}
		
		if($("input:checkbox[id='check']").is(":checked") != true){
			Swal.fire({
		    	icon: 'error',
			text: '광고 심의 가이드 라인 동의에 체크 해주세요.'
		})
			return;
		}
	 		
	 		
	 		var getHtml = editor.getHTML();
			contentObj = createFormObject("pro_story", getHtml);		
			fr.appendChild(contentObj);		
			
	        fr.submit();
	  }
	})
}

</script>

    <!--====== PAGE TITLE PART START ======-->
    
    <section class="page-title-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div>
                        <h3 class="title" style="color: black; font-size: 3em">4. 스토리 작성</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!--====== PAGE TITLE PART ENDS ======-->
    
	<!--====== PROJECT CONTENT PART START ====== -->
    <section class="project-details-content-area pb-110">
        <div class="container">
            <div class="row justify-content-center">
            
        		<!-- 사이드 바 -->
				<%@ include file="../include/proSidebar.jsp" %>
				<!-- 사이드 바 -->
            	
                <div class="col-lg-8">
                <form action="/project/story" method="post" name="fr">
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                            <div class="project-details-content-top">
	                           	 <div class="col-lg-4 col-md-7 col-sm-9">
	                           	 </div>
                            </div>
                            <div class="project-details-item">
								
								<p style="font-size: 2.5em;">프로젝트 스토리</p>
								<h5 class="title">개성이 넘치는 글 & 사진과 함께 프로젝트 스토리를 작성해주세요.</h5>
								<br>
								
								<div id="editor"></div>	
								<script>
								const editor = new toastui.Editor({
								    el: document.querySelector('#editor'),
								    previewStyle: 'vertical',
								    height: '300px',
								    initialValue: "",
								    initialEditType : "wysiwyg",
								    hooks : { // 사진 인식 hook은 필요할 때 자기 알아서 나옴,,,,
								    		addImageBlobHook : function imageConverter(blob, callback){		
								    			
								    		const formData = new FormData();
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
								
								</div> <br><br>
             					
	                            <p style="font-size: 2.5em;">스토리 광고 심의 동의</p><br>
                                <h5 class="title">스토리를 작성하기 전 렛어스에서 제공하는 광고 심의 가이드를 반드시 확인해주세요</h5> <br>
                                <button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="btn">
									광고 심의 가이드라인 확인
								</button> <br>
								
								
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
											<p style="color: black; font-size: 20px;">&#128172;공통 표시·광고 가이드 라인</p> <br>
											<p>	가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 
												가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 
												가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 </p>
											<br>
											<p style="color: black; font-size: 20px;">&#128172;식품 표시·광고 가이드 라인</p> <br>
											<p>
											### 식품 표시 · 광고 준수사항을 위반하는 광고 <br>
											- 질병의 예방 · 치료에 효능이 있는 것으로 인식할 우려가 있는 표시 또는 광고 <br>
											- 식품 등을 의약품으로 인식할 우려가 있는 표시 또는 광고 <br>
											- 건강기능식품이 아닌 것을 이로 인식할 우려가 있는 표시 또는 광고 <br>
											- 거짓 · 과장된 표시 또는 광고 <br>
											- 소비자를 기만하는 표시 또는 광고 <br>
											- 식품 등을 가공할 때 사용한 원재료나 성분의 효능 ∙ 효과를 해당 식품 등의 효능 ∙ 효과로 오인 또는 혼동하게 할 우려가 있는 표시 ∙ 광고 <br>
											- 다른 제품을 비방하는 표시 또는 광고 또는 직·간접적으로 비교하여 다른 업체의 제품보다 우수한 것으로 오인할 수 있는 표시 · 광고 <br>
											- 객관적 근거 없이 본인 또는 리워드를 다른 영업자나 식품 등과 부당하게 비교하는 표시 또는 광고 <br>
											- 사행심을 조장하거나 음란한 표현을 사용하여 공중도덕이나 사회윤리를 현저하게 침해하는 표시 또는 광고 <br>
											</p>
											<br>
											<p style="color: black; font-size: 20px;">&#128172;화장품 표시·광고 가이드 라인</p> <br>
											<p>
											- 의약품으로 잘못 인식할 우려가 있는 광고 <br>
											- 기능성 화장품, 천연 화장품 또는 유기농 화장품이 아님에도 불구하고 잘못 인식할 우려가 있는 광고 <br>
											- 의사 및 전문가가 이를 지정/공인/추천/지도/연구/개발 또는 사용하고 있다는 광고 <br>
											- 외국제품을 국내제품으로 또는 국내제품을 외국제품으로 잘못 인식할 우려가 있는 광고 <br>
											- 비교 대상 및 기준이 명확하지 않거나 객관적으로 확인할 수 없는 내용으로 경쟁상품과 비교하는 표시 또는 광고 또는 배타성을 띤 절대적 표현 <br>
											- 사실과 다르거나 일부를 전체로 서포터가 잘못 인식할 우려가 있는, 소비자를 속이거나 그 우려가 있는 표시·광고 <br>
											- 품질 · 효능 등을 객관적으로 확인할 수 없음에도 불구하고 이를 광고하거나 화장품의 범위*를 벗어나는 표시 · 광고 <br>
											*인체를 청결ㆍ미화하여 매력을 더하고 용모를 밝게 변화시키거나 피부ㆍ모발의 건강을 유지 또는 증진하기 위하여 인체에 바르고 문지르거나 뿌리는 등 이와 유사한 방법으로 사용되는 물품으로  서 인체에 대한 작용이 경미한 것 <br>
											- 사실 유무에 관계없이 다른 제품을 비방하는 표시 · 광고 <br>
											</p>
											<br>
											<p style="color: black; font-size: 20px;">&#128172;건강보조기구  표시·광고 가이드 라인</p> <br>
											<p>가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 
											가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 
											가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 가이드라인 </p>
											<br>
											</div>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											닫기
											</button>
										</div>
									</div>
								</div>
								<!-- 모달영역 끝 -->
								
								<div style="margin: 10px; font-size: 17px; color: #838694;"> <input type="checkbox" value="agree" id="check"> 동의하기 </div>
								
                            </div>
                    	</div>
					<input type="hidden" name="result" value="" id="result">
					<button type="button" class="main-btn" style="float: right;" onclick="return createReward();">다음</button>
                	</div>
					</form>
            	</div>
			</div>
    </section>
    
    
<!--  ====== PROJECT CONTENT PART ENDS ====== -->

<%@ include file="../include/footer.jsp"%>
