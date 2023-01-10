package com.letearth.notice.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int not_no;
	private String mem_id;
	private int not_cat;
	private int not_middle;
	private String not_title;
	private String not_content;
	private String not_reply;
	private String not_file;
	private Timestamp not_date;
	private String not_pw;
	private int not_re_ref;
	private int not_re_lev;
	private int not_re_seq;
	private int not_viewcnt;
	
	private int not_count;
	private int pro_no;
}
