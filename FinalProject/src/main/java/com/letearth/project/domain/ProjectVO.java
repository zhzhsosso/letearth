package com.letearth.project.domain;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProjectVO {
	private int pro_no;
	private String mem_id;
	private int cat_no;
	private String cat_name;
	private String pro_title;
	private String pro_context;
	private String pro_thum;
	private int pro_gp;
	private int pro_tp;
	private String pro_st_dt;
	private String pro_ed_dt;
	private String pro_file;
	private String pro_story;
	private String pro_file2;
	private String pro_story2;
	private String pro_policy;
	private String tags;
	private int pro_status;
	private Timestamp pro_cr_dt;
	private String del_date;
	private String par_birth;
	private String par_com_num;
	private String par_bank;
	private String par_bank_code;
	private String par_acc;
	private String par_acc_name;
	private String par_cat;
	private String par_scan;
	private String par_intro;
	private String pro_bdate;
	private MultipartFile file;
	
}

