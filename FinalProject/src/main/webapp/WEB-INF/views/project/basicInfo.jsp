<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 해시태그 -->
<link rel="stylesheet" type="text/css" href="/tag_create.css">
<script type="module" src="/tag_create.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<style>
pro_tags{ 
    min-width:400px;
    max-width:600px; 
    margin: 1.5em 0;
}
label{ position:absolute; top:10px; right:10px; cursor:pointer; font:600 .8em Arial; white-space:nowrap; }

.disabled{ 
  pro_tags{ display:none; 
    & + input, & + textarea{ 
      display:inline-block !important; 
      width:350px; 
      padding:.5em; 
      border:1px inset; 
    }
  }
}

</style>
<script type="text/javascript">
$("#cat_no").change(function(){
    var cat_no=$(this).val();
    if(cat_no == 1){
    	$("#cat_name option").remove();
    	$("#cat_name").append("<option>쿠킹</option>");
    	$("#cat_name").append("<option>강의</option>");
    	
    }
    if(cat_no == 2){
    	$("#cat_name option").remove();
    	$("#cat_name").append("<option>비건</option>");
    	$("#cat_name").append("<option>친환경</option>");
    }
});   // selectBox_test 끝


// 태그 관련
var input1 = document.querySelector('input[name=pro_tags]'),

// 태그 입력 제어
tagify1 = new Tagify(input1, {
	whitelist : [ "펀딩", "렛어스", "비건", "클래스", "지구하자", "친환경", "클래스", "강의", "DIY" ],
	blacklist : [ "시발", "개좋음" ]
});
	
