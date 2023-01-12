<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

  
    
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 500px;">
        <div class="container"> 
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center" style="margin-top: 155px;">
                        <span>Let Earth에서 시작 될</span>
                        <h3 class="title">오픈 예정 프로젝트</h3>
                    </div>
                </div>
            </div>
    
            <div class="row justify-content-center">
            
          	<c:forEach var="sch" items="${scheList }" >

                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="${sch.pro_thum }" alt="LetEarth" style="width: 370px; height: 370px;">
                            <a href="/prodetail/info?pro_no=${sch.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content" style="height: 255px;">
                        	<div class="item d-flex align-items-center">
                            	<p><i class="fa fa-clock-o"></i></p>
                            	<p>프로젝트 시작까지</p>&nbsp;
                                <span>D - ${sch.left_date}</span>
                            </div>  
                            <a href="/prodetail/info?pro_no=${sch.pro_no}">
            					<h3>${sch.pro_title }</h3>
            				</a>
            				
                            <div class="projects-goal">
                                <span>목표 금액: <span><fmt:formatNumber value="${sch.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                        </div>
                    </div>
                </div>
                   </c:forEach>     
            </div>
        </div>
    </section>



	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
