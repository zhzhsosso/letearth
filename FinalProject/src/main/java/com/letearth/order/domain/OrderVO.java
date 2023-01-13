package com.letearth.order.domain;

import java.sql.Timestamp;

import com.letearth.project.domain.ProjectVO;
import com.letearth.project.domain.RewardVO;

import lombok.Data;

@Data
public class OrderVO {

	private int order_no;
	private String order_trade_num;
	private int pro_no;
	private String mem_id;
	private int reward_no;
	private String pur_email;  // 회원 이메일
	private int order_price;   // 선물 금액
	private int order_plus;    // 추가 후원금
	private int total_price;   // 총 결제금액
	private int order_status;   // 승인여부 1.결제완료 2.취소요청 3.취소완료
	private String bank_name;   // 은행명
	private String bank_account;  // 은행 계좌번호
	private String receiver_name;  // 수취인
	private String receiver_phone;  // 수취인 연락처
	private String address_no;      // 우편번호
	private String address;        // 주소
	private String address_detail;  // 상세주소
	private int shipping_status;   // 배송상태 1.미정 2.배송준비중 3.배송시작 4.배송완료 5.펀딩취소
	private String shipping_req;   // 배송시 요청사항
	private String shipping_com;  // 택배사
	private String shipping_no;   // 운송장 번호
	private Timestamp order_date; // 주문일
	private int order_count;      // 주문수량
	private String order_option;  // 옵션기입 ?
	
	private String o_date;
	private String pro_title;
	private String reward_title;
	private String reward_shipmonth;
	private String reward_shipdate;
	private String pro_thum;
	
	// Admin
	private ProjectVO ProjectVO;
	private RewardVO RewardVO;
	
}
