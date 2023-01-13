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
  
<script type="text/javascript">


// 공유하기 - Kakao
function shareKakao() {
    Kakao.init('d34848fa1deecaf897fe27c8be1709c3');        
 
    Kakao.Link.createDefaultButton({
        container : '#btnKakao',
        objectType : 'text',
        text:
        	// 지금은 text 타입으로 했으나 로고 이미지 생성 후 이미지 있는 타입으로 변경하기
            'Let Earth 지구하자',
          link: {
            // mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'http://localhost:8080/prodetail/info?pro_no=2',
          }
    });
}

// 공유하기 -Twitter
function shareTwitter() {
	// alert('twitter');
    var sendText = "LET EARTH" 
    var sendUrl = "http://itwillbs11.cafe24.com/prodetail/pro_no=<%=request.getParameter("pro_no")%>"
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);  //Twitter에 전송 정보 파라미터 삽입
}
 
// 공유하기 - Facebook
function shareFacebook() {
	// alert('facebook');
    var sendUrl = "http://itwillbs11.cafe24.com/prodetail/pro_no=<%=request.getParameter("pro_no")%>";    
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);       //Facebook에 전송 정보 파라미터 삽입
} 

$(window).scroll(function() {
	  sessionStorage.scrollTop = $(this).scrollTop();
	});

$(document).ready(function() {
	if(sessionStorage.scrollTop != "undefined") {
	    $(window).scrollTop(sessionStorage.scrollTop);
	}
	
    //button click action
    $("#btnTwitter").click(function() {    
        shareTwitter();
    });
    
    $("#btnFacebook").click(function() {
        shareFacebook();
    });
    
    $("#btnKakao").click(function() {
    	shareKakao();
    });
    
    //console.log(${info[0].achievement_rate})
    
    if(${info[0].achievement_rate} >= 100){
    	 $("#rangeGraph span").css("width", "100%")
    }
    else{
    	 $("#rangeGraph span").css("width", ${info[0].achievement_rate}+"%")
    }
    
 	// 마감된 프로젝트
    if(${info[0].left_date } <= 0){
    	$("#blockArea").css("display", "block")
    	$("#blockArea")[0].innerHTML = "마감된 프로젝트 입니다!";    	
    	$("#blockArea3").css("display", "block")
    } 

    // 오픈예정 프로젝트
    var startPjtDt = new Date($("#startDt")[0].innerHTML);
    var today = new Date();
    
    if(startPjtDt > today){
    	$("#blockArea").css("display", "block")
    	$("#blockArea")[0].innerHTML = "오픈 예정인 프로젝트 입니다!";    	
    }
    
});

	// 공유하기 - url
	function clip(){
	
	    var url = '';   
	    var textarea = document.createElement("textarea");  
	    
	    document.body.appendChild(textarea); 
	    url = window.document.location.href; 
	    textarea.value = url; 
	    textarea.select();
	    document.execCommand("copy");
	    document.body.removeChild(textarea);
	    
	    swal('주소가 복사되었습니다!',"",'success');
	}
	
	// 판매자공지 폼
	function sncheck(){
		if(document.snfr.reply_content.value == ""){
			swal("내용을 입력하세요",'','info');
			return false;
		}
		if(confirm("공지를 등록하시겠습니까?") == true){
			document.snfr.submit();
		}else{
			return false;
		}
	}
	
	// 사용자댓글 폼
	function urcheck(){
		var mem_id = '<%=session.getAttribute("mem_id") %>';
		if(mem_id == 'null'){
			swal('로그인 후 이용해주세요!','댓글 작성은 회원만 가능합니다','info').then(function(){
				location.href='/member/login';
			}) 
		} else{
			if(document.urfr.reply_content.value == ""){
				swal("내용을 입력하세요",'','info');
				return false;
			}
			document.urfr.submit();
		}
	}
	
	
	
	// 모달창 데이터 전달 - 답글
	function transferRno(reply_no){
		$('.modal-body #reply_no').val(reply_no);
	}
	
	//모달창 데이터 전달 - 댓글 신고하기
	function transferPno(reply_no){
		$('#reportreplyMo #reply_no').val(reply_no);
	}
	
	//판매자답글 폼
	function rrcheck(){
		if(document.rrfr.rereply_content.value == ""){
			swal("내용을 입력하세요",'','info');
			return false;
		}
		if(confirm("답글을 등록 하시겠습니까?") == true){
			document.rrfr.submit();
		}else{
			return false;
		}
	}

	// 좋아요 
	function chkLike(mem_id){	
		// alert('좋아요 클릭');
		if(mem_id !== "null"){		
			var pro_no = $("#pro_no")[0].innerHTML;			
			$.ajax({
				url:"/prodetail/findLike?pro_no="+pro_no+"&mem_id="+mem_id,
				type:'get',
				dataType: "html",
				async: false,			// ajax에서 강제로 순서대로 처리하게 만드는...?
				success:function(result){
						if(result == 1){
							swal('좋아하는 프로젝트에서 삭제되었습니다!','','info');
							deleteLikey(pro_no, mem_id);
						}
						else{
							// likey 테이블에 Insert
							swal('좋아하는 프로젝트에 추가되었습니다!','좋아하는 프로젝트 리스트는 마이페이지에서 확인해주세요','success');
							insertLikey(pro_no, mem_id);							
						}
				},
				error:function(){
					alert("실패");
				}
			});
		}
		else{
			// 로그인 안한 경우
			swal('로그인 후 이용 가능합니다','','warning').then(function(){
				location.href="/member/login"				
			});

		}
		
	}
	
	function insertLikey(pro_no, mem_id){
		$.ajax({
			url:"/prodetail/insertLike?pro_no="+pro_no+"&mem_id="+mem_id,
			type:'get',
			dataType: "html",
			async: false,			// ajax에서 강제로 순서대로 처리하게 만드는...?
			success:function(result){
				//alert("좋아요 눌러짐......");
			},
			error:function(){
				alert("실패");
			}
		});
	}
	
	function deleteLikey(pro_no, mem_id){
		$.ajax({
			url:"/prodetail/deleteLike?pro_no="+pro_no+"&mem_id="+mem_id,
			type: 'get',
			dataType: "html",
			async: false,
			success:function(result){
				//alert("좋아요 취소 완");
			},
			error:function(){
				alert("에러");
			}
		});
	}
	
