package com.letearth.prodetail.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProReplyVO {
	private Integer reply_no;
	private Integer pro_no;
	private String mem_id;
	private String reply_content;
	private String rereply_content;
	private Timestamp reply_date;
	private Integer reply_classify;
	private String reply_file;
	private Integer reply_category;
	
	private Integer mem_status;
	private String pro_title;
}
