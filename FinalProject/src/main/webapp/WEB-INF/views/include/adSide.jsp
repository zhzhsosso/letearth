<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">


/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
/*    top: 30%;  */
/*    left: 20%;  */
  background-color: #111;
  overflow-x: hidden;
  padding-top: 30px;
  padding-bottom : 100px;

  position: relative;
  top: 300px;
  left: 250px; 
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 17px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}

/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  
  position: relative;
  top: 30%;
  left: 20%
}

/* Add an active class to the active dropdown button */
.active {
  background-color: green;
  color: white;
}

/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #262626;
  padding-left: 8px;
}

/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}

/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>


<!-- <section class="contact-form-area"> -->
<!-- 	<div class="container"> -->
		
		
<!-- 사이드바 -->
<div class="sidenav">	
	<button class="dropdown-btn">
		고객센터 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/board/adNoticeList">공지사항</a> 
		<a href="/board/adFaqList">FAQ</a> 
		<a href="/board/adRewriteList">1:1문의</a>
	</div>
	
	<button class="dropdown-btn">
		펀딩관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="#">프로젝트 승인</a> 
		<a href="#">프로젝트 목록</a> 
		<a href="#">재펀딩</a>
		<a href="#">정산관리</a>
	</div>
	
	<button class="dropdown-btn">
		회원관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/report/adRepList">신고접수관리</a> 
		<a href="#">회원목록</a> 
		<a href="/report/adBlackList">블랙리스트</a>
	</div>
</div>
<!-- 사이드바 -->

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
<!-- 		</div> -->
<!-- 	</section> -->






<!-- 드롭다운 -->
<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
   var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>
<!-- 드롭다운 -->
