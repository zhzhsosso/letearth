package com.letearth.openbank.domain;

import lombok.Data;

@Data
public class SettleVO {
	private String mem_id;
	private String mem_name;
	
	private Integer pro_no;
	private String pro_title;
	private String pro_ed_dt;
	private Integer pro_tp;
	private String par_acc;
	private String par_acc_name;
	private String par_bank;
}
