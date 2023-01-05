<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
    
	<section class="next-big-thing-area next-big-thing-about-area">
        <div class="container">     
         	<div class="row justify-content-center">
		        <div class="col-lg-8">
		            <div class="section-title text-center">
		            	<h3 class="title">인증이 완료되었어요!</h3>
		            	<span>프로젝트를 만들러가요~~~</span>
		            	<form action="/project/confirm" method="post">
		           			<button type = "submit" class="main-btn">프로젝트 시작하기</button>
		            	</form>
		            </div>
		        </div>
		    </div>
     
        </div>
         		           
    </section>
    
    <%@ include file="../include/footer.jsp" %>