</script>          
          
<style>
#contentArea{
	height:1500px;
	overflow: auto;
}
		
#contentArea::-webkit-scrollbar {
	width: 10px;
	  }
	  	
#contentArea::-webkit-scrollbar-thumb {
	background-color: #B6AD90;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
	}
	  	
#contentArea::-webkit-scrollbar-track {
	background-color: none;
	border-radius: 10px;
	box-shadow: inset 0px 0px 5px white;
	}

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
	    background: #B6AD90;
	    color: white;
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
        background: #6F7B63;
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
    background-color: #A4AC85;
    position: relative;
}


.singorp img {
	width:20px;
}

.singorp{
	padding-top:0px;
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
	background:#A4AC85;
}

#blockArea {
	width: 100%;
    height: 100%;
    position: absolute;
    z-index: 99;
    background: #829c88;
    opacity: 0.95;
    margin: 0px 0px 0px -20px;
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
        	<div class="titleArea" style="margin-bottom: 30px;">
            	<h2 class="title">${info[0].pro_title }</h2> 
            </div>
<!--             <div> -->
<%--             	<c:if test="${pdvo.cat_no eq '1'}"> --%>
<!--             		<p>카테고리 : 클래스</p> -->
<%--             	</c:if> --%>
<%--             	<c:if test="${pdvo.cat_no eq '2'}"> --%>
<!--             		<p>카테고리 : 상품</p> -->
<%--             	</c:if> --%>
<!--             </div> -->
            <div class="row">
                <div class="col-lg-7">
                    <div class="project-details-thumb">
                        <img src="../resources/upload/${pdvo.pro_thum }" alt="project_thumb"> 
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="project-details-content">
                          <div id="blockArea">이미 마감된 프로젝트입니다!</div>
                        <div class="project-details-item">
                            <div class="item text-center">
                                <h5 class="title" style="color: #6F7B63;">
                                	<fmt:formatNumber>${info[0].pro_tp }</fmt:formatNumber>원</h5>
                                <span>총 후원금액</span>
                            </div>
                            <div class="item text-center">
                                <h5 class="title" style="color: #6F7B63;">${info[0].supporterCnt}명</h5>
                                <span>후원자</span>
                            </div>
                            <div class="item text-center">
                                <h5 class="title" style="color: #6F7B63;">${info[0].left_date }일</h5>
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
                            	<span style="color: #A4AC85;"><fmt:formatNumber>${info[0].pro_gp}</fmt:formatNumber>원</span>
                            </span>
                        </div>
                        <div class="projects-goal">
                            <span style="margin-top: -17px;">펀딩기간: <span style="color: #A4AC85;"><span id="startDt" style="color: #A4AC85;">${info[0].pro_st_dt}</span>~${info[0].pro_ed_dt}</span></span>
                        </div>
                        
                        <div class="project-btn mt-25" style="scroll-behavior: smooth;">
                            <a class="main-btn" href="#funding" style="background: #A4AC85;">프로젝트 후원하기</a>
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
                        <div class="project-share d-flex align-items-center" style="margin-top: 7px;">
                            <span>좋아요</span>
							<div class="icon">
                            	<a onClick='chkLike("<%=session.getAttribute("mem_id") %>")'><i class="fa fa-heart" style="color: #A4AC85;"></i></a>
                        	</div>
                    	</div>
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
                        		<a href="#intro">프로젝트 소개</a>
                        		<a href="#story">스토리 소개</a>
                        		<a href="#budget">예산</a>
                        		<!-- <a href="#date">일정</a>  -->
                        		<a href="#team">팀 소개</a>
                        		<a href="#reward">리워드 소개</a>
                        		<a href="#policy">프로젝트 정책</a>
                        	</div>
                        	
                        	<div id="contentArea">
                        	<div class="project-details-content-top">
                                <h3 id="intro" style="margin-top: 60px; margin-bottom: 30px; color: #B6AD90;"><i class="flaticon-checkmark"></i> 프로젝트 소개</h3>
                                
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
                            
                            <hr>
                            
                            <div class="project-details-content-top">
                                <h3 id="story" style="margin-top: 60px; color: #B6AD90;"><i class="flaticon-checkmark"></i> 스토리 소개</h3>
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
                            
                            <hr>
                            
                            <div class="project-details-item">
                                <h3 style="margin-top: 60px; margin-bottom: 30px; color: #B6AD90;" id="budget"><i class="flaticon-checkmark"></i> 프로젝트 예산</h3>
                                <div class="item" style="margin-bottom: 75px; padding-left: 5px;">
                                    <p>저희에게 후원해주신 소중한 금액으로는 후원자 님들에게 보여들릴 소중한 선물들, <br>
									안전하게 받아보실 수 있도록 포장재 구입비 (렛어스 정책 상 포장지는 모두 일반 포장지가 아닌 생분해가 되는 포장지를 사용합니다), <br>
									직원들에게 에너지가 되어 줄 인건비, <br>
									그 외 배송비 및 펀딩 수수료로 사용될 예정입니다.</p>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="project-details-item">
                                <h3 style="margin-top: 60px; margin-bottom: 30px; color: #B6AD90;" id="team"><i class="flaticon-checkmark"></i> 프로젝트 팀소개</h3>
                                <div style="margin-bottom: 75px;">
                                	<p style="text-align: center; font-size: 20px; line-height: 35px; color: #838694;">${pdvo.par_intro }</p>
                                </div>
                            </div>
                            
                            <hr>
                            
                            <div class="project-details-item">
                                <h3 style="margin-top: 60px; margin-bottom: 30px; color: #B6AD90;" id="reward"><i class="flaticon-checkmark"></i>리워드 소개</h3>
                                <div style="text-align: center; margin-bottom: 75px;">
	                                <c:forEach var="reward" items="${reward}" step="1">
		                                <p class="text" style="font-size: 20px; color: #838694; line-height: 30px; font-weight: 400; margin: 16px;"><i class="flaticon-check"></i>
		                                	${reward.reward_title } <br>
		                                	${reward.reward_content } <br>
		                                	${reward.reward_price }원 <br>
		                                </p>
	                                </c:forEach>
                                </div>
                                
                            </div>
                            
                            <hr>
                            
                            <div class="project-details-item" id="policy">
                                <h3 style="margin-top: 60px; margin-bottom: 30px; color: #B6AD90;" id="reward"><i class="flaticon-checkmark"></i>프로젝트 정책</h3>
                                <div style="margin-bottom: 100px;">
                                    <p style="font-size: 18px; line-height: 30px; color: #414934">${pdvo.pro_policy }</p>
                                </div>
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
				                                       <button class="main-btn" type="button" onclick="sncheck();" style="background: #A4AC85;">작성완료</button>
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
	                                            <img src="../resources/upload/${sn.mem_profile}" alt="" width="65px;" height="65px;">
	                                          	 <span>by <span>${pdvo.mem_id }<span style="color: #6F7B63;">${sn.reply_date }</span></span></span>
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
		                                    		<input type="radio" id="pd_qna" name="reply_category" value="0" style="accent-color: #A4AC85;" checked/>
		                                    			<label for="moonee">구매문의</label>&nbsp;&nbsp;&nbsp;
		                                    		<input type="radio" id="pd_cheer" name="reply_category" value="1" style="accent-color: #A4AC85;"/>
		                                    			<label for="cheerup">응원글</label>&nbsp;&nbsp;&nbsp;
		                                    		<input type="radio" id="pd_review" name="reply_category" value="2" style="accent-color: #A4AC85;"/>
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
						                                        <button class="main-btn" type="button" onclick="urcheck();" style="background: #A4AC85;">작성완료</button>
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
	                                        <img src="../resources/upload/${ur.mem_profile }" alt="${ur.mem_profile }" style="width: 165px;">
	                                    </div>
	                                    <div class="comment-one__content">
	                                        <h3>${ur.mem_id } <span class="comment-one__date" style="color: #6F7B63;">${ur.reply_date }</span></h3>
													 
	                                        <div class="blog-details__content">
	                                        
		                                        <c:choose>
		                                        	<c:when test="${ur.reply_category eq '0' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o" style="color: #89af64;"></i> 구매문의</a>
							                            </div>
						                            </c:when>
		                                        	<c:when test="${ur.reply_category eq '1' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o" style="color: #89af64;"></i> 응원글</a>
							                            </div>
						                            </c:when>
		                                        	<c:when test="${ur.reply_category eq '2' }">
				                                        <div class="blog-one__meta">
							                                <a><i class="fa fa-user-o" style="color: #89af64;"></i> 후기</a>
							                            </div>
						                            </c:when>
					                            </c:choose>
					                            <c:choose>
					                            	<c:when test="${sessionScope.mem_id ne ur.mem_id }">
					                            		<i class="fa fa-bomb" style="width: 14px;"></i>
						                            	<a href="#" data-toggle="modal" data-target="#reportreplyMo" onclick="javascript:transferPno(${ur.reply_no});" style="color: #828d77; font-size: 14px;">
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
		                                <c:if test="${sessionScope.mem_id eq pdvo.mem_id}">
	                                    <div class="blog-btn">
