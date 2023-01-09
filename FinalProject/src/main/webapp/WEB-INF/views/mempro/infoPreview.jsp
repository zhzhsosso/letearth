<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  
          
<style>
#dark {
		width: 100%;
		height: 100%;
		position: fixed;
		background-color: #000000;
		opacity:0.6;
		top: 0;
		left: 0;
		z-index:9998;
		display: none;
	}
	
	#rewardMo {
		border: 1px solid #dcdcdc;
		position: fixed;
		width: 1000px;
		height: 730px;
		left: 50%;
		top: 50%;
		transform: translate(-50%,-50%);
		padding: 10px;
		display: none;
		z-index:9999;
		background: #fff;
	}
	
	#rewardMo > p {
		font-size: 12px;
	}
	
	#rewardMoCl {
		background: none;
		border: 0;
		position: absolute;
		right: 10px;
		top: 10px;
		font-size: 20px;
	}
	
	#rewardMo-btn {
		padding: 5px;
		margin: 10px;
		width: 20%;
		border: 1px;
		border-style: solid;
		border-radius: 5px;
		background: white;
		color: black;
		font-size: 12px;
	}
	
	

 .infoBtn {
	 line-height: 30px;
	 padding: 5 1px;
 }
 
 .infoBtn a {
        font-size: 15px;
	    font-weight: 500;
	    color: #212529;
	    background: #e7ebef;
	    line-height: 24px;
	    padding: 8px 15px;
	    text-transform: uppercase;
	    margin: 6px 5px; 
        }
        
 .project-details-content-area .tab-content .tab-pane .project-details-updates .project-details-updates-top .info-updates .info .infoBtn span {
    font-size: 11px;
    color: #ffffff;
}

 .panmaeja-btn {
 line-height: 30px;
        padding: 5 1px;
 
 }
 
 .panmaeja-btn span {
        font-size: 11px;
        font-weight: 500;
        color: #ffffff;
        background: #674df0;
        line-height: 20px;
        padding: 0 15px;
        text-transform: uppercase;
        letter-spacing: 2px; 
        }
        
 .project-details-content-area .tab-content .tab-pane .project-details-updates .project-details-updates-top .info-updates .info .panmaeja-btn span {
    font-size: 11px;
    color: #ffffff;
}

.project-details-content-area .tab-content .tab-pane .project-details-updates .project-details-updates-content {
    margin-bottom: 48px;
    padding-bottom: 40px;
    border-bottom: 6px solid #e9e9ee;
}

.comment-form .contact-one__form .input-box .main-btn {
    margin-top: 10px;
    margin-right: -20px;
    margin-bottom: 60px;
}
 
.comment-form .contact-one__form .input-box textarea {
    width: 100%;
    height: 100px;
    background: #f7f7f9;
    border-radius: 10px;
    border: 0;
    padding-left: 10px;
    padding-top: 13px;
    color: #838694;
    resize: none;
    font-weight: 400;
    font-size: 16px;
}

.modal-body .input-box textarea {
    overflow: auto;
    resize: vertical;
    width: 100%;
}

.comment-one__single .main-btn {
    display: inline-block;
    font-weight: 500;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    border: 2px;
    padding: 0 20px;
    font-size: 14px;
    text-transform: uppercase;
    letter-spacing: 3px;
    line-height: 35px;
    border-radius: 10px;
/*     color: #1b1f2e; */
    cursor: pointer;
    z-index: 5;
    -webkit-transition: all 0.4s ease-out 0s;
    -moz-transition: all 0.4s ease-out 0s;
    -ms-transition: all 0.4s ease-out 0s;
    -o-transition: all 0.4s ease-out 0s;
    transition: all 0.4s ease-out 0s;
    background-color: #29f0b4;
    position: relative;
}


.singorp img {
	width:20px;
}

.singorp{
	padding-top:60px;
}

.btnbtn .blog-btn{
	padding-top:10px;
	padding-bottom:20px;
}

.project-details-content-area .tab-content .tab-pane .project-details-updates .project-details-updates-top {
    margin-top: 20px;
    padding-bottom: 0px;
    border-bottom: 0px solid #e9e9ee;
 }   
 
 .comment-one__single {

 display: flex;

 border-bottom: 1px solid #e4e4ee;
 padding-bottom: 80px;
 margin-bottom: 50px;
 }
 
 .comment-form .contact-one__form .gongzi .input-box {
    margin-top: 30px;
    margin-right: -20px;
}

