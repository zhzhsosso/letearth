<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> 
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">


<style type="text/css">
/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  
  position: relative;
  top: 30%;
  left: 20%
}

/*사이드바*/
/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
/*    top: 30%;  */
/*    left: 20%;  */
  background-color: #EDEAE0;
  overflow-x: hidden;
  padding-top: 30px;
  padding-bottom : 100px;

  position: relative;
  top: 50px;
  left: 250px; 
}

/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 17px;
  color: #414934;
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
  color: #B6AD90;
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
.active1 {
  background-color: #D7D1B9; 
  color: white;
}


/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #EDEAE0;
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


/*아코디언*/
.faq-accrodion .accrodion.active .accrodion-inner1 {
    background-color: transparent;
    border-color: #EDEAE0;
    /*border: 1px solid #765ff2;*/
    border: none;
}

.faq-accrodion .accrodion .accrodion-inner1 {
    background-color: transparent;
    padding: 25px 0;
    position: relative;
    -webkit-transition: all .4s ease;
    transition: all .4s ease;
    border-radius: 0px;
}

/*아코디언 내용 폼*/
.form-control1 {
    display: block;
    width: 100%;
    height: calc(1.5em + 0.75rem + 2px);
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #EDEAE0;
    background-color: #EDEAE0;
    background-clip: padding-box;
    border: 1px solid #B6AD90;
    border-radius: 0.25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

/*구글차트 CSS*/
#chart_div g rect{
	color: #6F7B63;
	font-size: 16px;
}
</style>

<!-- 구글차트 -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
//구글 차트 라이브러리 로딩
//google객체는 위쪽 google src안에 들어있음
google.load('visualization','1',{
  'packages' : ['corechart']
});
//로딩이 완료되면 drawChart 함수를 호출
  google.setOnLoadCallback(drawChart); //라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.
  function drawChart() {
      var jsonData = $.ajax({ //비동기적 방식으로 호출한다는 의미이다.
    	  
    	  url : "${path}/board/pjchart_Json",
    	  //chart01에서는 json의 주소를 직접 적었지만 이 페이지에서는 컨트롤러로 이동해 맵핑해서 제이슨을 동적으로
          //직접만들어 그 만든 json을 직접 보낸다.
          
    	  //chart01에서 쓰던 방식 url : "${path}/json/sampleData.json",
          //json에 sampleData.json파일을 불러온다.
          //확장자가 json이면 url 맵핑을 꼭 해주어야 한다. 안해주면 자바파일인줄 알고 404에러가 발생한다.
          //그렇기 때문에 servlet-context파일에서 리소스를 맵핑해준다.
          dataType : "json",
          async : false
      }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
      console.log("@#@$%^&%$#@#$%$^%&^&%$%#$@#$#%^$%#"+jsonData);
      //데이터테이블 생성
      var data
      = new google.visualization.DataTable(jsonData);
      //제이슨 형식을 구글의 테이블 형식으로 바꿔주기 위해서 집어넣음
      //차트를 출력할 div
      //LineChart, ColumnChart, PieChart에 따라서 차트의 형식이 바뀐다.
      
//       var chart = new google.visualization.PieChart(
//               document.getElementByld('chart_div')); //원형 그래프
      
//       var chart
//        = new google.visualization.LineChart(
//               document.getElementById('chart_div')); //선 그래프 
              
      var chart
       = new google.visualization.ColumnChart(document.getElementById('chart_div'));
             // 차트 객체.draw(데이터 테이블, 옵션) //막대그래프
              
              //cuveType : "function" => 곡선처리
              
              //데이터를 가지고 (타이틀, 높이, 너비) 차트를 그린다.
              chart.draw(data, {
            	  // 타이틀
               	  title: "최근 프로젝트 진행률", titleTextStyle:{color:'#6F7B63'},
               	  // 차트 형태및크기
                  //curveType : "function", //curveType는 차트의 모양이 곡선으로 바뀐다는 뜻
                  width : 600,
                  height : 400, 
                  // 막대색
                  
              
              });
  }

  
  // 옵션css

</script>
<!-- 구글차트 -->

<style type="text/css">
#btn {
	 background: #A4AC85;
    line-height: 25px;
    padding: 0 10px;
    font-size: 13px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    color: #fff;
    margin: 15px;
    border-radius: 0.2rem;
    border: none;
    text-align: center;
    cursor: pointer;
}

#btn:hover{
	background-color: #6F7B63;
}
</style>
</head>
<body>
<!-- 헤더 -->
<%@ include file="../include/header.jsp" %>

<section class="contact-form-area">
<br><br><br><br>	<br><br><br><br>	<br><br>
 <div style="display: flex;">
 
<!-- 사이드바 -->
<div class="sidenav">	
	<div class="adminall"><a href="/board/adMain">
	<i class="fa fa-solid fa-leaf" id="admain"></i>
	<span class="admain" style="position: relative; left: 2px; bottom: 3px; font-weight: bolder;">관리자메인</span>
	</a></div>
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-paper-plane"></i>
		&nbsp;고객센터 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/notice/main">공지사항</a> 
		<a href="/board/adFaqList">FAQ</a> 
		<a href="/board/adRewriteList">1:1문의</a>
	</div>
	
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-bank"></i>
		&nbsp;펀딩관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/mempro/adProList1">프로젝트 승인</a> 
		<a href="/mempro/adProList2">프로젝트 목록</a> 
		<a href="/openbanking/useroauth">정산관리</a>
	</div>
	
	<button class="dropdown-btn">
	<i class="fa fa-solid fa-users"></i>
		&nbsp;회원관리 <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
		<a href="/report/adRepListAll">신고접수관리</a> 
		<a href="/mempro/adMemList">회원목록</a> 
		<a href="/report/adBlackList">블랙리스트</a>
	</div>
