<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
#rangeGraph{
    height:10px;
    background:#e9e9ee;
}

#rangeGraph span{
    height:100%;
    width:0%;
    background:#29f0b4;
}
.qna {
	rap: wrap;
	flex-wrap: wrap;
	margin-right: auto;
}
.comment-one__single_{
    position: relative;
    border-bottom: 1px solid #e4e4ee;
    padding-bottom: 30px;
    margin-bottom: 30px;
}
</style>
<script>
function insertQna(){
	if($('#not_middle').val() == 0) {
		Swal.fire({
			title : '카테고리를 선택해주세요!',
			icon : 'error',
			confirmButtonText : '확인'
		})
		document.fr.not_middle.focus();
		return false;
	}
	if($('#not_title').val() == "") {
		Swal.fire({
			title : '제목을 입력해주세요!',
			icon : 'error',
			confirmButtonText : '확인'
		})
		document.fr.not_title.focus();
		return false;
	}
	if($('#not_content').val() == "") {
		Swal.fire({
			title : '내용을 입력해주세요!',
			icon : 'error',
			confirmButtonText : '확인'
		})
		document.fr.not_content.focus();
		return false;
	}
	
	$.ajax({
		async : true,
	    type:'post',
	    url:"/mypage/myQna",
	    data: {
	    	not_middle:$("#not_middle").val(),
	    	not_title:$("#not_title").val(),
	    	not_content:$('#not_content').val(),
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	swal('등록되었습니다.','','info');
	    	$.ajax({
				url:"/mypage/myQna",
				type:"get",
				datatype:"html",
				success:function(data){
					$('html, body').scrollTop(0);
					$("#myQna").html(data);
				}	
			});
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}
</script>
<script type="text/javascript">
function deleteQna(not_no) {
	Swal.fire({
		title: '해당 글을 삭제하시겠습니까?',
		text: '글 삭제 후 복구는 불가합니다.',
		icon: 'info',
		showCancelButton: true,
		confirmButtonColor: '#3085d6',
		cancelButtonColor: 'grey',
		confirmButtonText: '삭제',
		cancelButtonText: '취소'
	}).then((result) => {
		if (result.isConfirmed) {   
			$.ajax({
				async : true,
			    type:'post',
			    url:"/mypage/deleteQna",
			    data: {
			    	not_no:not_no,
				},
			    dataType : "text",
			    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			    success : function(resp) { 
			    	swal('삭제 되었습니다.','','info');
		    		setTimeout(function () {
		    		 	$.ajax({
							url:"/mypage/myQna",
							type:"get",
							datatype:"html",
							success:function(data){
								$("#myQna").html(data);
							}	
						});
		    		}, 2000);
			    },
			    error: function(jqXHR, textStatus, errorThrown) {
			        alert("ERROR : " + textStatus + " : " + errorThrown);
			    }        
			});
		} 
	}) 
}
</script>

<div class="comment-one mt-50" style="padding-left: 15em; padding-right: 15em;">
	<h3 class="comment-one__block-title" style="color: #414934;">${cnt } 개의 글</h3>
	<c:forEach var="notVO" items="${notVO }">
		<c:choose>
			<c:when test="${notVO.not_re_lev == 1 }">
					<div style="padding-left: 3em;">
					<div class="comment-one__single_">
						<div class="comment-one__content">
							<div class="qna">
							<span class="myBtn4">답글</span>
							<span class="comment-one__date" style="color: #414934;"><fmt:formatDate value="${notVO.not_date }" pattern="yyyy-MM-dd"/></span>
							<span style="float: right; font-weight: bold; color: #414934;">답변 완료</span>
							</div>
							<p>${notVO.not_title }</p>
							<p>${notVO.not_reply }</p>
						</div>
					</div>
					</div>
			</c:when>
			<c:when test="${notVO.not_re_lev == 0 }">
				<div class="comment-one__single_">
					<div class="comment-one__content">
						<div class="qna">
						<c:choose>
							<c:when test="${notVO.not_middle == 1 }">
								<span class="myBtn">구매</span>
							</c:when>
							<c:when test="${notVO.not_middle == 2 }">
								<span class="myBtn2">후원</span>
							</c:when>
							<c:when test="${notVO.not_middle == 3 }">
								<span class="myBtn3">판매</span>
							</c:when>
						</c:choose>
						<span class="comment-one__date" style="color: #414934;"><fmt:formatDate value="${notVO.not_date }" pattern="yyyy-MM-dd"/></span>
						<c:choose>
							<c:when test="${notVO.not_count == 1 }">
								<span style="float: right; font-weight: bold;">답변 대기</span>
							</c:when>
							<c:when test="${notVO.not_count == 2 }">
								<span style="float: right; font-weight: bold; color: #414934;">답변 완료</span>
							</c:when>
						</c:choose>
						<span style="float: right;" onclick="deleteQna(${notVO.not_no });">삭제ㅤ</span>
						</div>
						<p>${notVO.not_title }</p>
						<p>${notVO.not_content }</p>
					</div>
				</div>
			</c:when>
		</c:choose>
	</c:forEach>
</div>
<!-- 질문 폼 --> 
<div class="comment-form" style="padding-left: 15em; padding-right: 15em;">
	<h3 class="comment-one__block-title">1:1 문의</h3>
	<p>작성하신 내용은 관리자만 확인 가능합니다.</p> <br>
	<form  action="/mypage/myQna" method="post" class="contact-one__form" name="fr">
	<table>
		<tr>
			<td id="tbl">카테고리</td>
			<td id="cont">
			<select name="not_middle" class="textBox" id="not_middle">
				<option value="0">카테고리</option>
				<option value="1">구매</option>
				<option value="2">후원</option>
				<option value="3">판매</option>
			</select>
			</td>
		</tr>
		<tr>
			<td id="tbl">제목</td>
			<td id="cont">
				<input type="text"name="not_title" class="bigTextBox" id="not_title">
			</td>
		</tr>
		<tr>
			<td id="tbl">내용</td>
			<td id="cont">
				<textarea name="not_content" class="autoTextArea2" id="not_content"></textarea>
			</td>
		</tr>
	</table>
		<div class="col-lg-12 text-left">
			<div class="input-box">
				<button type="button" class="btn btn-primary btn-lg" onclick="insertQna();" style="float: right; margin-right: 5em; background-color: #A4AC85; border: none;">문의하기</button>
			</div>
		</div>
	</form>
</div>
<!-- 질문 폼 -->