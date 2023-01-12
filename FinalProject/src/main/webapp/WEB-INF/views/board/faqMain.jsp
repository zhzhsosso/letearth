<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 헤더 -->
   <%@ include file="../include/header.jsp" %>
<!-- 헤더 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> 
<link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.bg_cover1 {
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    width: 100%;
    height: 30%;
}

.page-title-area1 {
    margin-top: 250px;
    margin-left: 500px;
    margin-right: 0px;
}

/*아이콘버튼*/
.faq-design-area .faq-tab-btn .nav li a.active {
    background: #A4AC85;
    position: relative;
}

/*본문*/
.faq-design-area .tab-content .tab-pane .faq-accrodion .accrodion.active .accrodion-inner {
    background: #D7D1B9;
}
.faq-accrodion .accrodion.active .accrodion-inner {
    background-color: transparent;
    border-color: #6F7B63;
    border: 1px solid #A4AC85;
}

.faq-accrodion .accrodion .accrodion-inner {
    background-color: transparent;
    padding: 20px 0;
    position: relative;
    -webkit-transition: all .4s ease;
    transition: all .4s ease;
    border-radius: 0px;
}

/*아이콘색*/
.faq-design-area .faq-tab-btn .nav li a i {
    display: block;
    font-size: 56px;
    color: #6F7B63;
    padding-bottom: 8px;
}

.faq-design-area .faq-tab-btn .nav li a {
    padding: 0;
    margin: 0;
    height: 165px;
    width: 160px;
    background: #E8E4D7;
    text-align: center;
    font-size: 18px;
    font-weight: 500;
    color: #414934;
    display: block;
    padding-top: 12px;
    border-radius: 0;
}

/*배경*/
.faq-title-area .section-title {
    background: #E8E4D7;
    padding-top: 112px;
    padding-bottom: 120px;
}

.faq-design-area .tab-content .tab-pane .faq-accrodion .accrodion {
    background: #E8E4D7;
}

.faq-design-area .faq-tab-btn .nav li a.active::before {
    position: absolute;
    content: '';
    right: 0;
    top: 0;
    height: 20px;
    width: 20px;
    background: #6F7B63;
}

/*내용색*/
.faq-accrodion .accrodion .accrodion-content p {
    margin: 0;
    color: #414934;
    font-size: 20px;
    font-weight: bold;
    line-height: 30px;
/*     font-weight: 400; */
}


</style>  
   
   
    <!--====== PAGE TITLE PART START ======-->
    
    <section class="page-title-area1 bg_cover1">
        <div >
            <img alt="" src="/resources/faq.jpg" >
        </div>
    </section>
    
    <!--====== PAGE TITLE PART ENDS ======-->

    <!--====== FAQ TITLE PART START ======-->
    
    <section class="faq-title-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title text-center" style="padding-top: 80px; padding-bottom: 80px;">
                        <span style="font-size: 20px; color: #6F7B63; font-weight: bold; position: static; padding-bottom: 10px;">Frequently Asked Questions</span><br>
                        <h3 class="title" style="color: #414934;">자주 묻는 질문들을 모아봤어요!</h3>
<!--                         <div class="row justify-content-center"> -->
<!--                             <div class="col-lg-8"> -->
<!--                                 <div class="input-box"> -->
<!--                                     <input type="text" placeholder="Search here anything..."> -->
<!--                                     <button>  -->
<!--                                         <svg height="22" width="22" fill="#674df0" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" -->
<!--                                              viewBox="0 0 512 512" style="enable-background:new 0 0 512 512;" xml:space="preserve"> -->
<!--                                         <g> -->
<!--                                             <g> -->
<!--                                                 <path d="M508.875,493.792L353.089,338.005c32.358-35.927,52.245-83.296,52.245-135.339C405.333,90.917,314.417,0,202.667,0 -->
<!--                                                     S0,90.917,0,202.667s90.917,202.667,202.667,202.667c52.043,0,99.411-19.887,135.339-52.245l155.786,155.786 -->
<!--                                                     c2.083,2.083,4.813,3.125,7.542,3.125c2.729,0,5.458-1.042,7.542-3.125C513.042,504.708,513.042,497.958,508.875,493.792z -->
<!--                                                      M202.667,384c-99.979,0-181.333-81.344-181.333-181.333S102.688,21.333,202.667,21.333S384,102.677,384,202.667 -->
<!--                                                     S302.646,384,202.667,384z"/> -->
<!--                                             </g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         <g> -->
<!--                                         </g> -->
<!--                                         </svg> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!--====== FAQ TITLE PART ENDS ======-->

    <!--====== FAQ DESIGN PART START ======-->
    <section class="faq-design-area pb-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="faq-tab-btn">
                        <ul class="nav nav-pills justify-content-around" id="pills-tab" role="tablist" style="margin-left:10%; margin-right: 10%;">
                            <li class="nav-item" role="presentation">
                                <a class="nav-link active" id="pills-1-tab" data-toggle="pill" href="#pills-1" role="tab" aria-controls="pills-1" aria-selected="true"><i class="flaticon-handshake"></i> 후원자</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-2-tab" data-toggle="pill" href="#pills-2" role="tab" aria-controls="pills-2" aria-selected="false"><i class="flaticon-pay"></i> 구매자</a>
                            </li>
                            <li class="nav-item" role="presentation">
                                <a class="nav-link" id="pills-3-tab" data-toggle="pill" href="#pills-3" role="tab" aria-controls="pills-3" aria-selected="false"><i class="flaticon-entrepreneur"></i> 판매자</a>
                            </li>
                        </ul>
                    </div>
                    
                    <div class="tab-content mt-55" id="pills-tabContent">
          <!-- 후원자 2번 -->  
                        <div class="tab-pane fade show active" id="pills-1" role="tabpanel" aria-labelledby="pills-1-tab">
           <c:forEach var="vo2" items="${faqMainList2 }" varStatus="i">    
