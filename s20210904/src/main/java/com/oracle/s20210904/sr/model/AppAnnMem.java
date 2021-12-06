package com.oracle.s20210904.sr.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class AppAnnMem {

	private String user_id;

	// apply
	private int res_code;
	private String conno_code;
	private String app_sts;
	private Date app_regdate;
	private String com_ntc_code;
	private String user_ntc_code;

	// member
	private String user_pw;
	private String user_name;
	private String user_sex;
	private String user_brh;
	private String user_edu;
	private String user_addr;
	private String user_tel;
	private String user_email;
	private String user_img;

	// announce
	private String anno_code;
	private String com_id;
	private String work_code;
	private String rec_job;
	private int rec_vol;
	private String rec_dtl;
	private int emp_type;
	private String career;
	private String rec_edu;
	private int pay_info;
	private String work_cdt;
	private String etc_cdt;
	private String job_tag;
	private String tech_tag1;
	private String tech_tag2;
	private Date anno_regdate;
	private Date anno_c_regdate;
	private String anno_title;

	// 조회
	private int start;
	private int end;
}
