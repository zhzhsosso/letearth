<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/project.css">
<link rel="stylesheet" href="../resources/assets/css/board.css">
<script src="../resources/assets/js/vendor/jquery-3.5.1.min.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

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
	
	var shipping_status = [
        { Name: "미정", Id: 1 },
        { Name: "배송준비중", Id: 2 },
        { Name: "배송시작", Id: 3 },
        { Name: "배송완료", Id: 4 },
        { Name: "펀딩취소", Id: 5 },
    ];

	var shipping_com = [
        { Name: "대한통운", Id: "대한통운" },
        { Name: "우체국택배", Id: "우체국택배" },
        { Name: "로젠택배", Id: "로젠택배" },
        { Name: "한진택배", Id: "한진택배" },
    ];
 
    $("#jsGrid").jsGrid({
        width: "100%",
        height: "600px",
 
        inserting: true,
        sorting: true,
        editing: true,
        paging: true,
        autoload: true,
        
        data: strList,
        
        controller: {
        	updateItem: function(item) {
        		console.log(item);
        		$.ajax({
        			async : true,
        			type:'post',
        			url:"/mypage/myProAdmin",
        			data: {
        				shipping_com : item.shipping_com,
        				shipping_status : item.shipping_status,
        				shipping_no : item.shipping_no,
        				order_no : item.order_no,
        			},
        			dataType : "text",
        			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        			success : function(resp) {
        				Swal.fire({
        					icon : 'info',
        					title : '배송 정보가 등록되었습니다.',
        					confirmButtonText : '확인'
        				})
        			},
        			error: function(jqXHR, textStatus, errorThrown) {
        			    alert("ERROR : " + textStatus + " : " + errorThrown);
        			}        
        		});
			},
        },

        fields: [
            { name: "order_trade_num", title:"주문번호", width: 150, align: "center", editing: false },
            { name: "pro_title", title:"프로젝트", width: 200, align: "center"},
            { name: "mem_id", title:"회원 아이디", width: 120, align: "center" },
            { name: "create_date", title:"주문일시", width: 200, align: "center" },
            { name: "reward_title", title:"리워드", width: 200, align: "center" },
            { name: "total_price", title:"금액", type: "number", width: 100, align: "center", editing: false },
            { name: "shipping_status", type: "select", items: shipping_status, title:"배송상태", valueField: "Id", textField: "Name", align: "center" },
            { name: "shipping_com", type: "select", items: shipping_com, title:"회사", valueField: "Id", textField: "Name", align: "center" },
            { name: "shipping_no", title:"운송장 번호", type: "text", width: 200, align: "center" },
            { type: "control", deleteButton: false, editButton : true }
        ]
    });
   
</script>
<br> <br>
<h3 style="text-align: center; color: #414934;">판매자 주문 관리 페이지</h3>
<br> <br>

<div id="jsGrid" class="board_list"></div>
