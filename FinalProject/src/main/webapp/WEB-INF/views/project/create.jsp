<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
 <!--====== Required meta tags ======-->
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!--====== Title ======-->
    <title>LET EARTH</title>
    
    <!--====== Favicon Icon ======-->
    <link rel="shortcut icon" href="../resources/assets/images/favicon.ico" type="image/png">

    <!--====== Bootstrap css ======-->
    <link rel="stylesheet" href="../resources/assets/css/bootstrap.min.css">
    
    <!--====== flaticon css ======-->
    <link rel="stylesheet" href="../resources/assets/css/flaticon.css">
    
    <!--====== odometer css ======-->
    <link rel="stylesheet" href="../resources/assets/css/odometer.min.css">
    
    <!--====== magnific popup css ======-->
    <link rel="stylesheet" href="../resources/assets/css/magnific-popup.css">
    
    <!--====== Fontawesome css ======-->
    <link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">
    
    <!--====== animate css ======-->
    <link rel="stylesheet" href="../resources/assets/css/animate.min.css">
    
    <!--====== Slick css ======-->
    <link rel="stylesheet" href="../resource/sassets/css/slick.css">
    
    <!--====== Default css ======-->
    <link rel="stylesheet" href="../resources/assets/css/default.css">
    
    <!--====== Style css ======-->
    <link rel="stylesheet" href="../resources/assets/css/style.css">
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
<script>
$(document).ready(function(){
	// 기본 정보
	$('#basicInfo-tab').click(function() {
		$.ajax({
			url:"/project/basicInfo",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#basicInfo").html(data);
			}	
		});
	});
	
	// 나의 프로젝트
	$('#plan-tab').click(function() {
		$.ajax({
			url:"/project/plan",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#plan").html(data);
			}	
		});
	});
	
	// 펀딩 프로젝트
	$('#reward-tab').click(function() {
		$.ajax({
			url:"/project/reward",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#reward").html(data);
			}	
		});
	});
	
	// 관심 프로젝트
	$('#story-tab').click(function() {
		$.ajax({
			url:"/project/story",
			type:"get",
			datatype:"html",
			success:function(data){
				$("#story").html(data);
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
<!--  <header class="header-area" style="border-bottom: none;"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-lg-12"> -->
<!--                     <div class="header-top d-flex justify-content-between align-items-center"> -->
<!--                         <div class="header-info"> -->
<!--                             <ul> -->
<!--                             </ul> -->
<!--                         </div> -->
<!--                         <div class="social"> -->
<!--                             <ul> -->
<%--                             	<c:choose> --%>
<%-- 	                            	<c:when test="${mem_id == null}"> --%>
<!-- 	                                	<li><a href="/member/login">회원가입/로그인</a></li> -->
<%-- 	                                </c:when> --%>
<%-- 	                                <c:when test="${mem_id != null}"> --%>
<%-- 	                                	<li><a href="/mypage/mypage">${mem_id } 님, 환영합니다!</a></li> --%>
<!-- 	                                	<li><a href="/member/logout">로그아웃</a></li> -->
<%-- 	                                </c:when> --%>
<%--                                 </c:choose> --%>
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!-- </header> -->
    <!--====== PROJECT DETAILS PART START ======-->
    
    <section class="project-details-area pt-120 pb-190" style="background-color: white">
        <div style="display: flex; justify-content: center;">
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
                                <a class="nav-link active" id="basicInfo-tab" data-toggle="pill" href="#basicInfo" role="tab" aria-controls="basicInfo" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">기본 정보</a>
                            </li>
                            <li class="nav-item" role="presentation">
                               <a class="nav-link" id="plan-tab" data-toggle="pill" href="#plan" role="tab" aria-controls="plan" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">일정</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="reward-tab" data-toggle="pill" href="#reward" role="tab" aria-controls="reward" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">리워드</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="story-tab" data-toggle="pill" href="#story" role="tab" aria-controls="story" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">스토리</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="policy-tab" data-toggle="pill" href="#policy" role="tab" aria-controls="policy" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">정책</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="regist-tab" data-toggle="pill" href="#regist" role="tab" aria-controls="regist" aria-selected="false" style="padding: 0px; margin-left:1em; margin-right:1em; background: none; color: #1b1f2e;">대표자 정보 입력</a>
                            </li>
                        	<!-- 탭 메뉴 -->
                        </ul>
                    </div>
            	 <hr>
                    <div class="tab-content" id="pills-tabContent">
	                    <!-- 기본 정보 -->
	                    <div class="tab-pane fade" id="basicInfo" role="tabpanel" aria-labelledby="myInfo-tab">
	                    </div>
	                    <!-- 기본 정보 -->
	                    <!-- 일정 -->
	                    <div class="tab-pane fade" id="plan" role="tabpanel" aria-labelledby="myProject-tab">
	                    </div>
	                    <!-- 일정 -->
	                    <!-- 리워드 -->
	                    <div class="tab-pane fade" id="reward" role="tabpanel" aria-labelledby="myFunding-tab">
	                    </div>
	                    <!-- 리워드 -->
	                    <!-- 스토리 -->
	                    <div class="tab-pane fade" id="story" role="tabpanel" aria-labelledby="myLike-tab">
	                    </div>
	                    <!-- 스토리 -->
	                    <!-- 정책 -->
	                    <div class="tab-pane fade" id="policy" role="tabpanel" aria-labelledby="myReply-tab">
	                    </div>
	                    <!-- 정책 -->
                      	<!-- 대표자 -->
                        <div class="tab-pane fade" id="regist" role="tabpanel" aria-labelledby="myQna-tab">
                        </div>
                      	<!-- 대표자 -->
					</div>
                </div>
	</div>
</section>
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>