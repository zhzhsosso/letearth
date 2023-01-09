<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/board.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid-theme.min.css" />
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.3/jsgrid.min.js"></script>

<link type="text/css" rel="stylesheet" href="../resources/assets/css/jsgrid.min.css" />
<link type="text/css" rel="stylesheet" href="../resources/assets/css/jsgrid-theme.min.css" />
    
<script type="text/javascript" src="../resources/assets/js/jsgrid.min.js"></script>

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
</style>
<script>
function myFunDetail(num){
	// 펀딩 상세 조회
	$.ajax({
		url:"/mypage/myFunDetail?order_no="+num,
		type:"get",
		datatype:"html",
		success:function(data){
			$("#myFunding").html(data);
		}	
	});
}
</script>
<script>
	var strList = ${jsonString};
	
	var countries = [
        { Name: "", Id: 0 },
        { Name: "United States", Id: 1 },
        { Name: "Canada", Id: 2 },
        { Name: "United Kingdom", Id: 3 }
    ];
 
    $("#jsGrid").jsGrid({
        width: "100%",
        height: "400px",
 
        inserting: true,
        editing: true,
        sorting: true,
        paging: true,
 
        data: strList,
 
        fields: [
            { name: "order_no", title:"주문번호", type: "text", width: 150, validate: "required" },
            { name: "pro_title", title:"프로젝트", type: "text", width: 200 },
            { name: "mem_id", title:"회원 아이디", type: "text", width: 200 },
            { name: "order_date", title:"주문일시", type: "text", width: 200 },
            { name: "reward_title", title:"리워드", type: "text", width: 200 },
            { name: "total_price", title:"금액", type: "number", width: 200 },
            { name: "shipping_status", title:"배송상태", type: "text", width: 200 },
//             { name: "Country", type: "select", items: countries, valueField: "Id", textField: "Name" },
//             { name: "Married", type: "checkbox", title: "Is Married", sorting: false },
            { type: "control" }
        ]
    });
    
    var colModel = $("#jqgrid").jqGrid('getGridParam', 'name'); // 컬럼명을 배열형태로 가져온다.

    alert(colModel);
    
// 	jQuery("#jqgrid").jqGrid("setLabel", colModel[0]['name'], "abc"); // setLabel 함수로 0번째 컬럼명을 abc로 변경, for문으로 돌려도 된다.

</script>
<br><br>

<div id="jsGrid"></div>
    
<div class="board_list_wrap">
	<div class="board_list">
		<div class="top">
			<div class="mem_id">주문번호</div>
			<div class="mem_id">프로젝트</div>
			<div class="mem_id">아이디</div>
			<div class="mem_id">구매날짜</div>
			<div class="mem_id">리워드</div>
			<div class="mem_id">가격</div>
			<div class="mem_id">배송상태</div>
		</div>
		
		<c:forEach var="ordList" items="${ordList }">
			<div>
				<div class="mem_id"><span id="myFunDetail" onclick="myFunDetail(${ordList.order_no });">${ordList.order_trade_num }</span></div>
				<div class="mem_id"><a href="/prodetail/info?pro_no=${ordList.pro_no}">${ordList.pro_title }</a></div>
				<div class="mem_id">${ordList.mem_id }</div>
				<div class="mem_id"><fmt:formatDate value="${ordList.order_date }"/></div>
				<div class="mem_id">${ordList.reward_title }</div>
				<div class="mem_id"><fmt:formatNumber value="${ordList.total_price }" pattern="#,###"/></div>
				<div class="mem_id">
				<c:choose>
					<c:when test="${ordList.shipping_status == 1 }">
						결제완료
					</c:when>
					<c:when test="${ordList.shipping_status == 2 }">
						배송준비중
					</c:when>
					<c:when test="${ordList.shipping_status == 3 }">
						배송시작
					</c:when>
					<c:when test="${ordList.shipping_status == 4 }">
						배송완료
					</c:when>
					<c:when test="${ordList.shipping_status == 5 }">
						펀딩취소
					</c:when>
				</c:choose>
				</div>
			</div>
		</c:forEach>


	</div>
</div>
