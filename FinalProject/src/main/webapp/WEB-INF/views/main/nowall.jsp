<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

<!-- <script type="text/javascript"> -->


<!-- </script> -->

    
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 1000px;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center" style="margin-top: 155px;">
                        <span>Let Earth에서 만날 수 있는</span>
                        <h3 class="title">진행 중 프로젝트</h3>
                        <div id="list">
							<p>
								<a href="javascript:recent()">최신순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
								<a href="javascript:aratelist()">달성률순</a>&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp
								<a href="javascript:likelist()">좋아요순</a>
							</p>
						</div>
                    </div>
                </div>
            </div>
            
            <!-- 정렬하기 최신순, 달성률순, 좋아요순-->
            
    
            <div class="row justify-content-center">
            <c:forEach var="now" items="${nowList }">
                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="${now.pro_thum }" alt="LetEarth">
                            <a href="/prodetail/info?pro_no=${now.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content">
                        	<div class="item d-flex align-items-center">
                        	<p>마감까지</p>
                        	</div>	
                            <div class="item d-flex align-items-center">
                                <span>D - ${now.left_date}</span>
                                <p><i class="fa fa-clock-o"></i></p>
                            </div>                         
                            <a href="/prodetail/info?pro_no=${now.pro_no}">
            					<h3>${now.pro_title }</h3>
            				</a>
            				
                            <div class="projects-range">
                                <div class="projects-range-content">
                                    <ul>
                                        <li>달성률:</li>
                                        <li>
                                        	${now.achievement_rate}%
                                        </li>
                                    </ul>
                                    <div class="range"></div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${now.pro_tp }" pattern="#,###"/></span> 원</span>
                                <span>목표 금액: <span><fmt:formatNumber value="${now.pro_gp }" pattern="#,###"/></span> 원</span>
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
