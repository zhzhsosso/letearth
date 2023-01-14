<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://kit.fontawesome.com/90a612e2ef.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
	max-width: 100%;
    height:100%;
    width:0%;
    background:#A4AC85;
}
</style>

<script type="text/javascript">
function deleteLike(like_no) {
	Swal.fire({
		title: '관심 프로젝트에서 삭제하시겠습니까?',
		text: '삭제 후 복구는 불가합니다.',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#A4AC85',
		cancelButtonColor: 'grey',
		confirmButtonText: '삭제',
		cancelButtonText: '닫기'
	}).then((result) => {
		if (result.isConfirmed) {   
			$.ajax({
				async : true,
			    type:'post',
			    url:"/mypage/myLike",
			    data: {
			    	like_no:like_no,
				},
			    dataType : "text",
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    success : function(resp) { 
			    	Swal.fire({
    					icon : 'success',
    					title : '삭제 되었습니다.',
    					confirmButtonText : '확인',
    					confirmButtonColor: '#A4AC85'
    				})
		    		setTimeout(function () {
		    		 	$.ajax({
							url:"/mypage/myLike",
							type:"get",
							datatype:"html",
							success:function(data){
								$("#myLike").html(data);
							}	
						});
		    		}, 2000);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("ERROR : " + textStatus + " : " + errorThrown);
			    }        
			});
		} 
	}) 
}
</script>

<!-- 탭1 : 글 페이지 -->
	<div class="project-details-content-top">
		<!-- 프로젝트 시작 -->
		<div class="row justify-content-center">
			<c:if test="${empty likey }">
				<div style=" display: flex; align-items: center; padding-top: 5em;">
					<i class="fa-solid fa-circle-info fa-3x" style="color: #6F7B63;"></i>
					<h3 style="padding-left: 0.5em; color: #838694;">관심 프로젝트가 없습니다.</h3>
				</div>
			</c:if>
			<c:forEach var="likey" items="${likey }" >
				<div class="col-lg-4 col-md-6 col-sm-9">
					<div class="explore-projects-item mt-30">
						<div class="explore-projects-thumb">
							<img src="../resources/upload/${likey.pro_thum}" alt="LetEarth" width="100px;" height="300px;"> 
							<a onclick="deleteLike(${likey.like_no});" style="background: none;">
							<i class="fa-solid fa-heart" style="color: A4AC85;"></i>
							</a>
						</div>
						<div class="explore-projects-content">
							<div class="item d-flex align-items-center">
								<span style="background: #6F7B63;">D - ${likey.left_date}</span>
							</div>  <br>
							<a href="/prodetail/info?pro_no=${likey.pro_no}">
							<c:choose>
						        <c:when test="${fn:length(likey.pro_title) gt 14}">
						        <h3><c:out value="${fn:substring(likey.pro_title, 0, 13)}">...
						        </c:out></h3></c:when>
						        <c:otherwise>
						        <h3>${likey.pro_title }</h3>
						        </c:otherwise>
							</c:choose>
							</a>

							<div class="projects-range">
								<div class="projects-range-content">
									<ul>
										<li>달성률:</li>
										<li id="rate">${likey.achievement_rate}%</li>
									</ul>
									<div id="rangeGraph">
										<span style="width: ${likey.achievement_rate}%"></span>
									</div>
								</div>
							</div>
							<div class="projects-goal">
								달성 금액: <span><fmt:formatNumber value="${likey.pro_tp }" pattern="#,###" /></span> 원 <br>
								목표 금액: <span><fmt:formatNumber value="${likey.pro_gp }" pattern="#,###" /></span> 원
							</div> <br>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- 프로젝트 끝 -->
	</div>
<!-- 탭1 -->