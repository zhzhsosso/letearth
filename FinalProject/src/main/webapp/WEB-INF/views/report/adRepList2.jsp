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
<title>신고</title>


<style type="text/css">
#sbtn {
	position: absolute;
	top: 0px;
	
	background-color: #A4AC85;
	height: 35px;
}

 #mbtn { 
 	font-size: 14px; 
 	border-radius: 0.5rem; 
 } 

#repSelector {
  width : 20%;
  height : 3px;
  background-color : #D7D1B9;
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

/*a 태그 상태 css*/
#hov a:link{
  color : #D7D1B9;
  font-weight: normal;
  /*text-decoration: underline;*/
  
 }

#hov a:hover{
  color : #6F7B63;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
  
 }
 
 #hov a:active{
  color : #6F7B63;
  transition : 0s;
  font-weight: bolder;
  /*text-decoration: underline;*/
  
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

.reptb a:hover{
  color : #B6AD90;
  transition : 0s;
  font-weight: bolder;
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
						<h2 class="box-title" align="center"><b style="color: #6F7B63;"> 관리자 신고접수 목록 </b></h2>
						<hr id="repSelector" align="center">
			<div class="col-xs-12" style="font-size: 16px;"><br><br>
				<div style="font-size: 1.7rem; cursor: pointer;" align="left">
				<span id="hov"> 
					<a href="/report/adRepListAll" id="listAll" style="color: #6F7B63; font-weight: bolder;">전체</a> 
					| 
					<a href="/report/adRepList?rep_cat=1" id="listMem">회원</a>
					| 
					<a href="/report/adRepList?rep_cat=2" id="listPro">프로젝트</a>
				</span>
					<hr id="repSelector1">	
				</div>
					
			<!-- 어드민 -->
			<!-- 검색 -->                                                      
<!-- 				<div class="box" style="border: none;"> -->
			
					<div class="box-header">
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px; height: 50px; ">
<!-- 				<form role="searchForm" method="get" onsubmit="return fun1()"> -->
<!-- 					<div class="fcntr" style="width:200px;"> -->
<!--                    		 <select name="type" id="type" style="width: 50%;"> -->
<!--                        		<option value="">::검색유형::</option> -->
<!-- 							<option value="1">신고자</option> -->
<!-- 							<option value="2">신고대상</option>							   -->
<!-- 						</select> -->
<!--                 	</div> -->
					
								<input type="text" name="keyword" class="form-control pull-right" placeholder="Search" 
									style="height: 35px; width: 60px; font-size: 1rem; border-color: #A4AC85; color:#B6AD90; border-radius:0.25rem; ">
								<div class="input-group-btn" style="padding-left: 3px;">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
<!-- 				</form> -->
							</div>
						</div>
					</div>
			<!-- 검색 -->
				<div style="padding-top: 30px; padding-bottom: 30px;"></div>
<!-- tableAll --><div class="box" style="border: none;">
					<div class="box-body table-responsive no-padding" id="tableAll" >
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;" id="vc">
									<th style="text-align: center; width: 7%;">#</th>
									<th style="text-align: center;">신고자</th>
									<th style="text-align: center;">유형</th>
									<th style="text-align: center;">신고대상</th>
									<th style="text-align: center;">사유</th>
									<th style="text-align: center;">신고날짜</th>
									<th style="text-align: center;">상태</th>											
									<th style="text-align: center;">상세보기</th>											
								</tr>
								<c:forEach var="vo" items="${adRepList }" varStatus="vs">
												<tr class="reptb">
													<td style="padding: 8px; text-align: center; vertical-align:middle; color: #414934; ">
														<input type="hidden" id="rep_no" value="${vo.rep_no }">
														${vo.rep_no }
													</td>
													<td style="vertical-align:middle; padding: 8px; text-align:center;">${vo.reper_id }</td>
													<td style="vertical-align:middle; padding: 8px; text-align:center; width : 8%; table-layout: fixed;">
														<c:if test="${vo.rep_cat == 1}">회원</c:if>
														<c:if test="${vo.rep_cat == 2}">프로젝트</c:if>
													</td>													
													<td style="vertical-align:middle; padding: 8px; text-align:center;">
														<a href="/prodetail/info?pro_no=${vo.pro_no }" style="color: #414934;">${vo.reped_id }</a>
													</td>
													<td style="vertical-align:middle; padding: 8px; width : 30%; table-layout: fixed;"">
														${vo.rep_reason }
													</td>
													<td style="vertical-align:middle; padding: 8px; text-align:center;">
														<fmt:formatDate value="${vo.rep_date }" pattern="yyyy-MM-dd"/>
													</td>
													<td style="vertical-align:middle; padding: 8px; text-align:center; width : 5%; table-layout: fixed;">${vo.rep_status }</td>
													<td style="vertical-align:middle; padding: 8px; text-align:center;">
																										
															<!-- Button trigger modal -->
																<button type="button" id="mbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter${vs.index}" style="background-color: #A4AC85; border-color:#A4AC85; ">
																  상세
																</button>
																
																<!-- Modal -->
																<div class="modal fade" id="exampleModalCenter${vs.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
																  <div class="modal-dialog modal-dialog-centered" role="document">
																    <div class="modal-content">
																      <div class="modal-header">
																        <h5 class="modal-title" id="exampleModalCenterTitle">신고 상세내역</h5>
																        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
																          <span aria-hidden="true">&times;</span>
																        </button>
																      </div>
																      <div class="modal-body">
																        	${vo.rep_content }
																      </div>
																      <div class="modal-footer">
																        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color: #6F7B63; border-color:#6F7B63; ">확인</button>
																        <button type="button" class="btn btn-primary"
																        onclick="location.href='/report/adBlackModify?rep_cat=${vo.rep_cat }&pro_no=${vo.pro_no }&reped_id=${vo.reped_id }';"
																        style="background-color: #A4AC85; border-color:#A4AC85; ">블랙리스트</button>
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


				</div>
			</div>
			</div>

	
   </div>
   <br><br><br>
<!-- 페이징처리 -->
	<div class="pagination" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination" style="font-size: 18px;">
			<c:if test="${pvo.prev }">
				<li class="paging"><a href="/report/adRepListAll?page=${pvo.startPage-1 }" >«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }">
				<li class="paging"				
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/report/adRepListAll?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li class="paging"><a href="/report/adRepListAll?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
	</div>
</section>
   
   
   
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>

<!-- jQuery-->  
<script type="text/javascript">

$(document).ready(function(){	

	$("#listMem").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	}, function(){
		$(this).css('color', '#B6AD90'); // 마우스 논오버 시
		$(this).css('font-weight', 'normal'); 
	});
	
	$("#listPro").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	}, function(){
		$(this).css('color', '#B6AD90'); // 마우스 논오버 시
		$(this).css('font-weight', 'normal'); 
	});
	
		// 평상시 상태
		$("#listMem").css("color", "#B6AD90"); 
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","#B6AD90");
		$("#listPro").css("font-weight","normal");

	
});
</script>	
	
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