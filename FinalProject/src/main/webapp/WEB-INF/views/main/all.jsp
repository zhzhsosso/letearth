<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>	
	<script>
	$(document).ready(function() {		
		var tagObj = $(".tags");
				debugger;
		for(var i=0; i<tagObj.length; i++){
			var tagText = $(".tags")[i].innerHTML;	
		    tagText = tagText.replaceAll(',', ' #');
		    tagText = "#" + tagText;    
		    $(".tags")[i].innerHTML = tagText;
		}
	})
	</script>
	
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
		
		.explore-projects-item .explore-projects-content .item > span {
		    background: #A4AC85;
		    line-height: 20px;
		    padding: 0 7px;
		    font-size: 11px;
		    font-weight: 700;
		    text-transform: uppercase;
		    letter-spacing: 1px;
		    color: #fff;
		    margin: 10px;
		    border-radius: 0.2rem;
		}
	</style>
	

	<!-- 광고 배너 -->
	<section class="page-title-area" style="background-image: url(../resources/assets/images/ad.png);">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="page-title-content">
<!-- 	                    <h3 class="title">광고 배너 자리</h3> -->
	                </div>
	            </div>
	        </div>
	    </div>
	</section>
    <!-- 광고 배너 -->


    <!-- 신규 프로젝트 -->
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 90px; background: white;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>Let Earth에서 만날 수 있는</span>
                        <h3 class="title">신규 프로젝트</h3>
                    </div>
                </div>
            </div>
    
            <div class="row">

			<c:forEach var="i" begin="0" end="5" step="1">
         	   	<c:set var="pro" value="${projectList[i] }"/>
         	   	
                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="../resources/upload/${pro.pro_thum }" alt="LetEarth" style="width: 370px; height: 370px;">
                            <a href="/prodetail/info?pro_no=${pro.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content" style="height: 305px;">
                        	<div class="item d-flex align-items-center">
                            	<p><i class="fa fa-clock-o"></i></p>
                        		<p>프로젝트 종료까지</p>&nbsp;
                                <span>D - ${pro.left_date}</span>
                            </div>  	
                                                   
                            <a href="/prodetail/info?pro_no=${pro.pro_no}">
            					<h3>${pro.pro_title }</h3>
            				</a>
            				
                            <div class="projects-range">
                                <div class="projects-range-content">
                                    <ul>
                                        <li>달성률:</li>
                                        <li id="rate">${pro.achievement_rate}%</li>
                                    </ul>
                                    <div id="rangeGraph">
                                		<span style="width:${pro.achievement_rate}%"></span>
                               		</div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${pro.pro_tp }" pattern="#,###"/></span> 원</span><br>
                                <span>목표 금액: <span><fmt:formatNumber value="${pro.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                            <div>
                            	<span class="tags" style="color: #A4AC85;">${pro.tags }</span>
                            </div>
                        </div>
                    </div>
                </div>	
                   </c:forEach> 
               </div>   
            </div>
    </section>
    <!-- 신규 프로젝트 -->



    <!-- 인기 프로젝트  -->
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 325px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span style="color: #414934;">Let Earth에서 만날 수 있는</span>
                        <h3 class="title">인기 프로젝트</h3>
                    </div>
                </div>
            </div>
            
            <div class="row">
            
            <c:forEach var="i" begin="0" end="5" step="1">
         	   	<c:set var="pl" value="${popularList[i] }"/>

                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 280px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="../resources/upload/${pl.pro_thum }" alt="LetEarth_popularList" style="width: 370px; height: 370px;">
                            <a href="/prodetail/info?pro_no=${pl.pro_no }"><i class="fa fa-heart"></i></a>
                        </div>
                        <div class="explore-projects-content" style="height: 305px;">
                        	<div class="item d-flex align-items-center">
                            	<p><i class="fa fa-clock-o"></i></p>
                        		<p>프로젝트 종료까지</p>&nbsp;
                                <span>D - ${pl.left_date}</span>
                            </div> 
                        	
                            <a href="/prodetail/info?pro_no=${pl.pro_no }">
                            	<h3 style="font-size: 26px;">${pl.pro_title }</h3>
                            </a>
                            <div class="projects-range">
                                <div class="projects-range-content">
                                    <ul>
                                        <li>달성률:</li>
                                        <li id="rate">${pl.achievement_rate}%</li>
                                    </ul>
                                    <div id="rangeGraph">
                                		<span style="width:${pl.achievement_rate}%"></span>
                               		</div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${pl.pro_tp }" pattern="#,###"/></span> 원</span>
                                <span>목표 금액: <span><fmt:formatNumber value="${pl.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                            <div>
                            	<span class="tags" style="color: #A4AC85;">${pl.tags}</span>
                            </div>
                        </div>
                    </div>
                </div>
					</c:forEach>
              </div>      
            </div>
    </section>
    <!-- 인기 프로젝트 -->
    


	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
