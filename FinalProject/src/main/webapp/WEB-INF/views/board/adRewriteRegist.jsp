<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
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

function regRew(seq){
	
	Swal.fire({
	  html: '<h3>답글을 등록하시겠습니까?</h3>',
	  icon: 'success',
	  showCancelButton: true,
	  confirmButtonColor: '#A4AC85',
	  cancelButtonColor: '#6F7B63',
	  confirmButtonText: '등록하기',
	  cancelButtonText: '취소하기'
	}).then((result) => {
	  if (result.value) {
        //"등록" 버튼을 눌렀을 때 작업할 내용을 이곳에 넣어주면 된다. 
			
	 		var getHtml = editor.getHTML();
			contentObj = createFormObject("not_reply", getHtml);		
			fr.appendChild(contentObj);		
			     
			
	        fr.submit();
	  }
	})
}

</script>

<style>
/* 에디터 꾸미기 */
.toastui-editor-defaultUI-toolbar {
    background-color: #EDEAE0;
    border-bottom: 1px solid #ebedf2;
    border-radius: 3px 3px 0 0;
    display: -ms-flexbox;
    display: flex;
    height: 45px;
    padding: 0 25px;
}

.toastui-editor-defaultUI-toolbar button {
    border: 1px solid #EDEAE0;
    border-radius: 3px;
    box-sizing: border-box;
    cursor: pointer;
    height: 32px;
    margin: 7px 5px;
    padding: 0;
    width: 32px;
}

/*버튼체인지색상*/
.main-btn::before {
    position: absolute;
    content: '';
    right: 0;
    top: 0;
    height: 17px;
    width: 17px;
    background: #6F7B63;
	border-radius:0.25rem;
    z-index: -1;
}

.main-btn{
    border-radius: 0.25rem;
    background-color: #A4AC85;
    color: #F2F0E8;
    font-size: 18px;
    font-weight: bolder;
	text-align:center; 
    vertical-align:middle;
    line-height:0px;
    padding:12px;
    align-content:center;
    width: 140px;
    height: 60px;
    
    margin: 10px;

}
</style>

