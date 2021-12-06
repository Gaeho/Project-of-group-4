package com.oracle.s20210904.sh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.sh.dao.ShMemberDao;

@Service
public class ShMemberServiceImpl implements ShMemberService {

	@Autowired
	private ShMemberDao md;

	//개인 회원가입 
	@Override
	public int joinmember(Member member) {
		System.out.println("ShMemberrServiceImpl joinmember Start...");
		System.out.println("ShMemberServiceImpl member.getUser_id()->"+member.getUser_id());
		System.out.println("ShMemberServiceImpl member.getUser_pw()->"+member.getUser_pw());
		int joinmember = md.joinmember(member);
		//System.out.println("ShUserServiceImpl joinuser.getUser_name() "+);
		
		return joinmember;
	}
	
	//기업 회원가입
	@Override
	public int joincom(Company company) {
		System.out.println("ShMemberServiceImpl joincom Start...");
		int joincom = md.joincom(company);
		
		return joincom;
	}

	//개인 로그인
	@Override
	public int login(Member mem) {
		System.out.println("ShMemberServiceImpl mem Start... ");
		System.out.println("ShMemberServiceImpl mem.getUser_id()->" + mem.getUser_id());
		int loginCnt = md.login(mem);
		System.out.println("ShMemberServiceImpl login  loginCnt->" + loginCnt);
		
		return loginCnt;
	}

	//기업 로그인
	@Override
	public int Comlogin(Company com) {
		System.out.println("ShMemberServiceImpl com Start...");
		System.out.println("ShMemberServiceImpl com.getCom_id()->" + com.getCom_id());
		int ComloginCnt = md.Comlogin(com);
		
		return ComloginCnt;
	}
	//개인 회원 아이디 찾기 
	@Override
	public String findID(Member member) {
		System.out.println("ShMemberServiceImpl findIdForm Start..");
		System.out.println("ShMemberServiceImpl findIdForm getUser_name->"+member.getUser_name());
		System.out.println("ShMemberServiceImpl findIdForm getUser_email->"+member.getUser_email());
		String user_id = md.findID(member);
		return user_id;
	}
	//기업 회원 아이디 찾기
	@Override
	public String findID(Company company) {
		System.out.println("ShMemberServiceImpl findComIdForm Start....");
		System.out.println("ShMemberServiceImpl findComIdForm company.getCom_name()->" + company.getCom_name());
		System.out.println("ShMemberServiceImpl findComIdForm company.getCom_id()->" + company.getCom_user());
		System.out.println("ShMemberServiceImpl findComIdForm company.getCom_regnum()->" + company.getCom_regnum());
		System.out.println("ShMemberServiceImpl findComIdForm company.getCom_email()->" + company.getCom_email());
		String com_id = md.findID(company);
		
		return com_id;
	}
	//개인 회원 비밀번호 찾기 

	@Override
	public int tempSavePw(Member member) {
		int result = 0;
		System.out.println("ShMemberServiceImpl tempSavePw Start..");
		System.out.println("ShMemberServiceImpl tempSavePw member.getUser_id()->"+member.getUser_id());
		System.out.println("ShMemberServiceImpl tempSavePw member.getUser_pw()->"+member.getUser_pw());
		 result = md.tempSavePw(member);
		return result;
	}

	//기업 회원 비밀번호 찾기
	@Override
	public int tempComSavePw(Company company) {
		int result = 0; 
		System.out.println("ShMemberServiceImpl tempComSavePw Start...");
		System.out.println("ShMemberServiceImpl tempComSavePw company.getCom_id()->" + company.getCom_id());
		System.out.println("shMemberServiceImpl tempComSavePw company.getCom_user()->" +company.getCom_user());
		result = md.tempComSavePw(company);
		
		return result;
	}
	

	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 실패작들
	//개인 아이디찾기
//	@Override
//	public Member findId(Member mem) {
//		System.out.println("ShMemberServiceImpl mem Start...");
//		System.out.println("ShMemberServiceImpl mem.getUser_id()->" + mem.getUser_id());
//		Member findmemId = md.findId(mem);
//		
//		return findmemId;
//	}


	
	


	//개인 로그인 
//		@Override
//		public Member login(String user_id, String user_pw) {
//			System.out.println("ShMemberServiceImpl login Start...");
//			Member mem = md.login(user_id,user_pw);
//			System.out.println("ShMemberServiceImpl login mem.getUser_id()->"+mem.getUser_id());
//			
//			return mem;
//		}

	
	/*
	//로그인
	@Override
	public int login(Member member, Company company) {
		System.out.println("SHMemberServiceImpl login ");
		int login = md.login(member,company);
		return login;
	}
	
	*/
//	@Override
//	public Member findId(Map<String, Object> memberMap) {
//		System.out.println("ShMemberServiceImpl memberMap Start..");
//
//		String user_name = (String) memberMap.get("user_name");
//		String user_email = (String) memberMap.get("user_email");
//		Member member = md.findId(memberMap);
//		
//		return member;
//	}
}
