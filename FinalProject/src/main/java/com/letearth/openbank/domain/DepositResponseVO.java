package com.letearth.openbank.domain;

import java.util.List;

import lombok.Data;

@Data
public class DepositResponseVO {
//	private String bank_tran_date; // 거래일자
//	private String fintech_use_num; // 핀테크 이용 번호
//	private String account_num_masked; // 입금계좌번호
//	private String account_holder_name; // 수취인 성명
//	private String tran_amt; // 거래금액
//	
//	private String wd_account_num_masked;//출금계좌번호
//	private String wd_account_holder_name;//송금인성명
	
	
	private String api_tran_id; 
	private String api_tran_dtm;
	private String rsp_code;
	private String rsp_message;
	private String wd_bank_code_std;
	private String wd_bank_code_sub;
	private String wd_bank_name;
	private String wd_account_num_masked;
	private String wd_print_content;
	private String wd_account_holder_name;
	private String res_cnt;
	private List<DepositVO> res_list;
	
	
	
}