</div>
<!-- 사이드바 -->
	

<div class="container" style="display: flex; justify-content: space-around; flex-wrap: wrap;">	

    <!-- 차트 출력 영역 -->
  <div style="width: 80%; height: 550px; margin-top: 20px;">
  	<div style="border: 1px solid #D7D1B9; border-radius: 0.2rem; width: 70%">
	    <div id="chart_div" align="center"></div>
	    <!-- 차트가 그려지는 영역 -->
	    <!-- 차트 새로고침 버튼 -->
	    <div style="position: relative; bottom : 5%;" align="center">
	    	<button id="btn" type="button" onclick="drawChart()">새로고침</button>
	    </div>
	 </div>		
  </div>	
		
			
<!-- 아코디언 -->
<!-- 	<div class="container" style="display: flex; justify-content: space-around;"> -->
<div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">
                            	<!-- 신고 ${adMainRepList } -->
                            <div>
                              <span style="font-size: 25px; font-weight: bold; color: #414934;">최근 신고알림</span>
                            	<c:forEach var="vo" items="${adMainRepList }" varStatus="i">
	                                    <div class="faq-accordion" style="width: 500px; background-color: #EDEAE0;">
	                                        <div class="accrodion-grp animated wow fadeInLeft faq-accrodion" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion">
	                                            <div class="accrodion  " style="background-color: rgba(0, 0, 0, 0);">
	                                                <div class="accrodion-inner1">
	                                                    <div class="accrodion-title">
	                                                        <h4><span style="color: #9C947B;">${vo.reper_id} ▶ ${vo.reped_id}</span>
	                                                        　<span style="color: #6F7B63; font-weight: bold;"> :　${vo.rep_reason }</span></h4>
	                                                    </div>
	                                                    <div class="accrodion-content" style="">
	                                                        <div class="inner" >
	                                                            <p style="color: #6F7B63; font-weight: bold;">신고날짜</p>
	                                                            <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${vo.rep_date }</p>
	                                                            <br>
	                                                            <p style="color: #6F7B63; font-weight: bold;">신고내용</p>
	                                                            <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${vo.rep_content }</p>
	                                                        </div><!-- /.inner -->
	                                                    </div>
	                                                </div><!-- /.accrodion-inner -->
	                                            </div>
	                                        </div>
	                                    </div>
                                </c:forEach>
	                         </div>
                                <!-- 신고 ${adMainRepList } -->
 </div>                               
  <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">                              
                                <!-- 승인 ${adPro2List }-->
                             <div>
                              <span style="font-size: 25px; font-weight: bold; color: #414934;">승인대기중인 프로젝트</span>
                                <c:forEach var="Pro2" items="${adPro2List }" varStatus="i">
	                                    <div class="faq-accordion" style="width: 500px; background-color: #EDEAE0;">
	                                        <div class="accrodion-grp animated wow fadeInLeft faq-accrodion" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion">
	                                             <div class="accrodion  " style="background-color: rgba(0, 0, 0, 0);">
	                                                <div class="accrodion-inner1">
	                                                    <div class="accrodion-title">
	                                                        <h4>
	                                                        	<span style="color: #9C947B;">${i.count}.</span>
	                                                       		<span style="color: #6F7B63; font-weight: bold;">${Pro2.pro_title }</span>
	                                                        </h4>
	                                                    </div>
	                                                    <div class="accrodion-content" style="">
	                                                        <div class="inner">
	                                                        <p style="color: #6F7B63; font-weight: bold;">아이디 : </p>
	                                                        <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${Pro2.mem_id }</p> <br>
	                                                        <p style="color: #6F7B63; font-weight: bold;">프로젝트 내용 : </p>
	                                                        <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${Pro2.pro_context }</p> <br>
	                                                        <p style="color: #6F7B63; font-weight: bold;">펀딩 시작날짜 : </p>
	                                                        <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${Pro2.pro_st_dt }</p> <br>
	                                                        <p style="color: #6F7B63; font-weight: bold;">목표금액 : </p>
	                                                        <p class="form-control1" style="color: #6F7B63; font-weight: bold;">${Pro2.pro_gp } 원</p> <br>
	                                                        </div><!-- /.inner -->
	                                                    </div>
	                                                </div><!-- /.accrodion-inner -->
	                                            </div>
	                                        </div>
	                                    </div>
                                </c:forEach>
                                <!-- 승인 ${adPro2List }-->
                            </div>
 </div>
<!-- 아코디언 -->

			
		</div>
	</div> <!-- 플렉스 -->

</section>




	<!-- 푸터 -->
<%@ include file="../include/footer.jsp" %>
</body>

<script type="text/javascript">


$(".accrodion-title").on('click',function(){
	  $(this).next(".accrodion-content").slideUp(100); // slideToggle
	})
</script>

<!-- 사이드바 드롭다운 -->
<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active1");
   var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>
<!-- 사이드바 드롭다운 -->
</html>