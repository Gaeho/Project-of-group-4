package com.oracle.s20210904.sh.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;


@Repository
public class ShMemberDaoImpl implements ShMemberDao {

	@Autowired
	private SqlSession session;
	
	//개인 회원가입 
	@Override
	public int joinmember(Member member) {
		int joinmember= 0;
		System.out.println("ShMemberDaoImpl joinmember Start...");
		try {
			 member.setUser_img(""); //이미지는 null값
			System.out.println("ShMemberDaoImpl joinmember.getUser_id()->"+member.getUser_id());
			System.out.println("ShMemberDaoImpl joinmember.getUser_pw()->"+member.getUser_pw());
			joinmember = session.insert("ShJoinMember", member);
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl joinmember Exception-> "+e.getMessage());
		}
		return joinmember;
	}

	//기업 회원가입
	@Override
	public int joincom(Company company) {
		int joincom = 0;
		System.out.println("ShMemberDaoImpl joincom Start...");
		try {
			company.setCom_bus(""); //사업  null값
			company.setCom_tel(""); //기업전화번호 null값 
			company.setCom_web(""); //기업 홈페이지  null값
			company.setCom_logo("");//기업 이미지  null값
			System.out.println("ShMemberDaoImpl company.getCom_id()->"+company.getCom_id());
			System.out.println("ShMemberDaoImpl company.getCom_pw()->"+company.getCom_pw());
			joincom=session.insert("ShJoinCompany" , company);
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl joincom Exception->" + e.getMessage());
		}
		return joincom;
	}

	//개인 로그인 
	@Override
	public int login(Member mem) {
		int loginCnt = 0;
		System.out.println("ShMemberDaoImpl login Start...");
		try {
			System.out.println("ShMemberDaoImpl mem.getUser_id()->" + mem.getUser_id());
			System.out.println("ShMemberDaoImpl mem.getUser_pw()->" + mem.getUser_pw());
			loginCnt = session.selectOne("ShLogin", mem);
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl login Exception->" + e.getMessage());
		}
		System.out.println("ShMemberDaoImpl loginCnt->" + loginCnt);
		return loginCnt;
	}

	//기업 로그인 
	@Override
	public int Comlogin(Company com) {
		int ComloginCnt = 0; 
		System.out.println("ShMemberDaoImpl Comlogin Start...");
		try {
			System.out.println("ShMemberDaoImpl com.getCom_id()->" + com.getCom_id());
			ComloginCnt = session.selectOne("ShComLogin",com);
		} catch (Exception e) {
		System.out.println("ShMemberDaoImpl Comlogin Exception->" + e.getMessage());
		}
		return ComloginCnt;
	}

	//개인 회원 아이디 찾기 
	@Override
	public String findID(Member member) {
		System.out.println("ShMemberDaoImpl findId Start..");
		System.out.println("ShMemberDaoImpl findId getUser_name->"+member.getUser_name());
		System.out.println("ShMemberDaoImpl findId getUser_email->"+member.getUser_email());
		String user_id = "";
		try {
			user_id = session.selectOne("ShFindId",member);
			if (user_id ==null) user_id = "존재하는 아이디가 없네요 ㅠㅠ 회원가입 먼저 하실래요?";
			System.out.println("ShMemberDaoImpl findId user_id->"+user_id);
		} catch (Exception e) {
		System.out.println("ShMemberDaoImpl findId Exception->" + e.getMessage());
		}
	return user_id;
	}
	//기업 회원 아이디 찾기 
	@Override
	public String findID(Company company) {
		System.out.println("ShMemberDaoImpl findComId Start..");
		System.out.println("ShMemberDaoImpl findCom company.getCom_name()->"+company.getCom_name());
		System.out.println("ShMemberDaoImpl findCom company.getCom_user()->"+company.getCom_user());
		System.out.println("ShMemberDaoImpl findCom company.getCom_regnum()->"+company.getCom_regnum());
		String com_id = "";
		
		try {
			com_id = session.selectOne("ShFindComId", company);
			if(com_id == null) com_id = "존재하는 아이디가 없네요 ㅠㅠ 회원가입 먼저 하실래요?";
					System.out.println("ShMemberDaoImpl findComId com_id->"+com_id);
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl findComId Exception->" + e.getMessage());
		}
	 return com_id;
	}

	//개인 회원 비밀번호 찾기 
	@Override
	public int tempSavePw(Member member) {
		int result = 0;
		System.out.println("ShMemberDaoImpl tempSavePw Start..");
		System.out.println("ShMemberDaoImpl tempSavePw member.getUser_id()->"+member.getUser_id());
		System.out.println("ShMemberDaoImpl tempSavePw member.getUser_pw()->"+member.getUser_pw());
		// int  result = md.tempSavePw(member);
		try {
			result = session.update("ShFindPw",member);
			if (result>0)		System.out.println("ShMemberDaoImpl ShFindPw 수정 성공");
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl ShFindPw Exception->" + e.getMessage());
		}

		return result;
	}

	//기업 회원 비밀번호 찾기 
	@Override
	public int tempComSavePw(Company company) {
		int result = 0; 
		System.out.println("ShMemberDaoImpl tempComSavePw Start...");
		System.out.println("ShMemberDaoImpl tempComSavePw company.getCom_id()->" + company.getCom_id());
		System.out.println("ShMemberDaomImpl tempComSavePw company.getCom_user()->" + company.getCom_user());
		try {
			result = session.update("ShFindComPw" , company);
			if (result > 0) System.out.println("ShMemberDaoImpl ShFindComPw 수정 성공 ");
		} catch (Exception e) {
			System.out.println("ShMemberDaoImpl ShFindComPw Exception - > "+ e.getMessage());
		}
		
		return result;
	}

	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//실패작들
//	//개인 아이디 찾기
//	@Override
//	public Member findId(Member mem) {
//		Member findmemId = new Member();
//		System.out.println("ShMemberDaoImpl findId Start...");
//		try {
//			System.out.println("ShMemberDaoImpl mem.getUser_id()->"+ mem.getUser_id());
//			findmemId = session.selectOne("ShFindId" , mem);
//		} catch (Exception e) {
//		System.out.println("ShMemberDaoImpl findId Exception->" + e.getMessage());
//		}
//		return findmemId;
//	}



	
	
	//HashMap 써본거 
	//개인로그인
//		@Override
//		public Member login(String user_id,String user_pw) {
//			Map<String ,String> mem = null;
//			System.out.println("ShMemberDaoImpl login Start...");
//			try {
//				mem = session.selectMap("ShLogin",user_id,user_pw);
//				//System.out.println("ShMemberDaoImpl login mem.getUser_id()->"+mem.getUser_id());
//			} catch (Exception e) {
//				System.out.println("ShMemberDaoImpl login Exception->" + e.getMessage());
//			}
//			return (Member) mem;
//		}
//	
	//개인 아이디찾기
//		@Override
//		public Member findId(Map<String, Object> memberMap) {
//		
//			
//				return session.selectOne("MEMBER.findId", memberMap);
//
//		}


}
