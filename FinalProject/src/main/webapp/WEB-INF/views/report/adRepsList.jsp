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
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>신고</title>


<style type="text/css">
#sbtn {
	position: absolute;
	top: 0px;
	
	background-color: #BFCC97;
}

 #mbtn { 
 	font-size: 14px; 
 	border-radius: 0.5rem; 
 } 

#repSelector {
  width : 20%;
  height : 3px;
  background-color : #BBE093;
  border : 0;
  
   position: relative;
   top: -10px; 
/*    left: 380px;  */
   left: 40%;
}

#repSelector1{
   position: relative;
   top: -15px; 
}

/*hover*/
#hov a:hover{
  color : green;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
  
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
       <div style="display: flex;">
   <%@ include file="../include/adSide1.jsp" %>	
      
        <div class="container">     
    <br>
 	<br>        
 	<br>        
   <!-- 어드민 -->		
						<h2 class="box-title" align="center"><b style="color: #6c757d;"> 관리자 신고접수 목록 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12" style="font-size: 16px;"><br><br>
				<div style="font-size: 2.5rem; cursor: pointer;" align="left">
				<span id="hov"> 
					<a id="listAll">전체</a> 
					| 
					<a id="listMem">회원</a>
					| 
					<a id="listPro">프로젝트</a>
				</span>
					<hr id="repSelector1">	
				</div>
					
			<!-- 어드민 -->
			<!-- 검색 -->                                                      
				<div class="box" style="border: none;">
					<div class="box-header">
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px; height: 50px;">
				<form role="searchForm" method="get" onsubmit="return fun1()">
					<div class="fcntr" style="width:200px;">
                   		 <select name="type" id="type" style="width: 50%;">
                       		<option value="">::검색유형::</option>
							<option value="1">신고자</option>
							<option value="2">신고대상</option>							  
						</select>
                	</div>
					
								<input type="text" name="table_search"
									class="form-control pull-right" placeholder="Search" style="height: 30px; font-size: 1.5rem;">
								<div class="input-group-btn">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
				</form>
							</div>
						</div>
					</div>
			<!-- 검색 -->
					<br><br>
<!-- tableAll -->
					<div class="box-body table-responsive no-padding" id="tableAll">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0" id="vc">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo1" items="${adRepList }" varStatus="vs1">
												<tr>
													<td style="vertical-align : middle;">
														<input type="hidden" id="rep_no" value="${vo1.rep_no }">
														${vo1.rep_no }
													</td>
													<td style="vertical-align : middle;">
														${vo1.reper_id }
													</td>
													<td style="vertical-align : middle;">
														<c:if test="${vo1.rep_cat == 1}">회원</c:if>
														<c:if test="${vo1.rep_cat == 2}">프로젝트</c:if>
													</td>													
													<td style="vertical-align : middle;">
														${vo1.reped_id }
													</td>
													<td style="vertical-align : middle;">
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo1.rep_reason }
													</td>
													<td style="vertical-align : middle;">
														<fmt:formatDate value="${vo1.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td style="vertical-align : middle;">
														${vo1.rep_status }
													</td>
													<td>
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs1.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs1.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo1.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo1.rep_cat }&pro_no=${vo1.pro_no }&reped_id=${vo1.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:forEach>				
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableAll -->
<!-- tableMem -->
					<div class="box-body table-responsive no-padding" id="tableMem">
<!-- 			<form role="form" name="fr" id="contact-form" action="" method="post"> -->
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo2" items="${adRepList }" varStatus="vs2">
								<c:if test="${vo2.rep_cat == 1}">
												<tr>
													<td style="vertical-align : middle;">
													<input type="hidden" id="rep_no" value="${vo2.rep_no }">
													${vo2.rep_no }
													</td>
													<td style="vertical-align : middle;">${vo2.reper_id }</td>
													<td style="vertical-align : middle;"> 회원 </td>													
													<td style="vertical-align : middle;">${vo2.reped_id }</td>
													<td style="vertical-align : middle;">
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo2.rep_reason }
													</td>
													<td style="vertical-align : middle;">
														<fmt:formatDate value="${vo2.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td style="vertical-align : middle;">${vo2.rep_status }</td>
													<td style="vertical-align : middle;">
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs2.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs2.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo2.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo2.rep_cat }&pro_no=${vo2.pro_no }&reped_id=${vo2.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:if>
												</c:forEach>				
							</tbody>
						</table>
<!-- 					  </form> -->
					</div>
<!-- tableMem -->
<!-- tablePro -->
					<div class="box-body table-responsive no-padding" id="tablePro">
<!-- 			<form role="form" name="fr" id="contact-form" action="" method="post"> -->
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0">
									<th>신고번호</th>
									<th>신고자</th>
									<th>유형</th>
									<th>신고대상</th>
									<th>사유</th>
									<th>신고날짜</th>
									<th>진행상태</th>											
									<th>상세보기</th>										
								</tr>
								<c:forEach var="vo3" items="${adRepList }" varStatus="vs3">
								<c:if test="${vo3.rep_cat == 2}">
												<tr>
													<td style="vertical-align : middle;">
													<input type="hidden" id="rep_no" value="${vo3.rep_no }">
													${vo3.rep_no }
													</td>
													<td style="vertical-align : middle;">${vo3.reper_id }</td>
													<td style="vertical-align : middle;"> 프로젝트 </td>													
													<td style="vertical-align : middle;">${vo3.reped_id }</td>
													<td style="vertical-align : middle;">
														<%-- 	<a href="/report/adRepRead?rep_no=${vo.rep_no }"> ${vo.rep_reason } </a> --%>
														${vo3.rep_reason }
													</td>
													<td style="vertical-align : middle;">
														<fmt:formatDate value="${vo3.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td style="vertical-align : middle;">${vo3.rep_status }</td>
													<td style="vertical-align : middle;">
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs3.index}" style="background-color: #BBE093; border-color:#BBE093; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs3.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo3.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo3.rep_cat }&pro_no=${vo3.pro_no }&reped_id=${vo3.reped_id }';"
																        style="background-color: #BBE093; border-color:#BBE093; ">블랙리스트</button>
																      </div>
																    </div>
																  </div>
																</div>																															
													
													</td>
												</tr>
												</c:if>
												</c:forEach>				
							</tbody>
						</table>