<!--                             <div class="row"> -->
<!--                                 <div class="col-lg-6"> -->
                                    <div class="faq-accordion">
                                        <div class="accrodion-grp animated wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion">
                                            <div class="accrodion">
                                                <div class="accrodion-inner">
                                                    <div class="accrodion-title">
                                                        <h4>
                                                        	<span style="color: #6F6957; font-weight: bold; font-size: 20px;">${i.count }.　　</span>
                                                        	<span style="color: #414934; font-weight: bold; font-size: 20px;">${vo2.not_title }</span>
                                                       	</h4>
                                                    </div>
                                                    <div class="accrodion-content">
                                                        <div class="inner">
                                                            <p>${vo2.not_content }</p>
                                                        </div><!-- /.inner -->
                                                    </div>
                                                </div><!-- /.accrodion-inner -->
                                            </div>
                                        </div>
                                    </div>
<!--                                 </div> -->
<!--                             </div> -->
                 </c:forEach>
                        </div>
              <!-- 후원자 -->          
              <!-- 구매자 1번 -->
                        <div class="tab-pane fade" id="pills-2" role="tabpanel" aria-labelledby="pills-2-tab">
              <c:forEach var="vo1" items="${faqMainList1 }" varStatus="i"> 
<!--                             <div class="row"> -->
<!--                                 <div class="col-lg-6"> -->
                                    <div class="faq-accordion">
                                        <div class="accrodion-grp animated wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion">
                                            <div class="accrodion">
                                                <div class="accrodion-inner">
                                                    <div class="accrodion-title">
                                                        <h4>
                                                        	<span style="color: #6F6957; font-weight: bold; font-size: 20px;">${i.count }.　　</span> 
                                                        	<span style="color: #6F6957; font-weight: bold; font-size: 20px;">${vo1.not_title }</span>
                                                        </h4>
                                                    </div>
                                                    <div class="accrodion-content">
                                                        <div class="inner">
                                                            <p>${vo1.not_content }</p>
                                                        </div><!-- /.inner -->
                                                    </div>
                                                </div><!-- /.accrodion-inner -->
                                            </div>
                                        </div>
                                    </div>
<!--                                 </div> -->
<!--                             </div> -->
                 </c:forEach>
                        </div>
            <!-- 구매자 -->            
            <!-- 판매자 3번-->
                        <div class="tab-pane fade" id="pills-3" role="tabpanel" aria-labelledby="pills-3-tab">
            	<c:forEach var="vo3" items="${faqMainList3 }" varStatus="i"> 
<!--                             <div class="row"> -->
<!--                                 <div class="col-lg-6"> -->
                                    <div class="faq-accordion">
                                        <div class="accrodion-grp animated wow fadeInLeft" data-wow-duration="1500ms" data-wow-delay="0ms" data-grp-name="faq-accrodion">
                                            <div class="accrodion ">
                                                <div class="accrodion-inner">
                                                    <div class="accrodion-title">
                                                        <h4>
                                                        	<span style="color: #6F6957; font-weight: bold; font-size: 20px;">${i.count }.　　</span> 
                                                        	<span style="color: #6F6957; font-weight: bold; font-size: 20px;">${vo3.not_title }</span>
                                                        </h4>
                                                    </div>
                                                    <div class="accrodion-content">
                                                        <div class="inner">
                                                            <p>${vo3.not_content }</p>
                                                        </div><!-- /.inner -->
                                                    </div>
                                                </div><!-- /.accrodion-inner -->
                                            </div>
                                        </div>
                                    </div>
<!--                                 </div> -->
<!--                             </div> -->
              </c:forEach>     
                        </div>
             <!-- 판매자 -->           
   
                    </div>
                
                </div>
            </div>
        </div>
    </section>
    
    <!--====== FAQ DESIGN PART ENDS ======-->   
   
   

   
<!-- 아코디언 -->   
<script type="text/javascript">
$(".accrodion-title").on('click',function(){
	  $(this).next(".accrodion-content").slideUp(100); // slideToggle
	})
</script>
   
<!-- 푸터 -->
	<%@ include file="../include/footer.jsp"%>
<!-- 푸터 -->