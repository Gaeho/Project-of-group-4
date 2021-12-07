package com.oracle.s20210904.sr.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommMemResume {
	
	private String user_id;
	
	//comm
	private String main_cat;
	private String sub_cat;
	private String comm_ctx;
	
	//member
	private String user_pw;
	private String user_name;
	private String user_sex;
	private String user_brh;
	private String user_edu;
	private String user_addr;
	private String user_tel;
	private String user_email;
	private String user_img;
	
	
	//resume
	private int res_code;
	private String res_sts;
	private String rep_res;
	private String res_title;
	private String res_email;
	private String res_img;
	private String hs_name;
	private String hs_mjr;
	private String univ_name;
	private String univ_date;
	private String univ_mjr;
	private String cov_let;
	private Date res_date;
	private String res_tag1;
	private String res_tag2;
	private String res_tag3;
	private String res_etc_link;
	private String res_etc_file;
	
	//조회
	private int start;
	private int end;

}
