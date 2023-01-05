package com.letearth.project.domain;

import lombok.Data;

@Data
public class RewardVO {
	
	private int reward_no;
	private int pro_no;
	private int reward_price;
	private String reward_status;
	private int reward_stock;
	private String reward_ship;
	private String reward_title;
	private String reward_content;
	private String reward_shipmonth;
	private String reward_shipdate;

}
