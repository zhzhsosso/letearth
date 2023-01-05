<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>scheclass</title>

<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

	<!--====== PAGE TITLE PART START : 광고 배너 자리 : 나중에 추가하기 - 지금은 이상하게 보여서 그냥 지워둠 ======-->
	


    <!--====== PAGE TITLE PART ENDS : 데이터 불러오기 우선 !!!!! ======-->



    <!--====== EXPLORE PROJECTS PART START : 신규 프로젝트 ======-->

	<!--     썸네일. 타이틀 상세정보로 가게 하는 페이지 링크 걸어야 함 @@@ -->   
    
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 500px;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center" style="margin-top: 155px;">
                        <span>Let Earth에서 시작 될</span>
                        <h3 class="title">오픈 예정 클래스</h3>   
                    </div>
                </div>
            </div>
    
            <div class="row justify-content-center">
            
            <c:forEach var="schc" items="${scheclassList }" >

                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="${schc.pro_thum }" alt="LetEarth">
                            <a href="/prodetail/info?pro_no=${schc.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content">
                        	<div class="item d-flex align-items-center">
                        	<p>오픈까지</p>
                        	</div>
                            <div class="item d-flex align-items-center">
                                <span>D - ${schc.left_date}</span>
                                <p><i class="fa fa-clock-o"></i></p>
                            </div>                         
                            <a href="/prodetail/info?pro_no=${schc.pro_no}">
            					<h3>${schc.pro_title }</h3>
            				</a>
            				
                            <div class="projects-range">
                                <div class="projects-range-content">
                                    <ul>
                                        <li>달성률:</li>
                                        <li>
                                        	0.00%
                                        </li>
                                    </ul>
                                    <div class="range"></div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>목표 금액: <span><fmt:formatNumber value="${schc.pro_gp }" pattern="#,###"/></span> 원</span>
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
