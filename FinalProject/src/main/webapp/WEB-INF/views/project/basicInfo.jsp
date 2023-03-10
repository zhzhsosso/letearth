<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- ํด์ํ๊ทธ -->
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
    	$("#cat_name").append("<option>์ฟ?ํน</option>");
    	$("#cat_name").append("<option>๊ฐ์</option>");
    	
    }
    if(cat_no == 2){
    	$("#cat_name option").remove();
    	$("#cat_name").append("<option>๋น๊ฑด</option>");
    	$("#cat_name").append("<option>์นํ๊ฒฝ</option>");
    }
});   // selectBox_test ๋


// ํ๊ทธ ๊ด๋?จ
var input1 = document.querySelector('input[name=pro_tags]'),

// ํ๊ทธ ์๋?ฅ ์?์ด
tagify1 = new Tagify(input1, {
	whitelist : [ "ํ๋ฉ", "๋?์ด์ค", "๋น๊ฑด", "ํด๋์ค", "์ง๊ตฌํ์", "์นํ๊ฒฝ", "ํด๋์ค", "๊ฐ์", "DIY" ],
	blacklist : [ "๊ฐ์ข์" ]
});
	
</script>
<script type="text/javascript">
$(document).ready(function(){
	// ๊ธ์์ ์?์ด
	$('#pro_title').one('click',function(){
		$('#content').append('<div id="title_cnt">ใ0 / 40</div>');
	});

    $('#pro_title').on('keyup', function() {
        $('#title_cnt').html("ใ"+$(this).val().length+" / 40");
 
        if($(this).val().length > 40) {
            $(this).val($(this).val().substring(0, 40));
            $('#title_cnt').html("ใ40 / 40");
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
				title : '์นดํ๊ณ?๋ฆฌ๋ฅผ ์?ํํ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		if($('#pro_title').val() == "") {
			Swal.fire({
				title : 'ํ๋ก์?ํธ ์?๋ชฉ์ ์๋?ฅํ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		if($('#pro_title').val() == '์์์?์ฅ๊ธ') {
			Swal.fire({
				title : 'ํ๋ก์?ํธ ์?๋ชฉ์ ๋ณ๊ฒฝํด์ฃผ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		if($(contentObj).val() == null) {
			Swal.fire({
				title : 'ํ๋ก์?ํธ ๋ด์ฉ์ ์๋?ฅํ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		if($('#input-file').val() == "") {
			Swal.fire({
				title : '์ฌ์ง์ ์๋ก๋ ํด์ฃผ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		if($('#tags').val() == "") {
			Swal.fire({
				title : 'ํ๊ทธ๋ฅผ ์๋?ฅ ํด์ฃผ์ธ์!',
				icon : 'error',
				confirmButtonText : 'ํ์ธ',
				confirmButtonColor: '#A4AC85'
			})
			return false;
		}
		var pro_context = $(contentObj).val();
		
		const sendingData = new FormData();
		sendingData.append('pro_context',pro_context);  
		sendingData.append('cat_no',$('#cat_no').val());  
		sendingData.append('pro_title',$('#pro_title').val());  
		sendingData.append('tags',$('#tags').val()); 
		sendingData.append('file',$('#input-file')[0].files[0]);
		
		console.log(sendingData);
		$.ajax({
			    type:'post',
			    url:"/project/basicInfo",
			    data: sendingData,
			    processData: false,
			    contentType: false,
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
	<form method="post" name="fr" id="fr">
		<div style="display: flex; justify-content: center;">
			<div class="col-lg-8">
				<!-- ํ๋ก์?ํธ ์นดํ๊ณ?๋ฆฌ -->
				<div class="blog-details__main">
					<div class="meta">
						<div class="blog-details__tags">
							<span>์นดํ๊ณ?๋ฆฌ</span>
						</div>
						<small> ํ๋ก์?ํธ ์ฑ๊ฒฉ๊ณผ ๊ฐ์ฅ ์ผ์นํ๋ ์นดํ๊ณ?๋ฆฌ๋ฅผ ์?ํํด์ฃผ์ธ์. ์?ํฉํ์ง ์์ ๊ฒฝ์ฐ ์ด์์์ ์ํด ์กฐ์?๋? ์ ์์ต๋๋ค. </small>
					</div>
				</div>
				<div class="blog-author__content">
					<span>๋ถ๋ฅ</span> 
					<input type="hidden" id="name" value=${proVO.cat_name }>
					<select id="cat_no" name="cat_no" class="textBox">
						<option value="0" selected disabled hidden>์นดํ๊ณ?๋ฆฌ</option>
						<option value="1" <c:if test="${proVO.cat_no eq '1'}">selected</c:if>>ํด๋์ค</option>
						<option value="2" <c:if test="${proVO.cat_no eq '2'}">selected</c:if>>์ํ</option>
					</select>
					<br>
					<span>์นดํ๊ณ?๋ฆฌ๋ช</span> 
					<select id="cat_name" name="cat_name" class="textBox" id="cat_name">
						<option value="" selected disabled hidden>์ธ๋ถ์นดํ๊ณ?๋ฆฌ</option>
					</select>
				</div>

				<!-- ํ๋ก์?ํธ ์นดํ๊ณ?๋ฆฌ -->


				<!-- ํ๋ก์?ํธ ์?๋ชฉ -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>์?๋ชฉ</span>
						</div>
						<small> ํ๋ก์?ํธ์ ์ฃผ์?, ์ฐฝ์๋ฌผ์ ํน์ง์ด ๋๋ฌ๋๋ ๋ฉ์ง ์?๋ชฉ์ ๋ถ์ฌ์ฃผ์ธ์. </small>
					</div>
				</div>
				<div class="content" id="content">
				<input type="text" name="pro_title" value="${proVO.pro_title }" id="pro_title" placeholder="์?๋ชฉ์ ์๋?ฅํด์ฃผ์ธ์" class="longTextBox">
				</div>
				<!-- ํ๋ก์?ํธ ์?๋ชฉ -->


				<!-- ํ๋ก์?ํธ ๋ด์ฉ -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>๋ด์ฉ</span>
						</div>
						<small> ํ์์ ๋ถ๋ค์ด ํ๋ก์?ํธ๋ฅผ ๋น?๋ฅด๊ฒ ์ดํดํ? ์ ์๋๋ก ๋ชํํ๊ณ? ๊ฐ๋ตํ๊ฒ ์๊ฐํด์ฃผ์ธ์. </small>
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
					    hooks : { // ์ฌ์ง ์ธ์ hook์ ํ์ํ? ๋ ์๊ธฐ ์์์ ๋์ด,,,,
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

				<!-- ํ๋ก์?ํธ ๋ํ ์ด๋ฏธ์ง : ์ฒจ๋ถํ์ผ ์๋ก๋๋ ์์ง ๋ณด๋ฅ...-->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>๋ํ ์ฌ์ง</span>
						</div>
						<small> ํ์์๋ค์ด ํ๋ก์?ํธ์ ๋ด์ฉ์ ์ฝ๊ฒ ํ์ํ๊ณ? ์ข์ ์ธ์์ ๋ฐ์ ์ ์๋๋ก ์ด๋ฏธ์ง ๊ฐ์ด๋๋ผ์ธ์ ๋ฐ๋ผ์ฃผ์ธ์. </small>
					</div>
				</div>

        		<label class="btn btn-primary" for="input-file" id="scan" style="background-color: #414934; position: inherit; border: none; font-family: S-CoreDream-3Light;">
				์ฌ์ง ์๋ก๋ </label>
				<div style="display: none">
					<input type="file" id="input-file" name="pro_thum" /> <br><br>
				</div>
				

				<!-- ํ๋ก์?ํธ ๋ํ ์ด๋ฏธ์ง-->

				<!-- ๊ฒ์ํ๊ทธ -->
				<div class="blog-details__main">
					<div class="blog-details__meta">
						<div class="blog-details__tags">
							<span>ํ๊ทธ</span>
						</div>
						<small> ์?์ฌ ํ์์์ ๊ด์ฌ์ฌ๋ฅผ ๊ณ?๋?คํ ๊ฒ์ ํ๊ทธ๋ฅผ ์๋?ฅํด์ฃผ์ธ์. </small>
					</div>
				</div>
					<input type="text" name='pro_tags' placeholder="ํ๊ทธ๋ฅผ ์๋?ฅํด์ฃผ์ธ์" value="${proVO.tags }" class="tagBox" id="pro_tags">
					<input type="hidden" name="tags" id="tags">
					<!-- ๊ฒ์ํ๊ทธ -->
				<br> <br>
				<!-- ๋ฒํผ --> 
				<div class="blog-btn" align="center">
					<input type="button" class="main-btn" value="๋ค์" onclick="checkInfo();" style="background-color: #A4AC85; border: none;">
				</div>
				<!-- ๋ฒํผ -->
			</div>
		</div>
	</form>