#rangeGraph{
	height:10px;
	background:#e9e9ee;
}

#rangeGraph span{
	height:100%;
	width:0%;
	background:#29f0b4;
}

#blockArea {
	width: 100%;
    height: 86%;
    position: absolute;
    z-index: 99;
    background: #747373;
    opacity: 0.90;
    margin: 0px 0px 0px -20px;
    font-size: 30px;
    text-align: center;
    padding-top: 200px;
    color: #f7f7f9;
    border-radius: 10px;
    display:none;
    
}

#blockArea2 {
	width: 60%;
   	height:200px;
    position: absolute;
    z-index: 99;
    background: #747373;
    opacity: 0.30;
    margin: 0px 0px 0px 30px;
    font-size: 30px;
    text-align: center;
    padding-top: 200px;
    color: #f7f7f9;
    border-radius: 10px;
    display:none;
}

#blockArea4 {
	width: 80%;
   	height:310px;
    position: absolute;
    z-index: 99;
    background: #747373;
    opacity: 0.30;
    margin: 50px 0px 0px 30px;
    font-size: 30px;
    text-align: center;
    padding-top: 200px;
    color: #f7f7f9;
    border-radius: 10px;
    display:none;
}


#blockArea3 {
    width: 47%;
    height: 3%;
    position: absolute;
    margin-left: 236px;
    z-index: 99;
    background: white;
    opacity: 0.50;
    display: none;
}

.rrbtn {
	width: 125px;
    border: 0px;
    background: #c1fecfbd;
    height: 45px;
    border-radius: 5px;
}

.ccbtn {
	width: 125px;
    border: 0px;
    background: #ecf3ec;
    height: 45px;
    border-radius: 5px;
}

</style>

	<!-- prodetail info -->
	<section class="project-details-area pt-120 pb-190" style="padding-top: 200px;">
	<div id="pro_no" style="display: none">${pro_no}</div>
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="project-details-thumb">
                        <img src="../resources/assets/images/single-project-thumb.jpg" alt="project_thumb"> 
                        <div class="icon">
                            <i class="fa fa-heart"></i>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="project-details-content">
                          <h3 class="title" >${info[0].pro_title }</h3> 
                          <div id="blockArea">이미 마감된 프로젝트입니다!</div>
                        <div class="project-details-item">
                            <div class="item text-center">
                                <h5 class="title">
                                	<fmt:formatNumber>${info[0].pro_tp }</fmt:formatNumber>원</h5>
                                <span>총 후원금액</span>
                            </div>
                            <div class="item text-center">
                                <h5 class="title">${info[0].supporterCnt}명</h5>
                                <span>후원자</span>
                            </div>
                            <div class="item text-center">
                                <h5 class="title">${info[0].left_date }일</h5>
                                <span>남은 기간</span>
                            </div>
                        </div>
                        <div class="projects-range">
                            <div class="projects-range-content">
                                <ul>
                                    <li>달성률:</li>
                                    <li id="rate">${info[0].achievement_rate} %</li>
                                </ul>
                                <div id="rangeGraph">
                                	<span></span>
                                </div>
                                <!-- <div class="range"></div> -->
                            </div>
                        </div>
                        <div class="projects-goal">
                            <span>목표금액: 
                            	<span><fmt:formatNumber>${info[0].pro_gp}</fmt:formatNumber>원</span>
                            </span>
                        </div>
                        <div class="projects-goal">
                            <span style="margin-top: -17px;">펀딩기간: <span><span id="startDt">${info[0].pro_st_dt}</span>~${info[0].pro_ed_dt}</span></span>
                        </div>
                        <div class="project-btn mt-25" style="scroll-behavior: smooth;">
                            <a class="main-btn" href="#funding">프로젝트 후원하기</a>
                        </div>
                        <div class="project-share d-flex align-items-center">
                            <span>공유</span>
                            <ul>
                                <li><a href="#" onclick="clip(); return false;">URL</a></li>
                                <li><a href="#" id="btnFacebook" class="btn px-1"><i class="fa fa-facebook-square"></i></a></li>
                                <li><a href="#" id="btnTwitter" class="btn px-1"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#" id="btnKakao">KAKAO</a></li>
                            </ul>
                        </div>
