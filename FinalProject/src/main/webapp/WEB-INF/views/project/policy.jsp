<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script type="text/javascript">
// 글자수 제어 1
$(document).ready(function() {
	$('#pro_policy').on('click',function(){
 		$('#policy_div').append('<div id="policy_cnt">ㅤ(0 / 800)</div>');
	});
	
    $('#pro_policy').on('keyup', function() {
        $('#policy_cnt').html("("+$(this).val().length+" / 800)");
 
        if($(this).val().length > 800) {
            $(this).val($(this).val().substring(0, 800));
            $('#policy_cnt').html("(800 / 800)");
        }
    });
});
</script>
<script type="text/javascript">
function createFormObject(tagName, content){
	var object;
	
	object = document.createElement('input');
	object.setAttribute('type', 'hidden');
	object.setAttribute('name', tagName);
	object.setAttribute('value', content);
    
    return object
}

function updatePolicy(seq){
// 	if($('#editor3').val() == "") {
// 		Swal.fire({
// 			title : '프로젝트 정책을 입력해주세요!',
// 			icon : 'error',
// 			confirmButtonText : '확인'
// 		})
// 		document.fr.pro_policy.focus();
// 		return false;
// 	}
	
	var getHtml = editor3.getHTML();
	contentObj = createFormObject("pro_policy", getHtml);		
// 	fr.appendChild(contentObj);		
	
	var pro_policy=$(contentObj).val();
	
	$.ajax({
		async : true,
	    type:'post',
	    url:"/project/policy",
	    data: {
	    	pro_policy:pro_policy,
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	$.ajax({
				url:"/project/regist",
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
<form action="/project/policy" method="post" name="fr">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="blog-details__main">
				<div class="meta">
					<div class="blog-details__tags">
						<span>프로젝트 정책</span>
					</div>
					<i class="flaticon-checkmark"></i> 
					<small> 펀딩 종료 후 후원자의 불만
						또는 분쟁 발생 시 중요한 기준이 될 수 있습니다.<br> 신중하게 작성해주세요
						</h5> (예시) 아래와 같은 사항을 고려해서 작성해주세요. 진행하는 프로젝트에 해당되지 않는 항목은 삭제해주세요. <br>
						· 펀딩 마감 이후에는 후원금액이 창작자에게 전달되기에 텀블벅을 통해 환불이 불가합니다. 환불은 창작자가 환불계좌를
						받아 반환하는 방식으로만 가능하며, 어떤 경우에 환불이 가능한지를 기재해주세요. <br> · 펀딩 성사 후
						지연 또는 선물 전달에 문제가 발생했을 때에 어떤 식으로 대응하시겠어요? 이 프로젝트 특성상 발생할 수 있는 문제에
						대한 추가적인 정책이나 약속이 있다면 기재해주세요. (후원금 환불, 대체 보상 등) <br> · 배송이 필요한
						선물에 문제가 발생한 경우 교환, A/S는 어떻게 진행되나요? <br> · 디지털 콘텐츠 리워드는 타인에게
						양도가 가능한가요? <br> · 오프라인으로 전달되는 선물(공연, 전시 등)은 타인에게 양도가 가능한가요?
					</small>
				</div>
			</div>
			<div id="editor3">${proVO.pro_policy }</div>
			<script>
			var editor3 = new toastui.Editor({
			    el: document.querySelector('#editor3'),
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
			<br>
			<button type="button" class="main-btn" style="float: right;" onclick="updatePolicy();">다음</button>
		</div>
	</div>

</form>

<!--     ====== PROJECT CONTENT PART ENDS ====== -->
