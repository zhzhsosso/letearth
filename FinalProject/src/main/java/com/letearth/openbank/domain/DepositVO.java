package com.letearth.openbank.domain;

import lombok.Data;

@Data
public class DepositVO {
	
	//공통
//	private String tran_no; //거래순번 1
//	private String bank_tran_id; //은행거래고유번호
//	private String fintech_use_num; //핀테크이용번호
//	private String print_content; //입금계좌인자내역
//	private String tran_amt; //거래금액
//	
//	
//	//request
//	private String req_client_name; //요청고객성명
//	private String req_client_bank_code;
//	private String req_client_account_num;
//
//	private String req_client_num; //요청고객회원번호
//	private String transfer_purpose; //이체용도 TR
//	
//	
//	//response
//	private String bank_tran_date;
//	private String bank_code_tran;
//	private String bank_rsp_code;
//	private String bank_rsp_message;
//	private String account_alias;
//	private String bank_code_std;
//	private String bank_code_sub;
//	private String bank_name;
////	private String savings_bank_name;
//	private String account_num_masked;
//	private String account_holder_name; 
////	private String cms_num; 
//	
//	public String getBank_tran_id() {
//		return "M202202343U"+ (int)((Math.random()+1)*100000000);
//	}
	
	
	private String tran_no;
	private String bank_tran_id;
	private String bank_tran_date;
	private String bank_code_tran;
	private String bank_rsp_code;
	private String bank_rsp_message;
	private String fintech_use_num;
	private String account_alias;
	private String bank_code_std;
	private String bank_code_sub;
	private String bank_name;
	private String savings_bank_name;
	private String account_num_masked;
	private String print_content;
	private String account_holder_name; 
	private String tran_amt; 
	private String cms_num;
	
}
