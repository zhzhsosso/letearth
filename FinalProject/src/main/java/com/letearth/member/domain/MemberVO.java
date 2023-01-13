package com.letearth.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String mem_id;
	private String mem_pw;
	private int mem_no;
	private String mem_name;
	private String mem_phone;
	private String mem_email;
	private Timestamp mem_cr_dt;
	private String mem_link;			/* 로그인 연동 여부 */
	private Integer rep_cnt;
	private Integer mem_status;		/* 0. 구매회원, 1. 판매회원, 2. 관리자*/
	private String mem_profile;
	private String mem_bdate;	/* 회원이 블랙리스트에 추가된 날짜 */
	private String bank_token;   // 은행 토큰
	private String bank_user_num;  // 회원일련번호
	private String bank_code;   // 은행코드
	private String bank_fin_num;  // 핀테크넘버
	private String bank_name;  // 은행명
	private String bank_acc;  // 계좌
	private String bank_acc_name;  // 예금주명
	
	private int cnt; // 관리자 차트에 쓸 컬럼 추가했습니다.
	private String mem_ratio; // 유형
}
