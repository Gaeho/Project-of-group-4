package com.oracle.s20210904.sr.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.dao.SrComMypageDao;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.MemResumeBmark;

@Service
public class SrComMypageServiceImpl implements SrComMypageService {

	
	@Autowired
	private SrComMypageDao scmd;
	
	@Override
	public int total() {
		int totCnt = scmd.total();
		
		System.out.println("SrComMypageServiceImpl total START...");
		System.out.println("SrComMypageServiceImpl totCnt=>" + totCnt);
		
		return totCnt;
	}

	//기업정보
	@Override
	public CommCompany comInfo(CommCompany commCompany) {
		CommCompany commCompany1=null;
		System.out.println("SrComMypageServiceImpl comInfo START....");
		commCompany1=scmd.comInfo(commCompany);
		return commCompany1;
	}

	//채용공고 조인
	@Override
	public List<Announce> listAnnReg(Announce announce) {
		System.out.println("SrComMypageServiceImpl listAnnReg이 시작되었댱~~~");
		List<Announce> listAnnReg=scmd.listAnnReg(announce);
		System.out.println("SrComMypageServiceImpl listAnnReg CHECK....");
		return listAnnReg;
	}

	//채용공고 조인
	@Override
	public List<Announce> listAnnCReg(Announce announce) {
		System.out.println("SrComMypageServiceImpl listCAnnReg이 시작되었댱~~~");
		List<Announce> listAnnCReg=scmd.listAnnCReg(announce);
		System.out.println("SrComMypageServiceImpl listCAnnReg CHECK....");
		return listAnnCReg;
	}
	
	//지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemReg=scmd.appAnnMemReg(appAnnMem);
		return appAnnMemReg;
	}

	//지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemCReg=scmd.appAnnMemCReg(appAnnMem);
		return appAnnMemCReg;
	}
	
	//북마크회원
		@Override
		public List<Bookmark> listBmark1(Bookmark bookmark) {
			List<Bookmark> listBmark2 = null;
			System.out.println("SrComMypageServiceImpl listBmark가 시작되었댱~~~");
			listBmark2 = scmd.listBmark3(bookmark);
			System.out.println("SrComMypageServiceImpl memBmarkList.size()=>" + listBmark2.size());
			return listBmark2;
		}
		
		// 북마크 개인 상세
		@Override
		public Member userdetail(String user_id) {
			System.out.println("SrComMypageServiceImpl userdetail Start...");
			Member mem = scmd.userdetail(user_id);
			System.out.println("Service mem.getUser_name()->"+mem.getUser_name());
			System.out.println("Service mem.getUser_addr()->"+mem.getUser_addr());
		
			return mem;
		}

		// 공통 테이블에서 원하는 직종 가져오기
		@Override
		public Comm jobtag(Member mem) {
			System.out.println("SrComMypageServiceImpl jobtag Start...");
			Comm jobtag = scmd.jobtag(mem);
			System.out.println("SrComMypageServiceImpl jobtag.getComm_ctx()->"+jobtag.getComm_ctx());
			
			return jobtag;
		}

		// 북마크 유무
		@Override
		public int bookmarkgetinfo(Bookmark bookmark) {
			System.out.println("SrComMypageServiceImpl bookmarkgetinfo Start...");
			int getinfo = scmd.getinfo(bookmark);
			System.out.println("Service getinfo->"+getinfo);
			
			return getinfo;
		}

		// 북마크 추가
		@Override
		public void bookmarkinsert(Bookmark bookmark) {
			System.out.println("SrComMypageServiceImpl bookmarkinsert Start...");
			scmd.bookmarkinsert(bookmark);
			
		}

		// 북마크 삭제
		@Override
		public void bookmarkdelete(Bookmark bookmark) {
			System.out.println("SrComMypageServiceImpl bookmarkdelete Start...");
			scmd.bookmarkdelete(bookmark);
			
		}	
		
		//열람 기록 있는지 Check
		@Override
		public ResumeContect findRC(ResumeContect resumeContect) {
			System.out.println("SrComMypageServiceImpl findRC Start...");
			ResumeContect rc = scmd.findRC(resumeContect);
			return rc;
		}
		
		// 이력서열람 INSERT
		@Override
		public int insertResumeContect(ResumeContect resumeContect) {
			System.out.println("SrComMypageServiceImpl insertResumeContect Start...");
			int result =scmd.insertResumeContect(resumeContect);
			return result;
		}
		
		// 알림추가~
		@Override
		public void insertNotice(Notice notice) {
			System.out.println("SrComMypageServiceImpl insertNotice Start...");
			scmd.insertNotice(notice);
		}

		@Override
		public List<MemResumeBmark> memResumeBmarkList(String keyword1) {
			List<MemResumeBmark> memResumeBmarkList=scmd.memResumeBmarkList(keyword1);
			return memResumeBmarkList;
		}
		

	
}
