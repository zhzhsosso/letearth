package com.letearth.member.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PlusVO {
	private String mem_id;
	private Integer mem_status;
	
	private int pro_no;
	private String pro_title;
	private String create_title;
	private String pro_thum;
	private int pro_gp;
	private int pro_tp;
	private int pro_status;
	private String pro_st_dt;
	private String pro_ed_dt;
	private String achievement_rate;
	private String left_date;
	private String tags;
	private Timestamp pro_cr_dt;
	
	private int order_no;
	private String order_trade_num;
	private String create_date;
	private Timestamp order_date;
	private Integer order_count;
	private Integer total_price;
	private String create_address;
	private String address_no;
	private Integer shipping_status;
	private String shipping_no;
	private String shipping_com;
	private String receiver_phone;
	private String receiver_name;
	
	private String reward_title;
	private Integer reward_no;
	
	private Integer like_no;

}
