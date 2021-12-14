package com.oracle.s20210904.comm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeApplyAnno {

	//notice
	private String ntc_code;
	private String user_id;
	private String anno_code;
	private String ntc_ctg;
	private Date ntc_time;
	//apply
	private String apply_id;
	private String res_code; //공고에 지원한 이력서 code
	private String app_sts;
	private String read_res; //기업이 읽은 이력서 code
	//announce
	private String anno_title;
	private String com_id;
	private String com_name;
}
