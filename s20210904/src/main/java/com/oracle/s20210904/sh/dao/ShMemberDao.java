package com.oracle.s20210904.sh.dao;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;


public interface ShMemberDao {

	int joinmember(Member member);  //개인 회원가입
	int joincom(Company company); //기업 회원가입 
	int login(Member mem); //개인 로그인 
	int Comlogin(Company com); //기업 로그인 
	String findID(Member member); //개인 회원 아이디 찾기 
	String findID(Company company); //기업회원 아이디 찾기
	int tempSavePw(Member member); //개인 회원 비밀번호 찾기 
	int tempComSavePw(Company company); //기업 회원 비밀번호 찾기 
	int gradecheck(String com_id);
	
	
	
	
	

	
	
	//실패작들
	//Member login(String user_id, String user_pw);
	//Member findId(Member mem);//개인 아이디찾기 
	//Member findId(Map<String, Object> memberMap); 

}