<style>
.form-control1 {
/*     display: block; */
/*     width: 100%; */
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #414934;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

.not_title {
	background-color: #EDEAE0; 
	border-color: transparent  transparent  #BFCC97 transparent transparent; 
	width: 100%; 
	padding: 8px 16px; 
	
	border: 1px solid transparent;
   cursor: pointer;
    font-weight: bolder;
	
}

.fcntr {
	display: block;
}

.fcntrAll {
	position: relative;
	left: 7 %;
}

/*셀렉트 꾸미기*/
/* The container must be positioned relative: */
.fcntr {
  position: relative;
  font-family: Arial;
}

.fcntr select {
  display: none; /*hide original SELECT element: */
}

.select-selected {
  background-color: #B6AD90;
}

/* Style the arrow inside the select element: */
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/* Point the arrow upwards when the select box is open (active): */
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/* style the items (options), including the selected item: */
.select-items div,.select-selected {/*글자색*/
  color: #F2F0E8;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  font-weight: bolder;
  border-radius : 0.25rem;
}

/* Style items (options): */
.select-items {
  position: absolute;
  background-color: #C9C2AC;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/* Hide the items when the select box is closed: */
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}


/*자바스트립트로 표현한 오늘날짜<span>*/
.date1{
  color: #B6AD90;
  padding: 8px 16px;
  border-color: #EDEAE0;
  cursor: pointer;
  font-weight: bolder;
  border-radius : 0.25rem;
  background-color: #EDEAE0; 
 	width: 200px;
}
</style>
 
 <!-- 본문 -->  
   <section class="contact-form-area">
        <div class="container">
            
        <br><br>
		<h2 class="box-title" align="center">
			<b style="color: #414934;"> 1:1문의 답글 등록 </b>
		</h2>
		<hr style="border-color: #A4AC85;"><br><br>
        
           <form role="form" name="fr" id="contact-form" method="post">
                <input type="hidden" name="not_no" value="${param.not_no }">
                
          <div class="fcntrAll" style="padding-right: 15px; padding-left: 15px;">	
          		<div style="display: flex; justify-content:space-between ;">
                  <div class="fcntr" style="width:200px;">
                    <select name="not_middle" id="not_middle" style="width: 50%;">
                       <option value="4" selected readonly>관리자</option>									  
					</select>
                  </div>
                  <!-- 작성일 -->
		                  <div class="fcntr" style="width:200px;">
<!-- 		                  	<span style="vertical-align : middle; width:95px; text-align: right; font-size: 18px; font-weight: bolder;">작성일 : </span> -->
		                    <span class="date1" style="text-align: center;"> 작성일 : 
		                    	<span id="date"></span>
		                    </span>
		                  </div>
                </div>
                  <br> 
                  <div>
                      <input type="text" name="not_title" class="form-control1" placeholder="제목을 입력하세요" value="[관리자 답변] " id="not_title"
							style="background-color: #EDEAE0; border-color: #C9C2AC; width: 100%; padding: 8px 16px; font-weight: bolder;
							line-height: 1.5; height: 40px; color: #414934;">
                  </div>
           </div>          
		        <div class="col-lg-12">
					<div class="input-box mt-20">
						<div id="editor" align="center"></div>
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
					</div> 
                       <div class="input-box mt-20 text-center">
                           <button class="main-btn" type="button" id="listRewrite">목록</button>
                           <button class="main-btn" type="button" id="registRereply" onclick="return regRew();">등록</button>
                       </div>
                   </div>
                </form>
        </div>
    </section>
   
<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']"); 
		 
		$("#listRewrite").click(function(){ // get방식
			
				Swal.fire({
					title : '목록으로 돌아가시겠습니까?',
					html : '<h4>현재 작성하신 내용을 복구할 수 없습니다.</h4>',
					icon : 'warning',
					showCancelButton: true,
				    confirmButtonColor: '#A4AC85',
				    cancelButtonColor: '#6F7B63',
				    confirmButtonText: '목록이동',
				    cancelButtonText: '머무르기'
				}).then((result) => {
				if (result.value) {
				
			location.href="/board/adRewriteList";
		}
	});
		
// 		$("#registRewrite").click(function(){
// 			formObj.attr("action", "/board/adRewriteList");
// 			formObj.submit(); // form태그를 submit방식으로 보내자. => post
// 		});
		
	});
	});
</script>
<script>
$(document).ready(function(){
	
	var today = new Date();   
	
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	
	
	
	var registdate = year + '-' + month + '-' + date;
	$("#date").text(registdate);
	
});
</script>

<script type="text/javascript">
// 셀렉트 꾸미기
var x, i, j, l, ll, selElmnt, a, b, c;
/* Look for any elements with the class "custom-select": */
x = document.getElementsByClassName("fcntr");
l = x.length;
for (i = 0; i < l; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  ll = selElmnt.length;
  /* For each element, create a new DIV that will act as the selected item: */
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /* For each element, create a new DIV that will contain the option list: */
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < ll; j++) {
    /* For each option in the original select element,
    create a new DIV that will act as an option item: */
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /* When an item is clicked, update the original select box,
        and the selected item: */
        var y, i, k, s, h, sl, yl;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        sl = s.length;
        h = this.parentNode.previousSibling;
        for (i = 0; i < sl; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            yl = y.length;
            for (k = 0; k < yl; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
    /* When the select box is clicked, close any other select boxes,
    and open/close the current select box: */
    e.stopPropagation();
    closeAllSelect(this);
    this.nextSibling.classList.toggle("select-hide");
    this.classList.toggle("select-arrow-active");
  });
}

function closeAllSelect(elmnt) {
  /* A function that will close all select boxes in the document,
  except the current select box: */
  var x, y, i, xl, yl, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  xl = x.length;
  yl = y.length;
  for (i = 0; i < yl; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < xl; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}

/* If the user clicks anywhere outside the select box,
then close all select boxes: */
document.addEventListener("click", closeAllSelect);
</script>   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