</script>
<script type="text/javascript">
$(document).ready(function(){
	// 글자수 제어
	$('#pro_title').one('click',function(){
		$('#content').append('<div id="title_cnt">　0 / 40</div>');
	});

    $('#pro_title').on('keyup', function() {
        $('#title_cnt').html("　"+$(this).val().length+" / 40");
 
        if($(this).val().length > 40) {
            $(this).val($(this).val().substring(0, 40));
            $('#title_cnt').html("　40 / 40");
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

function checkInfo() {
	var tags = $('#pro_tags').val();
		
		var chk_array = JSON.stringify(tags);
		chk_array = chk_array.replace(/"/g,"");
		chk_array = chk_array.replace(/:/g,"");
		chk_array = chk_array.replace(/\[|\]/g,"");
		chk_array = chk_array.replace(/\{|\}/g,"");
		chk_array = chk_array.replace(/value/gi,"");
		chk_array = chk_array.replaceAll("\\\\","");
		chk_array = chk_array.replaceAll("\\","");
		
		$('#tags').attr('value',chk_array);
		
		var getHtml = editor.getHTML();
		contentObj = createFormObject("pro_context", getHtml);		
		fr.appendChild(contentObj);
			
		if($('#cat_no').val() < 1) {
			Swal.fire({
				title : '카테고리를 선택하세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		if($('#pro_title').val() == "") {
			Swal.fire({
				title : '프로젝트 제목을 입력하세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		if($('#pro_title').val() == '임시저장글') {
			Swal.fire({
				title : '프로젝트 제목을 변경해주세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		if($(contentObj).val() == null) {
			Swal.fire({
				title : '프로젝트 내용을 입력하세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		if($('#input-file').val() == "") {
			Swal.fire({
				title : '사진을 업로드 해주세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		if($('#tags').val() == "") {
			Swal.fire({
				title : '태그를 입력 해주세요!',
				icon : 'error',
				confirmButtonText : '확인'
			})
			return false;
		}
		
		var pro_context = $(contentObj).val();
		
		$.ajax({
			async : true,
		    type:'post',
		    url:"/project/basicInfo",
		    data: {
		    	cat_no:$("#cat_no").val(),
		    	cat_name:$("#cat_name").val(),
		    	pro_title:$('#pro_title').val(),
		    	pro_context:pro_context,
		    	pro_thum:$('#input-file').val(),
		    	tags:$('#tags').val(),
			},
		    dataType : "text",
		    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		    success : function(resp) {
		    	$.ajax({
					url:"/project/plan",
					type:"get",
					datatype:"html",
					success:function(data){
						$('html, body').scrollTop(0);
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
	<!--====== BLOG DETAILS PART ENDS ======-->
	<form method="post" name="fr">
		<div style="display: flex; justify-content: center;">
			<div class="col-lg-8">
				<!-- 프로젝트 카테고리 -->
				<div class="blog-details__main">
					<div class="meta">
						<div class="blog-details__tags">
							<span>카테고리</span>
						</div>
						<small> 프로젝트 성격과 가장 일치하는 카테고리를 선택해주세요. 적합하지 않을 경우 운영자에 의해 조정될 수 있습니다. </small>
					</div>
				</div>
				<div class="blog-author__content">
					<span>분류</span> 
					<input type="hidden" id="name" value=${proVO.cat_name }>
					<select id="cat_no" name="cat_no" class="textBox">
						<option value="0" selected disabled hidden>카테고리</option>
						<option value="1" <c:if test="${proVO.cat_no eq '1'}">selected</c:if>>클래스</option>
						<option value="2" <c:if test="${proVO.cat_no eq '2'}">selected</c:if>>상품</option>
					</select>
					<br>
					<span>카테고리명</span> 
					<select id="cat_name" name="cat_name" class="textBox" id="cat_name">
						<option value="" selected disabled hidden>세부카테고리</option>
					</select>
				</div>

				<!-- 프로젝트 카테고리 -->


				<!-- 프로젝트 제목 -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>제목</span>
						</div>
						<small> 프로젝트의 주제, 창작물의 특징이 드러나는 멋진 제목을 붙여주세요. </small>
					</div>
				</div>
				<div class="content" id="content">
				<input type="text" name="pro_title" value="${proVO.pro_title }" id="pro_title" placeholder="제목을 입력해주세요" class="longTextBox">
				</div>
				<!-- 프로젝트 제목 -->


				<!-- 프로젝트 내용 -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>내용</span>
						</div>
						<small> 후원자 분들이 프로젝트를 빠르게 이해할 수 있도록 명확하고 간략하게 소개해주세요. </small>
					</div>
				</div>
				
				<div id="editor">${proVO.pro_context }</div>	
				<script>
					var editor = new toastui.Editor({
					    el: document.querySelector('#editor'),
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

				<!-- 프로젝트 대표 이미지 : 첨부파일 업로드는 아직 보류...-->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>대표 사진</span>
						</div>
						<small> 후원자들이 프로젝트의 내용을 쉽게 파악하고 좋은 인상을 받을 수 있도록 이미지 가이드라인을 따라주세요. </small>
					</div>
				</div>

        		<label class="btn btn-primary" for="input-file" id="scan" style="background-color: #414934; position: inherit; border: none;">
				사진 업로드 </label>
				<div style="display: none">
					<input type="file" id="input-file" name="pro_thum" /> <br><br>
				</div>

				<!-- 프로젝트 대표 이미지-->

				<!-- 검색태그 -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>태그</span>
						</div>
						<small> 잠재 후원자의 관심사를 고려한 검색 태그를 입력해주세요. </small>
					</div>
				</div>
					<input type="text" name='pro_tags' placeholder="태그를 입력해주세요" value="${proVO.tags }" class="tagBox" id="pro_tags">
					<input type="hidden" name="tags" id="tags">
					<!-- 검색태그 -->
				<br> <br>
				<!-- 버튼 --> 
				<div class="blog-btn" align="center">
					<input type="button" class="main-btn" value="다음" onclick="checkInfo();" style="background-color: #A4AC85; border: none;">
				</div>
				<!-- 버튼 -->
			</div>
		</div>
	</form>
