<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
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
.user-img {
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	width: 80px;
    height: 80px;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
}
.btn {
	background: #674df0;
    line-height: 30px;
    padding: 0 15px;
    font-size: 11px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 3px;
    color: #fff;
    margin-right: 10px;
}
</style>
 <script>
function modifyMember() {
	$.ajax({
		async : true,
	    type:'post',
	    url:"/mypage/myModify",
	    data: {
			mem_id:$("#mem_id").val(),
			mem_name:$("#mem_name").val(),
			mem_phone:$('#mem_phone').val(),
			mem_email:$('#mem_email').val(),
		},
	    dataType : "text",
	    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
	    success : function(resp) {
	    	swal('수정되었습니다.','','info');
    		setTimeout(function () {
		    	$.ajax({
					url:"/mypage/myInfo",
					type:"get",
					datatype:"html",
					success:function(data){
						$("#myInfo").html(data);
					}	
				});
    		}, 2000);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	        alert("ERROR : " + textStatus + " : " + errorThrown);
	    }        
	});
}
</script>

<div class="container">
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<span class="user-img" style="background-image: url('../resources/assets/images/author.jpg'); vertical-align: middle;"></span>
			</div>
		</div>
	</div>
	<hr style="margin:2em;"> 
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="section-title text-center">
				<form action="/mypage/myModify" method="post">
				아이디 <input type="text" name="mem_id" id="mem_id" value="${memVO.mem_id }" class="textBox" readonly="readonly"> <br>
				이름 <input type="text" name="mem_name" id="mem_name" value="${memVO.mem_name }" class="textBox"> <br>
				전화번호 <input type="text" name="mem_phone" id="mem_phone" value="${memVO.mem_phone }" class="textBox"> <br>
				이메일 <input type="text" name="mem_email" id="mem_email" value="${memVO.mem_email }" class="textBox"> <br>
				</form>
			</div>
		</div>
	</div>
	<hr>
	<div class="row justify-content-center">
		<div class="col-lg-8">
			<div class="text-center">
				<button type="button" class="btn" id="myModify" onclick="modifyMember();">수정</button>
			</div>
		</div>
	</div>
	<!-- 리워드 추가 / 모달창 -->         
</div>