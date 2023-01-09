<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 어드민 lte -->
<link href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" /> -->
<!-- <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" /> -->
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>1:1문의</title>

<style type="text/css">

#repSelector {
  width : 15%;
  height : 4px;
  background-color : #BBE093;
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

#sbtn {
	position: absolute;
	top: 0px;
	right: -20%;
	background-color: #BFCC97;
}

  /*페이징*/
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
    z-index: 2;
    color: #fff;
    cursor: default;
    background-color: #89A378;
    border-color: #89A378;
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
</style>
</head>
<body>   
   <!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
   
   
   <section class="contact-form-area">
   <div style="display: flex; font-size: 16px;">
   <%@ include file="../include/adSide1.jsp" %>	
   
        <div class="container">
        
        
    <br>
 	<br>        
 	<br>        
   <!-- 어드민 -->		
						<h2 class="box-title" align="center"><b style="color: #6c757d;"> 관리자 1:1 문의 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12"><br><br>
				<div style="font-size: 1.5rem;" align="left">
					<br>  
					<hr id="repSelector1">	
				</div>
					
			<!-- 어드민 -->                                                      
				<div class="box">
					<div class="box-header">
					
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px;">
								<input type="text" name="table_search"
									class="form-control pull-right" placeholder="Search" style="height: 30px; font-size: 1.5rem;"">
								<div class="input-group-btn" style="position: relative; left: 18%;">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search" ></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<br>
<!-- tableAll -->
					<div class="box-body table-responsive no-padding" id="tableAll">
			<form role="form" name="fr" id="contact-form" action="" method="post">
					<input type="hidden" name="not_re_lev" value="${vo.not_re_lev }">
					<input type="hidden" name="not_re_ref" value="${vo.not_re_ref }">
					<input type="hidden" name="not_re_seq" value="${vo.not_re_seq }">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EEF5E6">
									<th>글번호</th>
									<th>1:1문의 제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>관리</th>
								</tr>
				<c:forEach var="vo" items="${adRewriteList }" varStatus="i">
								<tr>
									<td>
									${i.count }
									<input type="hidden" name="not_no" value="${vo.not_no }">
									</td>
									<td> <!-- 문의제목 -->
										<!-- 관리자일 경우 들여쓰기 -->
										<c:if test="${vo.not_re_lev > 0 }">
											<img src="/resources/level.gif" width="${vo.not_re_lev*10 }">
											<img src="/resources/re.gif">
										</c:if>		
<!-- 										상세보기a링크													 -->
<%-- 										<a href="/board/adRewriteRead?not_no=${vo.not_no }" style="color: gray;"> ${vo.not_title } </a> --%>
	<!-- 모달 -->
										
								<a data-toggle="modal" href="/board/adRewriteRead?not_no=${vo.not_no }" data-target="#exampleModal${i.index }" data-whatever="작성자" style="cursor: pointer;"> ${vo.not_title }</a>		
<%-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal${status.index }" data-whatever="@getbootstrap">Open modal for @getbootstrap</button> --%>

<div class="modal fade" id="exampleModal${i.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New message</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
<!--         <form> -->
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Recipient:</label>
            <input type="text" class="form-control" id="recipient-name">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text">${vo.not_content }</textarea>
          </div>
<!--         </form> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>																		
<!-- 모달 -->
									</td><!-- /문의제목 -->
									<td>
									${vo.mem_id }
									<c:if test="${vo.not_middle == 4 }">
									관리자
									</c:if>
									</td>
									<td>
										<fmt:formatDate value="${vo.not_date }" pattern="yy-MM-dd"/>
									</td>
									<td>${vo.not_viewcnt }</td>
									<td>
										<c:if test="${vo.not_middle != 4 }">													
											<a href="/board/adRewriteRegist?not_no=${vo.not_no }" style="color: #8FC951;"> 답글 </a>
											/
										</c:if>
											<a href="/board/adRewriteRemove?not_no=${vo.not_no }" style="color: #8FC951;"> 삭제 </a>
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
<!-- 페이징처리 -->
<div class="box-footer clearfix" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination pagination-sm no-margin pull-center">
			<c:if test="${pvo.prev }">
				<li><a href="/board/adRewriteList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/board/adRewriteList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li><a href="/board/adRewriteList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
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
<script>

   	<script type="text/javascript">
		var result = '${result}';
		if(result == '등록완'){
			alert("답글쓰기 완료!");
		}
		
		if(result == '수정완'){
			alert("답글수정 완료!");
		}
		
		if(result == '삭제완'){
			alert("답글삭제 완료!");
		}
		
</script>
<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">
function deleteRewrite(){
	 Swal.fire({ 
        title: '정말 삭제하시겠습니까?', 
        icon: 'warning', 
        html: "<h6>삭제 시 복구되지 않습니다.</h6><h5>메인페이지로 이동합니다.</h5>",
        showCancelButton: true,         
        confirmButtonColor: '#3085d6', 
        cancelButtonColor: 'grey', 
        confirmButtonText: '삭제하기', 
        cancelButtonText: '머무르기' 
      }).then((result) => { 
        if (result.isConfirmed) {           
             //"취소하기" 버튼을 눌렀을 때 호출할 함수
       	 location.href="/board/adRewriteRemove?not_no="+${vo.not_no };
        } 
      }) 
   } 	
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