<!-- 					  </form> -->
					</div>
<!-- tablPro -->

				</div>
			</div>

	
   </div>
   </div>
<!-- 페이징처리 -->
	<div class="box-footer clearfix" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination pagination-sm no-margin pull-left">
			<c:if test="${pvo.prev }">
				<li><a href="/report/adRepList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li 				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/report/adRepList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li><a href="/report/adRepList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
	</div>
</section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   	<script type="text/javascript">
		var result = '${result}';
		if(result == '등록완'){
			alert("글쓰기 완료!");
		}
		
		if(result == '수정완'){
			alert("글 수정 완료!");
		}
		
		if(result == '삭제완'){
			alert("글 삭제 완료!");
		}
		
</script>

<script type="text/javascript">
$(document).ready(function(){
	  
	$("#tableAll").show();
	$("#tableMem").hide();
	$("#tablePro").hide();
	
	$("#listAll").css("color","green");
	$("#listAll").css("font-weight","bolder");

	$("#listAll").click(function(){
		$("#tableAll").show();
		$("#tableMem").hide();
		$("#tablePro").hide();
		
		$("#listAll").css("color","green");
		$("#listAll").css("font-weight","bolder");
		$("#listMem").css("color","grey");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","grey");
		$("#listPro").css("font-weight","normal");

	});
	
	$("#listMem").click(function(){
		$("#tableAll").hide();
		$("#tableMem").show();
		$("#tablePro").hide()
		
		$("#listAll").css("color","grey");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","green");
		$("#listMem").css("font-weight","bolder");
		$("#listPro").css("color","grey");
		$("#listPro").css("font-weight","normal");
	});
	
	$("#listPro").click(function(){
		$("#tableAll").hide();
		$("#tableMem").hide();
		$("#tablePro").show();
		
		$("#listAll").css("color","grey");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","grey");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","green");
		$("#listPro").css("font-weight","bolder");
	});
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

<!-- 검색기능 -->
 <script type="text/javascript">
 function fun1(){
	 
 if(document.fr.type.value==""){
	 
	 Swal.fire({   
         title : '검색유형을 선택하세요!',
          icon: 'info',
         confirmButtonText: '확인'
      })
		document.fr.type.focus();
		return false;
	}
 
	$(document).ready(function(){
			 
		$("#sbtn").click(function(){ // get방식
			location.href="/report/adRepsList";
		});
		
	});

 }
 </script>
</html>