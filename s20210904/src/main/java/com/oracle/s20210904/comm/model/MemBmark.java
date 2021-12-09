package com.oracle.s20210904.comm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemBmark {
	
	//comm
	private String user_id;
	
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
	
	//bookmark
	private String com_id;
	private Date mrk_date;
	private int it_bookmark;
	
	
	//조회용
	private int start;
	private int end;

}
