<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	<br><br><br><br><br><br><br><br><br>
 	
 	
	<div class="sidebar__single sidebar__category">
 		<table>
            <thead>
              <tr>
                <th scope="col" style="color:black">계좌번호</th>
                <th scope="col" style="color:black">은행명</th>
                <th scope="col" style="color:black">계좌구분</th>
                <th scope="col" style="color:black">계좌종류</th>
                <th scope="col" style="color:black">예금주명</th>
                <th scope="col" style="color:black">계좌별칭</th>
              </tr>
            </thead>
            <tbody>
       		<c:forEach var="accountList" items="${accountList.res_list }">
              <tr>
				<td>${accountList.account_num_masked }</td>
				<td>${accountList.bank_name }</td>
				<td>${accountList.account_holder_type } (개인)</td>
				<td>${accountList.account_type } (일반)</td>
				<td>${accountList.account_holder_name }</td>
				<td>${accountList.account_alias }</td>
              </tr>
			</c:forEach>
            </tbody>
      	 </table>
     </div>  
          
          
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>
	