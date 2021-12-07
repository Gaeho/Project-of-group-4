package com.oracle.s20210904.comm.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Company {
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
	private String com_img1;
	private String com_img2;
	private String com_img3;
	private int com_grade;
	private String com_user;
	
	private int start;
	private int end;
}
