<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
    height:100%;
    width:0%;
    background:#29f0b4;
}
.user-img {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 80px;
    height: 80px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
}
.user {
	background: #674df0;
    line-height: 30px;
    padding: 0 15px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 3px;
    color: #fff;
    margin-right: 10px;
}
only screen and (min-width: 768px) and (max-width: 991px)
.project-details-content-area .tab-btns .nav li a {
	color: #1b1f2e;
}

</style>
<script type="text/javascript">
$(document).ready(function(){
	alert('실행!');
	// 페이지 로딩 시 내정보 보여주기
	$.ajax({
		url:"/mypage/myInfo",
		type:"get",
		datatype:"html",
		success:function(data){
			$("#myInfo").html(data);
		}	
	});
	
});
</script>
<script>
$(document).ready(function(){
	// 내정보
	$('#myInfo-tab').click(function() {
		$.ajax({
			url:"/mypage/myInfo",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myInfo").html(data);
			}	
		});
	});
	
	// 나의 프로젝트
	$('#myProject-tab').click(function() {
		$.ajax({
			url:"/mypage/myProject",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myProject").html(data);
			}	
		});
	});
	
	// 펀딩 프로젝트
	$('#myFunding-tab').click(function() {
		$.ajax({
			url:"/mypage/myFunding",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myFunding").html(data);
			}	
		});
	});
	
	// 관심 프로젝트
	$('#myLike-tab').click(function() {
		$.ajax({
			url:"/mypage/myLike",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myLike").html(data);
			}	
		});
	});
	
	// 댓글
	$('#myReply-tab').click(function() {
		$.ajax({
			url:"/mypage/myReply",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myReply").html(data);
			}	
		});
	});
	
	// qna
	$('#myQna-tab').click(function() {
		$.ajax({
			url:"/mypage/myQna",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#myQna").html(data);
			}	
		});
	});

});
</script>
<!-- 헤더 -->
<%@ include file="../include/header.jsp" %>

    <!--====== PROJECT DETAILS PART START ======-->
    
    <section class="project-details-area pt-120 pb-190" style="background-color: white">
        <div style="display: flex; justify-content: center;">
	        <div class="col-lg-8">
	        	<div style="position: relative; top: 80%;" >
	        		<div style="">
		           		<span class="user-img" style="background-image: url('${memVO.mem_profile}'); vertical-align: middle;"></span>
		           		<span style="font-size: 2em; vertical-align: middle; padding-left: 0.5em;">${memVO.mem_name } 님ㅤ</span>
		           		<c:choose>
		           			<c:when test="${memVO.mem_status == 0 }">
								<span class="user">구매회원</span>
		           			</c:when>
		           			<c:when test="${memVO.mem_status == 1 }">
								<span class="user">판매회원</span>
		           			</c:when>
		           		</c:choose>
	           		</div>
	            </div>
	        </div>
        </div>
    </section>
    
    
    <!--====== PROJECT DETAILS PART ENDS ======-->
 
 <section class="project-details-content-area pb-110">
        <div style="display: flex; justify-content: center;">
                <div class="col-lg-8">
                    <div class="tab-btns">
                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                        	<!-- 탭 메뉴 -->
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="myInfo-tab" data-toggle="pill" href="#myInfo" role="tab" aria-controls="pills-profile" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">나의 정보</a>
                            </li>
                            
                            <c:if test="${memVO.mem_status == 1}">
	                           <li class="nav-item" role="presentation">
	                               <a class="nav-link" id="myProject-tab" data-toggle="pill" href="#myProject" role="tab" aria-controls="myProject" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">나의 프로젝트</a>
	                           </li>
                            </c:if>
                           
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="myFunding-tab" data-toggle="pill" href="#myFunding" role="tab" aria-controls="myFunding" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">펀딩 프로젝트</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="myLike-tab" data-toggle="pill" href="#myLike" role="tab" aria-controls="myLike" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">관심 프로젝트</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="myReply-tab" data-toggle="pill" href="#myReply" role="tab" aria-controls="myReply" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">내 댓글</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="myQna-tab" data-toggle="pill" href="#myQna" role="tab" aria-controls="myQna" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">1:1 문의</a>
                            </li>
                        	<!-- 탭 메뉴 -->
                        </ul>
                    </div>
            	 <hr>
                    <div class="tab-content" id="pills-tabContent">
	                    <!-- 나의 정보 -->
	                    <div class="tab-pane fade" id="myInfo" role="tabpanel" aria-labelledby="myInfo-tab">
	                    </div>
	                    <!-- 나의 정보 -->
	                    <!-- 나의 프로젝트 -->
	                    <div class="tab-pane fade" id="myProject" role="tabpanel" aria-labelledby="myProject-tab">
	                    </div>
	                    <!-- 나의 프로젝트 -->
	                    <!-- 펀딩 프로젝트 -->
	                    <div class="tab-pane fade" id="myFunding" role="tabpanel" aria-labelledby="myFunding-tab">
	                    </div>
	                    <!-- 펀딩 프로젝트 -->
	                    <!-- 관심 프로젝트 -->
	                    <div class="tab-pane fade" id="myLike" role="tabpanel" aria-labelledby="myLike-tab">
	                    </div>
	                    <!-- 관심 프로젝트 -->
	                    <!-- 댓글 -->
	                    <div class="tab-pane fade" id="myReply" role="tabpanel" aria-labelledby="myReply-tab">
	                    </div>
	                    <!-- 댓글 -->
                      	<!-- qna -->
                        <div class="tab-pane fade" id="myQna" role="tabpanel" aria-labelledby="myQna-tab">
                        </div>
                      	<!-- qna -->
					</div>
                </div>
	</div>
</section>
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>