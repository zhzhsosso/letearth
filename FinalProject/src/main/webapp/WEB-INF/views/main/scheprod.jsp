<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>	
	<script>
	$(document).ready(function() {		
		var tagObj = $(".tags");
				
		for(var i=0; i<tagObj.length; i++){
			var tagText = $(".tags")[i].innerHTML;	
		    tagText = tagText.replaceAll(',', ' #');
		    tagText = "#" + tagText;    
		    $(".tags")[i].innerHTML = tagText;
		}
	})
	</script>   
	
	<style>
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
    
    <section class="explore-projects-area explore-projects-page-area" style="padding-bottom: 500px;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center" style="margin-top: 155px;">
                        <span>Let Earth에서 시작 될</span>
                        <h3 class="title">오픈 예정 상품</h3>
                    </div>
                </div>
            </div>
    
            <div class="row">
            
            <c:forEach var="schp" items="${scheprodList }" >

                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="../resources/upload/${schp.pro_thum }" alt="LetEarth" style="width: 370px; height: 370px;">
                            <a href="/prodetail/info?pro_no=${schp.pro_no}">
                            	<i class="fa fa-heart"></i>
                            </a>
                        </div>
                        <div class="explore-projects-content" style="height: 305px;">
                        <div>
                        
                        </div>
                            <div class="item d-flex align-items-center">
                            	<p><i class="fa fa-clock-o"></i></p>
                            	<p>프로젝트 시작까지</p>&nbsp;
                                <span>D - ${schp.left_date}</span>
                            </div>                         
                            <a href="/prodetail/info?pro_no=${schp.pro_no}">
            					<h3>${schp.pro_title }</h3>
            				</a>
            				
                            <div class="projects-goal">
                                <span>목표 금액: <span><fmt:formatNumber value="${schp.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                            
                            <div class="tags">
                                 <span class="tags" style="color: #A4AC85;">${schp.tags }</span>
                            </div>
                            
                            <div style="text-align: center; margin-top: 8%;">
	                        	<p style="color: #4e5744;">해당 프로젝트의 오픈 예정일은 </p> 
	                        	<p style="color: #4e5744;"> ${schp.pro_st_dt } 입니다!</p>
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
