package com.letearth.prodetail.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProDetailVO {

	// Project
	private int pro_no;
	private String mem_id;
	private int cat_no;
	private String cat_name;
	private String pro_title;
	private String pro_context;
	private String pro_thum;			/* 썸네일 */
	private int pro_gp;
	private int pro_tp;
	private String pro_st_dt;
	private String pro_ed_dt;
	private String pro_story;			/* 스토리 글 */
	private String pro_policy;
	private String tags;
	private int pro_status;
	private Timestamp pro_cr_dt;
	private String del_date;
	private String pro_bdate;
	private String par_cat;
	private String par_intro;
//	private String par_scan;
	private MultipartFile file;			/* 사진 올리기 용 */
	
	private String left_date;
	private int supporterCnt;
	private String achievement_rate;
	
	// order_tbl
	// private String project_no : join 돼있음
	
	// reward (reward_no, reward_title, reward_content, reward_price, reward_stock)
	private int reward_no;
	private String reward_title;
	private String reward_content;
	private int reward_price;
	private int reward_stock;
	
	private String mem_profile;
	
}
