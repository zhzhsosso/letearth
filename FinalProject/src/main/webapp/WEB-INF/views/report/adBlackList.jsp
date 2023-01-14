<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
<!-- 어드민 lte -->
<meta charset="UTF-8">
<title>블랙리스트</title>
<style type="text/css">

#sbtn {
	position: absolute;
	top: 0px;
	
	background-color: #A4AC85;
		height: 35px;
}

#repSelector {
  width : 16%;
  height : 3px;
  background-color : #D7D1B9;
  border : 0;
  
   position: relative;
   top: -12px; 
/*    left: 380px;  */
   left: 42.5%;
}

#repSelector1{
   position: relative;
   top: -15px; 
}

/*hover*/
#hov a:hover{
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

.blacktb a{
	color: 	#414934;
	
}
.blacktb a:hover{
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
		<h2 class="box-title" align="center"><b style="color: #6F7B63;">관리자 블랙리스트</b></h2>
		<hr id="repSelector" align="center">
			<div class="col-xs-12" style="font-size: 16px;"><br><br>
				<div style="font-size: 1.7rem; cursor: pointer;" align="left">
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
				<div class="box" style="border: none;">
					<div class="box-header">
						<div class="box-tools" align="right">
							<div class="input-group input-group-sm hidden-xs"
								style="width: 180px; height: 50px;">
								<input type="text" name="keyword" class="form-control pull-right" placeholder="Search" 
									style="height: 35px; width: 60px; font-size: 1rem; border-color: #A4AC85; color:#B6AD90; border-radius:0.25rem; ">
								<div class="input-group-btn" style="padding-left: 3px;">
									<button type="submit" class="btn btn-default" id="sbtn">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<div style="padding-top: 30px; padding-bottom: 30px;"></div>
<!-- tableAll -->
					<div class="box-body table-responsive no-padding" id="tableAll">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<th style="text-align: center; width: 7%; color: #414934; font-weight: bold;">#</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">회원아이디</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">프로젝트이름</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">유형</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">등록날짜</th>
								</tr>
								<c:forEach var="vo" items="${adBlackList }" varStatus="status">
									<tr class="blacktb">
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											${status.count }
											<input type="hidden" value="${vo.black_no }">
										</td>
										
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											<a href="/mempro/adMemDetail?mem_id=${vo.mem_id }">${vo.mem_id }</a>
										</td>
										
										<td style="vertical-align:middle; color: #414934; width : 45%; table-layout: fixed; font-weight: bold;">
											<a href="/mempro/adProDetail1?pro_no=${vo.pro_no }&mem_id=${vo.mem_id}">${vo.projectVO.pro_title }</a>
											<c:if test="${empty vo.projectVO.pro_title }">
												무분별한 댓글사용으로 신고가 들어온 회원입니다.
											</c:if>										
										</td>
										
										<c:if test="${vo.black_type == 1}">
											<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">회원신고</td>
										</c:if>
										<c:if test="${vo.black_type == 2}">
											<td style="text-align: center; vertical-align:middle; color: #B6AD90; font-weight: bold;">프로젝트신고</td>
										</c:if>
										
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											<fmt:formatDate value="${vo.black_date}" pattern="yyyy-MM-dd"/>
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
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<th style="text-align: center; width: 7%; color: #414934; font-weight: bold;">#</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">회원아이디</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">프로젝트이름</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">유형</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">등록날짜</th>
								</tr>
								<c:forEach var="vo" items="${adBlackList }" varStatus="status">
								<c:if test="${vo.black_type == 1}">
									<tr class="blacktb">
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											${status.count }
											<input type="hidden" value="${vo.black_no }">
										</td>
										
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
										${vo.mem_id }
										</td>
										
										<td style="vertical-align:middle; color: #414934; width : 45%; table-layout: fixed; font-weight: bold;">
											${vo.projectVO.pro_title }
											<c:if test="${empty vo.projectVO.pro_title }">
												무분별한 댓글사용으로 신고가 들어온 회원입니다.
											</c:if>										
										</td>
											<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
												<input type="hidden" name="black_type" value="${vo.black_type == 1}"> 회원신고
											</td>
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											<fmt:formatDate value="${vo.black_date}" pattern="yyyy-MM-dd"/>
										</td>
									</tr>
									</c:if>
								</c:forEach>	
							</tbody>
						</table>
					  </form>
					</div>
<!-- tableAll -->
<!-- tablePro -->
					<div class="box-body table-responsive no-padding" id="tablePro">
			<form role="form" name="fr" id="contact-form" action="" method="post">
						<table class="table table-hover">
							<tbody>
								<tr style="background-color: #EDEAE0;">
									<th style="text-align: center; width: 7%; color: #414934; font-weight: bold;">#</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">회원아이디</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">프로젝트이름</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">유형</th>
									<th style="text-align: center; color: #414934; font-weight: bold;">등록날짜</th>
								</tr>
								<c:forEach var="vo" items="${adBlackList }" varStatus="status">
								<c:if test="${vo.black_type == 2}">
									<tr class="blacktb">
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">
											${status.count }
											<input type="hidden" value="${vo.black_no }">
										</td>
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;">${vo.mem_id }</td>
										<td style="vertical-align:middle; color: #414934; width : 45%; table-layout: fixed; font-weight: bold;">${vo.projectVO.pro_title }
											<c:if test="${empty vo.projectVO.pro_title }">
												무분별한 댓글사용으로 신고가 들어온 회원입니다.
											</c:if>										
										</td>
											<td style="text-align: center; vertical-align:middle; color: #B6AD90; font-weight: bold;"><input type="hidden" name="black_type" value="${vo.black_type == 2}"> 프로젝트신고</td>
										<td style="text-align: center; vertical-align:middle; color: #414934; font-weight: bold;"><fmt:formatDate value="${vo.black_date}" pattern="yyyy-MM-dd"/></td>
									</tr>
									</c:if>
								</c:forEach>	
								
							</tbody>
						</table>
					  </form>
					</div>
<!-- tablePro -->



				</div>
		
			</div>

	</div>
	   
       </div>    
   <br><br><br><br>   
       <br><br><br>
        <!-- 페이징처리 -->
<div class="pagination" style="position: absolute; right: 45%; border: none;">
		<ul class="pagination" style="font-size: 18px;">
			<c:if test="${pvo.prev }">
				<li class="paging"><a href="/report/adBlackList?page=${pvo.startPage-1 }">«</a></li> <!-- 10 -->
			</c:if>
			
			<c:forEach var="idx" begin="${pvo.startPage }" end="${pvo.endPage }" step="1">
				<li class="paging"					
				<c:out value="${idx == pvo.cri.page? 'class=active':'' }"/> 				
				><a href="/report/adBlackList?page=${idx }">${idx }</a></li>
			</c:forEach>
			
			<c:if test="${pvo.next }">
				<li class="paging"><a href="/report/adBlackList?page=${pvo.endPage+1 }">»</a></li> <!-- 11 -->
			</c:if>
		</ul>
	</div>
<!-- 페이징처리 -->

    </section>
   
   <!-- 푸터 -->
   <%@ include file="../include/footer.jsp" %>
</body>
	<!-- jQuery-->  
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   	<script type="text/javascript">
		var result = '${result}';
		if(result == '블랙리스트회원추가'){
			alert("블랙리스트회원추가");
		}
		
		if(result == '수정완'){
			alert("블랙리스트프젝추가!");
		}
		
		
</script>


<script type="text/javascript" src="jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	/*기본페이지 전체조회*/
	$("#tableAll").show();
	$("#tableMem").hide();
	$("#tablePro").hide();
	
	$("#listAll").css("color","#6F7B63");
	$("#listAll").css("font-weight","bolder");
	$("#listMem").css("color","#B6AD90");
	$("#listMem").css("font-weight","normal");
	$("#listPro").css("color","#B6AD90");
	$("#listPro").css("font-weight","normal");

	// 마우스 오버 시작
	$("#listAll").hover(function(){
		$(this).css('color', '#6F7B63'); // 마우스 오버 시
		$(this).css('font-weight', 'bolder'); 
	});
	
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
	// 마우스오버끝
	
	
	
	$("#listAll").click(function(){
		$("#tableAll").show();
		$("#tableMem").hide();
		$("#tablePro").hide();
		
		$("#listAll").css("color","#6F7B63");
		$("#listAll").css("font-weight","bolder");
		$("#listMem").css("color","#B6AD90");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","#B6AD90");
		$("#listPro").css("font-weight","normal");
		
		// 마우스 오버 시작
		$("#listAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
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
		// 마우스오버끝
	});
	
	
	
	$("#listMem").click(function(){
		$("#tableAll").hide();
		$("#tableMem").show();
		$("#tablePro").hide()
		
		$("#listAll").css("color","#B6AD90");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","#6F7B63");
		$("#listMem").css("font-weight","bolder");
		$("#listPro").css("color","#B6AD90");
		$("#listPro").css("font-weight","normal");
		
		// 마우스 오버 시작
		$("#listMem").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#listAll").hover(function(){
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
		// 마우스오버끝
	});
	
	
	
	$("#listPro").click(function(){
		$("#tableAll").hide();
		$("#tableMem").hide();
		$("#tablePro").show();
		
		$("#listAll").css("color","#B6AD90");
		$("#listAll").css("font-weight","normal");
		$("#listMem").css("color","#B6AD90");
		$("#listMem").css("font-weight","normal");
		$("#listPro").css("color","#6F7B63");
		$("#listPro").css("font-weight","bolder");
		
		// 마우스 오버 시작
		$("#listPro").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		});
		
		$("#listMem").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		
		$("#listAll").hover(function(){
			$(this).css('color', '#6F7B63'); // 마우스 오버 시
			$(this).css('font-weight', 'bolder'); 
		}, function(){
			$(this).css('color', '#B6AD90'); // 마우스 논오버 시
			$(this).css('font-weight', 'normal'); 
		});
		// 마우스오버끝
	});
	
});
</script>
















	
</html>