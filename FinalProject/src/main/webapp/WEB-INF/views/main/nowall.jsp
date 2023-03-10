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
		
	</style>
	
	    
    <section style="padding-bottom: 325px;">
        <div class="container">
        
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center" style="margin-top: 155px;">
                        <span>Let Earth에서 만날 수 있는</span>
                        <h3 class="title">진행 중 프로젝트</h3>
                    </div>
                </div>
            </div>
            
            <div class="row">
            <c:forEach var="now" items="${nowList }">
                <div class="col-lg-4 col-md-6 col-sm-9" style="width: 270px;">
                    <div class="explore-projects-item mt-30">
                        <div class="explore-projects-thumb">
                            <img src="../resources/upload/${now.pro_thum }" alt="LetEarth" style="width: 370px; height: 370px;">
                            <a href="/prodetail/info?pro_no=${now.pro_no}">
                            </a>
                        </div>
                        <div class="explore-projects-content" style="height: 305px;">
                            <div class="item d-flex align-items-center">
                            	<p><i class="fa fa-clock-o"></i></p>
                        		<p>프로젝트 종료까지</p>&nbsp;
                                <span>D - ${now.left_date}</span>
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
                                    <div id="rangeGraph">
                                    	<span style="width:${now.achievement_rate}%"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="projects-goal">
                                <span>달성 금액: <span><fmt:formatNumber value="${now.pro_tp }" pattern="#,###"/></span> 원</span>
                                <span>목표 금액: <span><fmt:formatNumber value="${now.pro_gp }" pattern="#,###"/></span> 원</span>
                            </div>
                            <div>
                            	<span class="tags" style="color: #A4AC85;">${now.tags }</span>
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
