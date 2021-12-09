package com.oracle.s20210904.wk.model;

import java.sql.Date;

import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WkNotice {
	private String ntc_code;
	private String user_id;
	private String anno_code;
	private String ntc_ctg;
	
	
	//resume_contect
	@Transient
	private String com_id;
	@Transient
	private int res_code;
	@Transient
	private Date res_date;
//	@Transient
//	private String user_id;
//	private String ntc_code;
	
	// company

	@Transient
	private String com_name;
	@Transient
	private String com_addr;
	@Transient
	private String com_sec;
	
	// comm
	@Transient
	private String comm_ctx;
	
	// resume
	@Transient
	private String res_title;
	

}
