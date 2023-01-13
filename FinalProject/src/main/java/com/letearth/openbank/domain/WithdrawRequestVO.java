package com.letearth.openbank.domain;

import lombok.Data;

@Data
public class WithdrawRequestVO {
	//출금이체 - 요청
	private String access_token; 
	private String bank_tran_id; //은행거래고유번호
	private String cntr_account_type; //약정 계좌N/계정C 구분
	private String cntr_account_num; //계좌 번호
	private String dps_print_content; //계좌인좌내역 "쇼핑몰환불"이런거
	private String fintech_use_num; //출금계좌핀테크이용번호
	private String tran_amt; //거래금액
	private String tran_dtime; //요청일시
	private String req_client_name; //요청고객성명
	private String req_client_num; //요청고객회원번호
	private String transfer_purpose; //이체용도 TR송금 - TR
	private String req_client_bank_code; 
	private String req_client_account_num; 
	private String req_client_fintech_use_num; 
	
	
	private String sub_frnc_name;
	private String sub_frnc_num;
	private String sub_frnc_business_num;
	private String recv_client_name; //최종수취고객성명
	private String recv_client_bank_code; //계좌개설기관코드
	private String recv_client_account_num; //계좌번호
	

}