<!--                         <div class="project-share d-flex align-items-center" style="margin-top: 7px;"> -->
<!--                             <span>좋아요</span> -->
<!--                             <ul> -->
<%--                                 <li><input type="button" value="♥" id="LikeBtn" onClick='chkLike("<%=session.getAttribute("mem_id") %>")'><i class="fa-duotone fa-heart"></i></li> --%>
<!--                             </ul> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <section class="project-details-content-area pb-110">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="tab-btns" id="funding">
                    	<div id="blockArea3"></div>
                        <ul class="nav nav-pills" id="pills-tab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">프로젝트 소개</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-contact-tab" data-toggle="pill" href="#pills-contact" role="tab" aria-controls="pills-contact" aria-selected="false">알림</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-4-tab" data-toggle="pill" href="#pills-4" role="tab" aria-controls="pills-4" aria-selected="false">커뮤니티</a>
                            </li>
                        </ul>
                    </div>
                    
                    <!-- 프로젝트 소개 -->
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                        	<div class="infoBtn">
                        		<a href="#story">스토리 소개</a>
                        		<a href="#budget">예산</a>
                        		<a href="#date">일정</a>
                        		<a href="#team">팀 소개</a>
                        		<a href="#reward">리워드 소개</a>
                        		<a href="#policy">프로젝트 정책</a>
                        	</div>
                        	<div class="project-details-content-top">
                                <p style="color: black; font-size: 25px; padding-bottom: 0px;" id="intro">프로젝트 소개</p>
                                <!-- 뷰어 시작 -->
                                <div id="pro_context">${pdvo.pro_context}</div>
                                <div id="viewer" style="display: none"></div>	
                                <script>
									var pro_context = $("#pro_context")[0].innerHTML;
									
									const editor = new toastui.Editor.factory({
										el: document.querySelector('#viewer'),
									    previewStyle: 'vertical',
									    height: '500px',
									    initialValue: "",
									    initialEditType : "wysiwyg",
									    initialValue : pro_context,
									    viewer: true,
									    
									});
									
								</script>
                            </div>
                            <div class="project-details-content-top">
                                <p style="color: black; font-size: 25px; padding-bottom: 0px;" id="story">스토리 소개</p>
                                <div id="pro_story" style="display: none;">${pdvo.pro_story}</div>
                                <div id="viewer2"></div>
                                <script>
									var pro_story = $("#pro_story")[0].innerHTML;
									
									const editor2 = new toastui.Editor.factory({
										el: document.querySelector('#viewer2'),
									    previewStyle: 'vertical',
									    height: '500px',
									    initialValue: "",
									    initialEditType : "wysiwyg",
									    initialValue : pro_story,
									    viewer: true,
									    
									});
									
								</script>
                            </div>
                            <div class="project-details-item">
                                <p style="color: black; font-size: 25px;" id="budget">프로젝트 예산</p>
                                <div class="item">
                                    <i class="flaticon-checkmark"></i>
                                    <h5 class="title">One Power Bank for Every Wrist Car</h5>
                                    <p>Lorem Ipsum nibh vel velit auctor aliquet. Aenean sollic tudin, lorem is simply free text quis bibendum.</p>
                                </div>
                                <div class="item mt-45 mb-50">
                                    <i class="flaticon-checkmark"></i>
                                    <h5 class="title">One Power Bank for Every Wrist Car</h5>
                                    <p>Lorem Ipsum nibh vel velit auctor aliquet. Aenean sollic tudin, lorem is simply free text quis bibendum.</p>
                                </div>
                                <p class="text">Nulla in ex at mi viverra sagittis ut non erat raesent nec congue elit. Nunc arcu odio, convallis a lacinia ut, tristique id eros. Suspendisse leo erat, pellentesque et commodo vel, varius in felis. Nulla mollis turpis porta justo eleifend volutpat. Cras malesuada nec magna eu blandit. Nam sed efficitur ante. Quisque lobortis sodales risus, eu dapibus dolor porta vitae. Vestibulum eu ex auctor, scelerisque velit sit amet, vehicula sapien.</p>
                            </div>
                            
                            <div class="project-details-content-top">
                                <p style="color: black; font-size: 25px;" id="date">프로젝트 일정</p>
                                <ul>
                                    <li><i class="flaticon-check"></i>프로젝트 공개일 : </li>
                                    <li><i class="flaticon-check"></i>프로젝트 마감일 : </li>
                                    <li><i class="flaticon-check"></i>리워드 제작 시기 : </li>
                                    <li><i class="flaticon-check"></i>배송정보 취합 : </li>
                                    <li><i class="flaticon-check"></i>배송 예정일 : </li>
                                </ul>
                            </div>
                            
                            <div class="project-details-item">
                                <p style="color: black; font-size: 25px;" id="team">프로젝트 팀소개</p>
                                <p>Nulla in ex at mi viverra sagittis ut non erat raesent nec congue elit. Nunc arcu odio, convallis a lacinia ut, tristique id eros. Suspendisse leo erat, pellentesque et commodo vel, varius in felis. Nulla mollis turpis porta justo eleifend volutpat. Cras malesuada nec magna eu blandit. Nam sed efficitur ante. Quisque lobortis sodales risus, eu dapibus dolor porta vitae. Vestibulum eu ex auctor, scelerisque velit sit amet, vehicula sapien.</p>
                            </div>
                            
                            <div class="project-details-item">
                                <p style="color: black; font-size: 25px;" id="reward">리워드 소개</p>
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6">
                                        <div class="project-details-thumb">
                                            <img src="../resources/assets/images/project-details-2.jpg" alt="리워드 사진">
                                        </div>
                                    </div>
                                </div>
                                
                                <c:forEach var="reward" items="${reward}" step="1">
                                <p class="text"><i class="flaticon-check"></i>
                                	${reward.reward_title } <br>
                                	${reward.reward_content } <br>
                                	${reward.reward_price }원 <br>
                                </p>
                                </c:forEach>
                                
                            </div>
                            
                            <div class="project-details-item" id="policy">
                                <p style="color: black; font-size: 25px;">프로젝트 정책</p>
                                <div class="item">
                                    <i class="flaticon-checkmark"></i>
                                    <h5 class="title">프로젝트 정책1</h5>
                                    <p>${intro[0].pro_policy }</p>
                                </div>
                            </div>
                                
                        </div>
                       
                        
                        <!-- 알림 -->
                        <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab">

                        	<!-- 댓글 작성하기 판매자만 -->
                        	<c:choose>
                        	<c:when test="${pdvo.mem_id == sessionScope.mem_id}">
                			 <div class="comment-form">
                               <form role="form" class="contact-one__form" name="snfr" method="post">
                               
	                               <input type="hidden" name="pro_no" value="${pdvo.pro_no }">
						<%--         	<input type="hidden" name="member_id" value=${sessionScope.member_id }> --%>
						        	<input type="hidden" name="reply_category" value="3">
						        	<input type="hidden" name="reply_classify" value="0">
					        	
                                   <div class="row">
                                       <div class="col-lg-12">
                                      	 <div class="gongzi">
                                           <div class="input-box">
                                               <textarea placeholder="공지를 작성해주세요" name="reply_content"></textarea>
                                           </div>
                                          </div>
                                       </div><!-- /.col-lg-12 -->
                                       <div class="col-lg-12 text-left">
	                                        <div class="comment-one__single">
		                                        <div class="btnbtn">
		                                            <div class="blog-btn">
				                                       <button class="main-btn" type="button" onclick="sncheck();">작성완료</button>
				                                    </div>
			                                    </div>
		                                    </div>
                                       </div>
                                   </div>
                               </form>
                          	</div>
                          	</c:when>
                          	</c:choose>
                       	<!-- 댓글 작성하기 --> 
	                       	
	                       	
                        	<c:forEach var="sn" items="${sellNoticeList }">
	                            <div class="project-details-updates">
	                                <div class="project-details-updates-top">
	                                    <div class="info-updates d-block d-sm-flex justify-content-between align-items-center">
	                                        <div class="info">
	                                            <img src="../resources/assets/images/info.jpg" alt="">
	                                          	 <span>by <span>${pdvo.mem_id }<span>${sn.reply_date }</span></span></span>
	                                  			<div class="panmaeja-btn">
						                            <span>판매자</span>
						                        </div>
	                                        </div>
	                                    </div>
	                                </div>
	                                <div class="project-details-updates-content">
	                                    <p class="text">
	                                    		${sn.reply_content }
	                              		</p>
