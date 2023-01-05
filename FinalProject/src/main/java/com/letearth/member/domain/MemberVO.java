package com.letearth.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_phone;
	private String mem_email;
	private Timestamp mem_cr_dt;
	private String mem_link;			/* 로그인 연동 여부 */
	private Integer rep_cnt;
	private Integer mem_status;		/* 0. 구매회원, 1. 판매회원, 2. 관리자*/
	private String mem_profile;
	private Timestamp mem_bdate;	/* 회원이 블랙리스트에 추가된 날짜 */

}