<!-- 	                                        <a href="javascript:onDisplay()" class="main-btn">답글쓰기 </a> -->
	                                        <a href="#" class="rereplymd main-btn" data-toggle="modal" data-target="#moaModal" onclick="javascript:transferRno(${ur.reply_no});">
												답글쓰기
											</a>
	                                    </div>
	                                    </c:if>
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
					                                <a href="#"><i class="fa fa-user-o" style="color: #e1bfa2;"></i> 판매자 답글</a>
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
                     
                     <hr>
                     <div class="singorp">
	                     <img src="../resources/assets/images/singo.png" alt="reportsingo">
	                     <a href="#" id="rePort" style="color: #828d77;">이 프로젝트 신고하기</a>
                     </div>
                     <hr>
                     
                </div>
                
				<!-- 사이드바 - 리워드 선택 reward -->
                <div class="col-lg-4 col-md-7 col-sm-9">                	
                    <div class="project-details-sidebar">                    
                        <div class="project-details-park mt-30 box" style="text-align: center; padding: 35px; background: #d7d1b9;">
<!--                         	<div id="blockArea2"></div> -->
                            <h4 class="title" style="margin-top: 25px; color: white; height: 30px;">리워드 없이 후원하기</h4>
                            
                            <jsp:useBean id="now" class="java.util.Date" />
							<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                            <c:choose>
	                            <c:when test="${info[0].left_date < 0 }">
	                            	<a class="main-btn" style="width: 155px; background-color: #A4AC85;">마감</a>
	                            </c:when>
	                            
	                            <c:when test="${info[0].left_date > 0 }">
	                            	<c:if test="${pdvo.pro_st_dt <= today }">
	                            		<a class="main-btn" id="withoutReward" style="width: 155px; background-color: #A4AC85;">후원하기</a>
	                            	</c:if>
	                            	<c:if test="${pdvo.pro_st_dt > today }">
	                            		<a class="main-btn" style="width: 155px; background-color: #A4AC85;">오픈예정</a>
	                            	</c:if>
	                            </c:when>
                            </c:choose>
                        </div>	
                       
                        <c:forEach var="reward" items="${reward}" step="1">
