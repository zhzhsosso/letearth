<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
	<script type="text/javascript">
	
	console.log();
	
	
	</script>

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
		
	</style>
	

	<!--====== PAGE TITLE PART START : 광고 배너 ======-->
	
	<section class="page-title-area bg_cover" style="background-image: url(../resources/assets/images/page-title-bg.jpg);">
	    <div class="container">
	        <div class="row">
	            <div class="col-lg-12">
	                <div class="page-title-content">
	                    <h3 class="title">광고 배너 자리</h3>
	                </div>
	            </div>
	        </div>
	    </div>
	</section>

    <!--====== PAGE TITLE PART ENDS ======-->


    <!--====== EXPLORE PROJECTS PART START : 신규 프로젝트 ======-->
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 325px;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>Let Earth에서 만날 수 있는</span>
                        <h3 class="title">신규 프로젝트</h3>
                    </div>
                </div>
            </div>
    
            <div class="row justify-content-center">

			<c:forEach var="i" begin="0" end="5" step="1">
         	   	<c:set var="pro" value="${projectList[i] }"/>
         	   	
                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="${pro.pro_thum }" alt="LetEarth">
                            <a href="/prodetail/info?pro_no=${pro.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content">
                        	<div class="item d-flex align-items-center">
                        	<p><i class="fa fa-clock-o"></i></p><p>마감까지</p>
                        	</div>	
                            <div class="item d-flex align-items-center">
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
                                		<span></span>
                               		</div>
<!--                                     <div class="range"></div> -->
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${pro.pro_tp }" pattern="#,###"/></span> 원</span>
                                <span>목표 금액: <span><fmt:formatNumber value="${pro.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                            <div>
                            	<span>태그 : ${pro.tags }</span>
                            </div>
                        </div>
                    </div>
                </div>	
                   </c:forEach> 
               </div>   
            </div>
    </section>
    
    <!--====== EXPLORE PROJECTS PART ENDS ======-->



    <!--====== EXPLORE PROJECTS PART START : 인기 프로젝트 ======-->
    
<!--     썸네일. 타이틀 상세정보로 가게 하는 페이지 링크 걸어야 함 @@@ -->  
    
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 325px;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span>Let Earth에서 만날 수 있는</span>
                        <h3 class="title">인기 프로젝트</h3>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
            
            <c:forEach var="i" begin="0" end="5" step="1">
         	   	<c:set var="pl" value="${popularList[i] }"/>

                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="${pl.pro_thum }" alt="LetEarth_popularList">
                            <a href="/prodetail/info?pro_no=${pl.pro_no }"><i class="fa fa-heart"></i></a>
                        </div>
                        <div class="explore-projects-content">
                        	<div class="item d-flex align-items-center">
                        	<p><i class="fa fa-clock-o"></i>마감까지</p>
                        	</div>		
                            <div class="item d-flex align-items-center">
                                <span>D - ${pl.left_date}</span>
                            </div>
                            <a href="/prodetail/info?pro_no=${pl.pro_no }"><h3>${pl.pro_title }</h3></a>
                            <div class="projects-range">
                                <div class="projects-range-content">
                                    <ul>
                                        <li>달성률:</li>
                                        <li>${pl.achievement_rate}%</li>
                                    </ul>
                                    <div class="range"></div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${pl.pro_tp }" pattern="#,###"/></span> 원</span>
                                <span>목표 금액: <span><fmt:formatNumber value="${pl.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                        </div>
                    </div>
                </div>
					</c:forEach>
              </div>      
            </div>
    </section>
    
    <!--====== EXPLORE PROJECTS PART ENDS ======-->
    
    


	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
