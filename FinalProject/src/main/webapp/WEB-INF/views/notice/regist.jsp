<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.min.js"></script>
	<script type="text/javascript">
		  var cnt=1; 
		  function file_add(){ 
 			  $('#d_file').append("<input type='file' name='not_file"+cnt+"'>"); 
 			  cnt++; 
 		  }  
	
	</script> 
	

	<section class="contact-form-area">
	
	    <!-- 수정,삭제 bno정보를 전달하는 폼태그 -->
    <form role="form" method="post">
	
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
<!--                         <span> </span> -->
                        <h3 class="title">공지사항 & 이벤트 작성하기</h3>
                        <hr>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">

					<form method="post" enctype="multipart/form-data" action="upload">
					
                        <div class="conact-form-item">
                            <div class="row">
                            
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="제목을 입력하세요" name="not_title">
                                    </div>
                                </div>
                               	
                               	<div class="col-lg-6 col-md-6">
                               	
                               	<select style="width:120px;height:30px;margin-top:20px;" name="not_cat" id="not_cat">
											<option value="">카테고리 선택</option>
											<option value="1">공지사항</option>
											<option value="2">이벤트</option>
								</select>
								
								<br>
<!-- 								<input type="button" value="파일업로드 추가" onclick="file_add();" style="width:250px;height:30px;margin-top:10px;"> -->
								</div>
					<input type="button" value="파일업로드 추가" onclick="file_add();">
					<div id="d_file">
       
     			    </div>
                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                        <textarea id="not_content" cols="30" rows="10" placeholder="내용을 입력하세요" name="not_content"></textarea>
                                    </div>
                                    <div class="input-box mt-20 text-center">
                                        <button class="main-btn" type="submit">작성하기</button>
                                        <button class="main-btn ma" type="button" onclick="history.back();">목록으로</button>
                                    </div>
                                </div>
                            </div>
                        </div>
					</form>
                    <p class="form-message"></p>
                </div>
            </div>
        </div>
    </section>
    
    
    
	
	<!-- 푸터 -->
	<%@ include file="../include/footer.jsp" %>