<!--                         	<div id="blockArea4"></div> -->
	                        <div class="project-details-park mt-30 box" style="text-align: center; padding: 35px; background: #d7d1b9;">
	                            <h4 class="title" style="color: white;">${reward.reward_title}</h4>
	                            <ul>
	                                <li>${reward.reward_content}</li>
	                                <li><span>가격</span> ${reward.reward_price}원</li>
	                                <li><span>재고</span> ${reward.reward_stock}개</li>
	                            </ul>
	                            <c:choose>
		                            <c:when test="${info[0].left_date < 0 }">
		                            	<a class="main-btn" style="width: 155px; background-color: #A4AC85;">마감</a>
		                            </c:when>
		                            
		                            <c:when test="${info[0].left_date > 0 }">
		                            	<c:if test="${pdvo.pro_st_dt <= today && reward.reward_stock != 0}">
		                            		 <a class="main-btn" href="/order/or_main?pro_no=${reward.pro_no }&reward_no=${reward.reward_no}" style="width: 155px; background-color: #A4AC85;">선택</a>
		                            	</c:if>
		                            	<c:if test="${pdvo.pro_st_dt <= today && reward.reward_stock == 0}">
		                            		 <a class="main-btn" style="width: 155px; background-color: #A4AC85;">품절</a>
		                            	</c:if>
		                            	<c:if test="${pdvo.pro_st_dt > today }">
		                            		<a class="main-btn" style="width: 155px; background-color: #A4AC85;">오픈예정</a>
		                            	</c:if>
		                            </c:when>
                            	</c:choose>
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
    <%@ include file="info_rewardMo.jsp" %>
    <%@ include file="info_reportMo.jsp" %>
    <%@ include file="info_reportMo2.jsp" %>
    
    
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	