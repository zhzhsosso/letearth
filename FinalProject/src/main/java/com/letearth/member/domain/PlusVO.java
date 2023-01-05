package com.letearth.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PlusVO {
	private String mem_id;
	private Integer mem_status;
	
	private int pro_no;
	private String pro_title;
	private String pro_thum;
	private int pro_gp;
	private int pro_tp;
	private String pro_st_dt;
	private String pro_ed_dt;
	private String achievement_rate;
	private String left_date;
	private String tags;
	
	private int order_no;
	private String order_trade_num;
	private Timestamp order_date;
	private Integer order_count;
	private Integer total_price;
	private Integer shipping_status;
	
	private String reward_title;
	private Integer reward_no;
	
	private Integer like_no;

}
