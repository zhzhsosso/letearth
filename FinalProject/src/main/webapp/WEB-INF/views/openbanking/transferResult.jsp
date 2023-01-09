<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	<br><br><br><br><br><br><br><br><br>
 	
 	<div class="sidebar__single sidebar__category">
        <h3 class="sidebar__title">후원완료</h3><!-- /.sidebar__title -->
        <ul class="sidebar__category-list">
            <li class="sidebar__category-list-item">${transferOK }</li>
        </ul>
    </div>
 	
 	
 	
 	
 	
 		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>>