<!-- 	                                    <div class="project-updates-thumb mt-50"> -->
<!-- 	                                    	첨부파일은 나중에하기 -->
<!-- 	                                        <img src="../resources/assets/images/project-updates-thumb-1.jpg" alt=""> -->
<!-- 	                                    </div> -->
	                                </div>
	                            </div>
                            </c:forEach>
                            
				            
                        </div>
                        
                     <!-- 알림 -->
                     
                     <!-- 커뮤니티 -->
                     
                        <div class="tab-pane fade" id="pills-4" role="tabpanel" aria-labelledby="pills-4-tab">
                            <div class="comment-one mt-50">
                           	
                           		<!-- 댓글 작성하기 -->
                           			 <div class="comment-form">
		                                <form role="form" class="contact-one__form" name="urfr" method="post">
		                                
		                                	<input type="hidden" name="pro_no" value="${pdvo.pro_no }">
		                                	<input type="hidden" name="mem_id" value="${sessionScope.mem_id }">
		                                	<input type="hidden" name="reply_classify" value="0">
								<%--         	<input type="hidden" name="member_id" value=${sessionScope.member_id }> --%>
								        	
		                                    <div class="row">
		                                    	<div class="col-lg-12">
		                                    		<input type="radio" id="pd_qna" name="reply_category" value="0" checked/>
		                                    			<label for="moonee">구매문의</label>&nbsp;&nbsp;&nbsp;
		                                    		<input type="radio" id="pd_cheer" name="reply_category" value="1"/>
		                                    			<label for="cheerup">응원글</label>&nbsp;&nbsp;&nbsp;
		                                    		<input type="radio" id="pd_review" name="reply_category" value="2"/>
		                                    			<label for="hookireview">후기</label>&nbsp;&nbsp;&nbsp;
		                                    	</div>
		                                    	
		                                        <div class="col-lg-12">
		                                            <div class="input-box">
		                                                <textarea placeholder="댓글을 작성해주세요" name="reply_content"></textarea>
		                                            </div>
		                                        </div>
		                                        <div class="col-lg-12 text-left">
		                                            
		                                            
		                                            <div class="comment-one__single">
		                                            	<div class="btnbtn">
				                                            <div class="blog-btn">
						                                        <button class="main-btn" type="button" onclick="urcheck();">작성완료</button>
						                                    </div>
					                                    </div>
				                                    </div>
		                                        </div>
		                                        
		                                    </div>
		                                </form>
		                           	</div>
		                       	<!-- 댓글 작성하기 --> 
		                       	
		                       	<!-- 회원댓글 -->
		                       	<c:forEach var="ur" items="${userReplyList }">
		                       		<div class="comment-one__single">
	                                    <div class="comment-one__image">
	                                    	<!-- 나중에 멤버랑 합치면 쪼인해서 프사올리기 -->
	                                        <img src="../resources/assets/images/comment-2.2.jpg" alt="">
	                                    </div>
	                                    <div class="comment-one__content">
	                                        <h3>${ur.mem_id } <span class="comment-one__date">${ur.reply_date }</span></h3>
													 
	                                        <div class="blog-details__content">
	                                        
		                                        <c:choose>
		                                        	<c:when test="${ur.reply_category eq '0' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o"></i> 구매문의</a>
							                            </div>
						                            </c:when>
		                                        	<c:when test="${ur.reply_category eq '1' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o"></i> 응원글</a>
							                            </div>
						                            </c:when>
		                                        	<c:when test="${ur.reply_category eq '2' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o"></i> 후기</a>
							                            </div>
						                            </c:when>
					                            </c:choose>
					                            <c:choose>
					                            	<c:when test="${sessionScope.mem_id ne ur.mem_id }">
						                            	<a href="#" data-toggle="modal" data-target="#reportreplyMo" onclick="javascript:transferPno(${ur.reply_no});">
															신고하기
														</a>
					                            	</c:when>
					                            	<c:when test="${sessionScope.mem_id eq ur.mem_id }">
					                            		 <div class="blog-one__meta">
						                            		<a>내가 쓴 댓글</a>
						                            	</div>
					                            	</c:when>
					                            	
					                            </c:choose>
					                           
				                            </div>
	                                        <p>${ur.reply_content }</p>
	                                    </div>
	                                    
		                                <!-- 답글쓰기 버튼 관리자만 보이게 -->
	                                    <div class="blog-btn">
