package com.oracle.s20210904.sr.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommCompany {
	
	//comm
	private String main_cat;
	private String sub_cat;
	private String comm_ctx;

	//company
	private String com_id;
	private String com_pw;
	private String com_name;
	private String com_tel;
	private String com_addr;
	private String com_email;
	private String com_sec;
	private String com_bus;
	private String com_regnum;
	private String com_mgr_tel;
	private String com_web;
	private String com_img;
	private int com_grade;
	
	//조회용
	private int start;
	private int end;
}
