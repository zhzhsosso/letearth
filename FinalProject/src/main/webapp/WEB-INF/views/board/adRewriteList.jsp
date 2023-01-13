<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<%-- <link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" /> --%>
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>1:1문의</title>

<style type="text/css">
#sbtn {
	position: absolute;
	top: 0px;
	right: -23%;
	background-color: #A4AC85;
	height: 35px;
}

#repSelector {
  width : 15%;
  height : 4px;
  background-color : #D7D1B9;
  border : 0;
  
   position: relative;
   top: -10px; 
/*    left: 380px;  */
   left: 42.5%;
}

#repSelector1{
   position: relative;
   top: -15px; 
   
}


 /*페이징*/
.paging {
    display: inline-block;
}

.paging a{
	display: block;
	text-decoration: none;
	color: #414934;
	float: left;
	line-height: 1.5;
	border-radius:50%;
	padding: 8px 16px;
}

.paging a:hover {
	background-color: #B6AD90;
	color: #E8E4D7;
	
}

.paging a.active{
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
}

.pagination a:active{
	cursor: default;
	background-color: #B6AD90;
	color: #E8E4D7;
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
  background-color: #BFCC97;
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
.select-items div,.select-selected {
  color: #6c757d;
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
  background-color: #EEF5E6;
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


/*모달 관리자 */
.form-control1 {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
    
}
</style>
</head>
<body>   
   <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
   
   
   <section class="contact-form-area">
   <div style="display: flex;">
   <%@ include file="../include/adSide1.jsp" %>	
   
        <div class="container">
        
        
    <br>
 	<br>        
 	<br>   
 	<br> 
 	<br>       
   <!-- 어드민 -->		
						<h2 class="box-title" align="center"><b style="color: #6F7B63;"> 관리자 1:1 문의 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12" style="font-size: 16px;"><br><br>
				<div style="font-size: 1.5rem; cursor: pointer;" align="left" id="aaadiv" >
					<br>  
					<hr id="repSelector1">	
				</div>
					
			<!-- 어드민 -->                                                      
				<div class="box" style="border: none;">
					<div class="box-header">
					
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px; height: 50px;">
								<input type="text" name="keyword"
									class="form-control pull-right" placeholder="Search" 
											style="height: 35px; width: 60px; font-size: 1rem; border-color: #A4AC85; color:#B6AD90;">
								<div class="input-group-btn" style="padding-left: 3px;">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div style="padding-top: 30px; padding-bottom: 30px;"></div>
			글의 개수 : ${pvo.totalCount }
<!-- tableAll -->
					<div class="box-body table-responsive no-padding" id="tableAll">
			<form role="form" name="fr" id="contact-form" action="" method="post">
					<input type="hidden" name="not_re_lev" value="${vo.not_re_lev }">
					<input type="hidden" name="not_re_ref" value="${vo.not_re_ref }">
					<input type="hidden" name="not_re_seq" value="${vo.not_re_seq }">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;" id="vc">
									<th style="text-align: center; width: 7%;">#</th>
									<th style="text-align: center;">1:1문의 제목</th>
									<th style="text-align: center;">작성자</th>
									<th style="text-align: center;">작성일</th>
									<th style="text-align: center;">조회수</th>
									<th style="text-align: center;">관리</th>
								</tr>
				<c:forEach var="vo" items="${adRewriteList }" varStatus="i">
								<tr>
									<td style="padding-left: 10px; text-align:center; vertical-align:middle; color: #414934; ">
										${i.count }
										<input type="hidden" name="not_no" value="${vo.not_no }">
									</td>
									<td style="vertical-align:middle;"> <!-- 문의제목 -->
										<!-- 관리자일 경우 들여쓰기 -->
										<c:if test="${vo.not_re_lev > 0 }">
											<img src="/resources/level.gif" width="${vo.not_re_lev*10 }">
											<img src="/resources/re.png" height="10px;" width="25px;">
										</c:if>		
<!-- 										상세보기a링크													 -->
<%-- 										<a href="/board/adRewriteRead?not_no=${vo.not_no }" style="color: gray;"> ${vo.not_title } </a> --%>
	<!-- 모달로 본문보기 -->
										
								<a data-toggle="modal" href="/board/adRewriteRead?not_no=${vo.not_no }" data-target="#exampleModal${i.index }" data-whatever="작성자" style="cursor: pointer; color: #414934; font-weight: bold;"> ${vo.not_title }</a>		
<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${status.index }" data-whatever="@getbootstrap">Open modal for @getbootstrap</button> --%>

<div class="modal fade" id="exampleModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style="color: #414934; font-weight: bold;">1:1문의 상세보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!--         <form> -->
		  <div class="form-group">
            <label for="recipient-name" class="col-form-label" style="color: #414934; font-weight: bold;">문의제목:</label>
            <input type="text" class="form-control1" id="recipient-name" value="${vo.not_title }" readonly="readonly">
          </div>
          <div style="display: flex; justify-content: space-between;">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label" style="color: #414934; font-weight: bold;">작성자:</label>
            <c:choose>
            	<c:when test="${vo.not_middle == 4 }">
            			<input type="text" class="form-control1" id="recipient-name" value="관리자" readonly="readonly">
            	</c:when>
            	<c:otherwise>
            			 <input type="text" class="form-control1" id="recipient-name" value="${vo.mem_id }" readonly="readonly">
            	</c:otherwise>
            </c:choose>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label" style="color: #414934; font-weight: bold;">작성일:</label>
            <input type="text" class="form-control1" id="recipient-name" value="<fmt:formatDate value="${vo.not_date }" pattern="yy-MM-dd"/>" readonly="readonly">
          </div>
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label" style="color: #414934; font-weight: bold;">문의내용:</label>
            <c:choose>
            	<c:when test="${vo.not_middle == 4 }">
            			<!-- 뷰어시작 -->
<%--             			<textarea class="form-control" id="message-text" rows="5">${vo.not_reply }</textarea> --%>
					
            			<div id="not_reply" class="form-control1" style="height: 150px;">${vo.not_reply}</div>
					<div id="viewer" style="display: none"></div>	
                                <script>
									var not_content = $("#not_reply")[0].innerHTML;
									
									const editor = new toastui.Editor.factory({
										el: document.querySelector('#viewer'),
									    previewStyle: 'vertical',
									    height: '500px',
									    initialValue: "",
									    initialEditType : "wysiwyg",
									    initialValue : not_reply,
									    viewer: true,
									    
									});
									
								</script>
					
            	</c:when>
            	<c:otherwise>
            			 <textarea class="form-control1" id="message-text" rows="5" readonly="readonly" style="height: 150px;">${vo.not_content }</textarea>
            	</c:otherwise>
            </c:choose>
          </div>
<!--         </form> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color: #6F7B63; border-color:#6F7B63; ">확인</button>
        <button type="button" class="btn btn-primary"  onclick="location.href='/board/adRewriteRegist?not_no=${vo.not_no }';" style="background-color: #A4AC85; border-color:#A4AC85; ">답글달기</button>
      </div>
    </div>
  </div>
</div>																		
<!-- 모달로 본문보기-->
									</td><!-- /문의제목 -->
									<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
									${vo.mem_id }
									<c:if test="${vo.not_middle == 4 }">
									관리자
									</c:if>
									</td>
									<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
										<fmt:formatDate value="${vo.not_date }" pattern="yy-MM-dd"/>
									</td>
									<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${vo.not_viewcnt }</td>
									<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
										<c:if test="${vo.not_middle != 4 }">													
											<a href="/board/adRewriteRegist?not_no=${vo.not_no }" style="color: #6F7B63; font-weight: bolder;" id="rew"> 답글 </a>
											<span style="color: #B6AD90; font-weight: bolder;">/</span>
										</c:if>
											<a href="/board/adRewriteRemove?not_no=${vo.not_no }" style="color: #6F7B63; font-weight: bolder;" id="deleteRewrite"> 삭제 </a>
									</td>
								</tr>
								</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableAll -->        
                                     
                </div>
            </div>
        </div>
     </div> 
     <br><br><br>  
<!-- 페이징처리 -->
<div class="pagination" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination" style="font-size: 18px;">
			<c:if test="${pvo.prev }">
				<li class="paging"><a href="/board/adRewriteList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li class="paging" 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/board/adRewriteList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li class="paging"><a href="/board/adRewriteList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
 </div>
<!-- 페이징처리 -->	
  </section>
  <br><br><br><br><br><br><br><br><br>
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
// 모달
$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
	  modal.find('.modal-title').text('New message to ' + recipient)
	  modal.find('.modal-body input').val(recipient)
	})
</script>

<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#rew").click(function(){ // get방식
		
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


});
	
	


$("#deleteRewrite").click(function(){
	
	var not_no = document.fr.not_no.value;

	alert(not_no);
	
	 Swal.fire({ 
        title: '정말 삭제하시겠습니까?', 
        icon: 'warning', 
        html: "<h6>삭제 시 기존 데이터는 복구되지 않습니다.</h6><h5>메인페이지로 이동합니다.</h5>",
        showCancelButton: true,         
        confirmButtonColor: '#A4AC85', 
        cancelButtonColor: '#6F7B63', 
        confirmButtonText: '삭제하기', 
        cancelButtonText: '머무르기' 
      }).then((result) => { 
        if (result.isConfirmed) {           
             //"취소하기" 버튼을 눌렀을 때 호출할 함수
       	 location.href="/board/adRewriteRemove?not_no="+not_no;
        } 
      }) 
      
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
	
</html>