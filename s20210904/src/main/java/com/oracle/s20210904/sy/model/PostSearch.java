package com.oracle.s20210904.sy.model;

import java.sql.Date;
import java.util.Arrays;

import com.oracle.s20210904.comm.service.Paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PostSearch extends Paging{
	
	public PostSearch(int total, String currentPage1) {
		super(total, currentPage1);
	}

	private int    post_code;      
	private String brd_code;       
	private String post_title;     
	private String post_ctx;      
	private Date   post_regdate;   
	private int    post_view;     
	private String post_file;      
	private String post_img;       
	private int    ref;            
	private int    ref_lev;		   
	private int    ref_step;	   
	private String user_id;        
	
	// Paging
	private int currentPage;
	private int totalPage;
	
	// Search
	private String searchType;
	private String[] typeArr;
	private String keyword;
	
	public void setSearchType(String searchType) {
	this.typeArr = searchType.split("");
	}
	
	@Override
	public String toString() {
		return "SySearch [currentPage=" + currentPage + ", totalPage=" + totalPage + ", keyword " + keyword + ", searchType=" + searchType
				+ ", typeArr=" + Arrays.toString(typeArr) + "]";
	}

	public void paging(int total, String currentPage2) {
		// TODO Auto-generated method stub
		
	}

}