<!-- 	                                        <a href="javascript:onDisplay()" class="main-btn">답글쓰기 </a> -->
	                                        <a href="#" class="rereplymd main-btn" data-toggle="modal" data-target="#moaModal" onclick="javascript:transferRno(${ur.reply_no});">
												답글쓰기
											</a>
	                                    </div>
		                                <!-- 답글쓰기 버튼 관리자만 보이게 -->
	                                </div>
	                                
	                               
                                <!-- 판매자 답글 -->
                                <c:if test="${ur.reply_classify eq '1' }">
	                                <div class="comment-one__single">
	                                    <div class="comment-one__image">
	                                       
	                                    </div>
	                                    <div class="comment-one__content">
	                                        <h3>${pdvo.mem_id }</h3>
	                                        <div class="blog-details__content">
		                                        <div class="blog-one__meta">
					                                <a href="#"><i class="fa fa-user-o"></i> 답글</a>
					                            </div>
				                            </div>
	                                        <p>${ur.rereply_content }</p>
	                                    </div>
	                                </div>
                                </c:if>
								<!-- 판매자 답글 -->
                       	
                                </c:forEach>
		                       	<!-- 회원댓글 -->
		                       	
		                       	
		                       	
                              

                            </div><!-- /.comment-one -->
                          
                        </div>
                     <!-- 커뮤니티 -->
                     
                     </div>
                     <div class="singorp">
	                     <img src="../resources/assets/images/singo.png" alt="reportsingo">
	                     <a href="#" id="rePort">이 프로젝트 신고하기</a>
                     </div>
                </div>
                
				<!-- 사이드바 - 리워드 선택 reward -->
                <div class="col-lg-4 col-md-7 col-sm-9">                	
                    <div class="project-details-sidebar">                    
                        <div class="project-details-park mt-30 box" style="text-align: center; padding: 35px;">
                        	<div id="blockArea2"></div>
                            <h4 class="title" style="margin-top: 25px;">리워드 없이 후원하기</h4>
                            <a class="main-btn" id="withoutReward" style="width: 155px;">후원하기</a>
                        </div>	
                       
                        <c:forEach var="reward" items="${reward}" step="1">
                        	<div id="blockArea4"></div>
	                        <div class="project-details-park mt-30 box" style="text-align: center; padding: 35px;">
	                            <h4 class="title">${reward.reward_title}</h4>
	                            <ul>
	                                <li>${reward.reward_content}</li>
	                                <li><span>가격</span> ${reward.reward_price}원</li>
	                                <li><span>재고</span> ${reward.reward_stock}개</li>
	                            </ul>
	                            <a class="main-btn" href="/order/or_main?pro_no=${reward.pro_no }&reward_no=${reward.reward_no}" style="width: 155px;">선택</a>
	                        </div>
                        </c:forEach>                      
                    </div>
                </div>
				<!-- 사이드바 - 리워드 선택 -->
            </div>
        </div>
    </section>
    

    
    
	<!-- 답글 모달-->
	<div class="modal fade" id="moaModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
	      <div class="modal-content" style="height: 420px; width: 630px;">
	        <div class="modal-header">
	          <h5 class="modal-title" id="exampleModalLabel">답글쓰기</h5>
	          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">x</span>
	          </button>
	        </div>
	        
			<div class="modal-body">
		         <!-- 답글 작성하기 판매자만 -->
	   			 <div class="comment-form">
	                  <form role="form" class="contact-one__form" name="rrfr" method="post">
	                  
	                   <input type="hidden" id="reply_no" name="reply_no" >
						<input type="hidden" name="pro_no" value="${param.pro_no }">
	                   <input type="hidden" name="reply_classify" value="1">
						
	                      <div class="row">
	                          <div class="col-lg-12">
	                          	<div class="rere">
	                              <div class="input-box">
	                                  <textarea placeholder="답글을 작성해주세요" name="rereply_content" style="width: 590px; height: 250px;"></textarea>
	                              </div>
	                            </div>
	                          </div>
	                          
	                          <div class="col-lg-12 text-left">
	                            <div class="comment-one__single">
	                                <div class="blog-btn" style="margin: 12px 20px;">
			                             <button class="rrbtn" type="button" onclick="rrcheck();">작성완료</button>
			                             <button class="ccbtn" type="button" data-dismiss="modal">취소</button>
	                          		</div>
	                         	</div>
	                          </div>
	                      </div>
	                  </form>
	             	</div>
	  				<!-- 댓글 작성하기 -->
			</div>
	        
<!-- 		        <div class="modal-footer"> -->
<!-- 		          <button class="btn btn-primary" type="button" data-dismiss="modal">Cancel</button> -->
<!-- 		        </div> -->
		        
			</div>
		</div>
	</div>   
    
    
    <!-- modal -->
    <div id="dark"></div>
<%--     <%@ include file="info_rewardMo.jsp" %> --%>
<%--     <%@ include file="info_reportMo.jsp" %> --%>
<%--     <%@ include file="info_reportMo2.jsp" %> --%>
    
    
<!-- 	<!-- 푸터 --> -->
<%-- 	<%@ include file="../include/footer.jsp" %> --%>
	