<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
    <!-- 헤더 -->
 	<%@ include file="../include/header.jsp" %>
 	
 	
 	<style>
 	.main-btn {
 		background-color:#A4AC85 
 	}
 	
 	</style>
 	
 	

	<section class="contact-form-area">
        <div class="container">
		<br><br><br><br><br><br>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
                        <span></span>
                        <h3 class="title">정산완료</h3>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                        <div class="conact-form-item">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    
                                    <div class="input-box mt-20 text-center">
                                     <form method="post" action="/openbanking/transfer" >
											<table class="table table-condensed">
												<div class="banner">
													
													<h6></h6>
													
													<tbody>
	
														<tr>
															<th>프로젝트명</th>
															<td>${setResult.pro_title }</td>
														</tr>
														<tr>
															<th>창작자 이름</th>
															<td>${setResult.mem_name }</td>
														</tr>
														<tr>
															<th>거래은행</th>
															<td>${depositVO.bank_name }</td>
														</tr>
														<tr>
															<th>계좌번호</th>
															<td>${depositVO.account_num_masked }</td>
														</tr>
														<tr>
															<th>예금주명</th>
															<td>${depositVO.account_holder_name }</td>
														</tr>
														
														<tr>
															<th>총 정산금액</th>
															<td><fmt:formatNumber value="${depositVO.tran_amt }" />원</td>
														</tr>

													</tbody>
													
<!-- 													<button type="submit" class="main-btn" type="button">목록</button> -->
												</div>
												
											</table>
<%--                                         		 <input type="hidden" name="access_token" value="${depositRequestVO.access_token }"> --%>
<!-- 								         		 <input type="hidden" name="check_type" value="2"> 입금 -->
<!-- 									         	 <input type="hidden" name="tran_dtime" value="20221104070455"> -->
<!-- 									         	 <input type="hidden" name="req_cnt" value="1"> -->
									         	 
<!-- 									         	 <input type="hidden" name="tran_no" value="1"> -->
<%-- 									         	 <input type="hidden" name="org_bank_tran_id" value="${depositRequestVO.bank_tran_id }"> --%>
<!-- 									         	 <input type="hidden" name="org_bank_tran_date" value="20230109"> 8자리 -->
<!-- 									         	 <input type="hidden" name="org_tran_amt" value="500"> -->
									         	 
<!-- 												<button type="submit" class="main-btn" type="button">거래내역조회</button> -->
													<a class="main-btn" href="/openbanking/useroauth">목록</a>
								      	</form>
                                    </div>
                                    	
								         	 
                                </div>
                            </div>
                        </div>
                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>

    

 	
 	<div class="sidebar__single sidebar__category">
        <h3 class="sidebar__title">판매자에게 정산하기</h3>
        <ul class="sidebar__category-list">
            <li class="sidebar__category-list-item">${depositOK }</li>
        </ul>
        
        <br><br><br>
        
        <ul class="sidebar__category-list">
       	 <li class="sidebar__category-list-item">거래내역조회 전에 개발자사이트에 데이터넣고오기</li>
        </ul>

         <form method="post" action="/openbanking/transfer" >
         	 <input type="hidden" name="access_token" value="${depositRequestVO.access_token }">
         	 <input type="hidden" name="check_type" value="2"> <!-- 입금 -->
         	 <input type="hidden" name="tran_dtime" value="20221104070455">
         	 <input type="hidden" name="req_cnt" value="1">
         	 
         	 <input type="hidden" name="tran_no" value="1">
         	 <input type="hidden" name="org_bank_tran_id" value="${depositRequestVO.bank_tran_id }">
         	 <input type="hidden" name="org_bank_tran_date" value="20230109"> <!-- 8자리 -->
         	 <input type="hidden" name="org_tran_amt" value="500">
         	 
			<button type="submit" class="main-btn" type="button">거래내역조회</button>
      	</form>
    </div>
 	
 	
 	
 	
 	
 		<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>