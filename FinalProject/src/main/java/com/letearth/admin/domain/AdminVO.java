package com.letearth.admin.domain;

import java.sql.Timestamp;

import com.letearth.project.domain.ProjectVO;

import lombok.Data;

@Data
public class AdminVO {

	// 공지사항 notice 테이블
	private Integer not_no;
	private String mem_id;
	private Integer	not_cat;
	private Integer	not_middle;
	private String not_title;
	private String not_content;
	private String not_reply;
	private String not_file;
	private Timestamp not_date;
	private String not_pw;
	private Integer	not_re_ref;
	private Integer	not_re_lev;
	private Integer	not_re_seq;
	private Integer not_viewcnt;
	
	// 신고 report 테이블
	private Integer rep_no;
	private Integer pro_no;
	private Integer reply_no;
	private String reper_id;
	private String reped_id;
	private Integer rep_cat;
	private String rep_reason;
	private String rep_content;
	private Timestamp rep_date;
	private String rep_status;

	// 블랙리스트 blacklist 테이블
	private Integer black_no;
	private Integer black_type;
	private Timestamp black_date;
	
	
	// ProjectVO 
	private ProjectVO ProjectVO;
	
	// 검색기능
	private String type;
	private String keyword;
	private String colName;
	
	
	
	
}

