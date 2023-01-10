<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
	<!-- 헤더 -->
	<%@ include file="../include/header.jsp" %>

	<!-- sweetalert -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" type="text/css" href="fontawesome-free-5.15.1-web/css/fontawesome.min.css">
<script src="https://kit.fontawesome.com/90a612e2ef.js" crossorigin="anonymous"></script>

<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- jQuery UI CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	
	
	
	
	
	

	<section class="contact-form-area">
	
<!-- 	    수정,삭제 bno정보를 전달하는 폼태그 -->
    <form role="form" method="post">
	
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="section-title text-center">
<!--                         <span> </span> -->
                        <h3 style="font-weight: bolder;">공지사항 & 이벤트 작성하기</h3>
                        <hr>
                    </div>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-8">

					<form method="post" enctype="multipart/form-data" action="upload">
					
					<select style="width:120px;height:30px;margin-top:20px;" name="not_cat" id="not_cat">
						<option value="">카테고리 선택</option>
						<option value="1">공지사항</option>
						<option value="2">이벤트</option>
					</select> <br>
					
                        <div class="conact-form-item">
                            <div class="row">
               
                                <div class="col-lg-6 col-md-6">
                                    <div class="input-box mt-20">
                                        <input type="text" placeholder="제목을 입력하세요" name="not_title">
                                    </div>
                                </div>
					
                                <div class="col-lg-12">
                                    <div class="input-box mt-20">
                                        <textarea id="not_content" cols="30" rows="10" placeholder="내용을 입력하세요" name="not_content"></textarea>
                                    </div>
                                    <div class="input-box mt-20 text-center">
                                        <button style="color:#fff; background:#6f7b63; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;" type="submit">작성하기</button>
                                        <button style="color:#fff; background:#6f7b63; width:100px; height:40px; margin:5px; border-radius:5px; border:1px solid #fff;" type="button" onclick="history.back();">목록으로</button>
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