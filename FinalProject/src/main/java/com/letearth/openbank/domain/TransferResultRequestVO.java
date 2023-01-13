package com.letearth.openbank.domain;

import java.util.List;

import lombok.Data;

@Data
public class TransferResultRequestVO {
	//이체결과조회 - 요청
	
	private String access_token;
	private String check_type; //출금이체 1
	private String tran_dtime; //요청일시
	private String req_cnt; //요청건수 - 한번에 25건 확인가능
	private List req_list; //요청목록\
	
	//req_list
	private String tran_no; //거래순번
	private String org_bank_tran_id; //원거래 거래고유번호
	private String org_bank_tran_date; //원거래 거래일자
	private String org_tran_amt; //원거래금액	
		
}
