package com.oracle.s20210904.comm.model;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Post {
	private int    post_code;      // 게시글 번호
	private String brd_code;       // 게시판 분류 번호
	private String post_title;     // 게시글 제목
	private String post_ctx;       // 게시글 내용
	private Date   post_regdate;   // 게시글 작성일
	private int    post_view;      // 게시글 조회
	private String post_file;      // 게시글 첨부파일
	private String post_img;       // 게시글 첨부이미지
	private int    ref;            // 답글 그룹
	private int    ref_lev;		   // 답글 깊이
	private int    ref_step;	   // 답글 그룹 내 순번
	private String user_id;        // 회원 ID
	
	// Paging
	private int pageNum;
	private int start;
	private int end;
	
	// Search
	private String searchText;
	
	// Reply
	public void PostReply(int ref, int post_code, int ref_step, String ref_ctx) {
	this.ref = ref;
	this.post_code = post_code;
	this.ref_step = ref_step;
	}
}



