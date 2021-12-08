package com.oracle.s20210904.dj.model;

import java.sql.Date; //지우면 안됩니다~

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DjSearch {

	//announce
	private String anno_code;
	private String work_code;
	private String rec_job;
	private int    rec_vol;//
	private String rec_dtl;
	private int    emp_type;//
	private String career;
	private String rec_edu;//
	private int pay_info;
	private String work_cdt;
	private String etc_cdt;
	private String job_tag;
	private String tech_tag1;
	private String tech_tag2;
	private Date   anno_regdate;
	private Date   anno_c_regdate;
	private String anno_title;//

	
	//company
	private String com_id;//
	private String com_pw;
	private String com_name;//
	private String com_tel;//
	private String com_addr;//
	private String com_email;
	private String com_sec;
	private String com_bus;//
	private String com_regnum;
	private String com_mgr_tel;//
	private String com_web;//
	private String com_img;//
	private int com_grade;
	private String com_user;
	
	//comm
	private String main_cat;
	private String sub_cat;
	private String comm_ctx;
	private String jobgroup;//
	private String workex;	//
	private String employform;//
	
	// 조회용
    private String pageNum;
	private int start;
	private int end;
	
	//검색
	private String mainsearch;
	
	
}
