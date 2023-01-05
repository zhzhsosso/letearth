package com.letearth.prodetail.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProReportVO {
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
	
}
