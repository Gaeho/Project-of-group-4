package com.oracle.s20210904.sr.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.MemResumeBmark;

@Repository
public class SrComMypageDaoImpl implements SrComMypageDao {

	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		int tot = 0;
		System.out.println("SrComMypageDaoImpl total 시작!!");
		try {
			tot = session.selectOne("SrComTotal");
		} catch (Exception e) {
			System.out.println("SrComMypageDaoImpl total 작동오류=>" + e.getMessage());
		}

		return tot;
	}

	
	// 기업정보
	@Override
	public CommCompany comInfo(CommCompany commCompany) {
		CommCompany commCompany1 = null;
		System.out.println("SrComMypageDaoImpl comInfo START....");
		try {
			commCompany1 = session.selectOne("SrComInfo", commCompany);
			System.out.println("SrComMypageDaoImpl comInfo CHECK=>" + commCompany1);
		} catch (Exception e) {
			System.out.println("SrComMypageDaoImpl comInfo error" + e.getMessage());
		}

		return commCompany1;
	}

	// 채용공고
	@Override
	public List<Announce> listAnnReg(Announce announce) {
		System.out.println("SrComMypageDaoImpl listAnnReg START....");
		List<Announce> listAnnReg = session.selectList("SrComAnnReg", announce);
		System.out.println(listAnnReg);
		System.out.println("SrComMypageDaoImpl listAnnReg CHECK....");
		return listAnnReg;
	}

	// 채용공고
	@Override
	public List<Announce> listAnnCReg(Announce announce) {
		System.out.println("SrComMypageDaoImpl listAnnCReg START....");
		List<Announce> listAnnCReg = session.selectList("SrComAnnCReg", announce);
		System.out.println(listAnnCReg);
		System.out.println("SrComMypageDaoImpl listAnnCReg CHECK....");
		return listAnnCReg;
	}



	// 지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemReg = null;
		try {
			appAnnMemReg = session.selectList("SrAppAnnMemReg", appAnnMem);
			System.out.println("SrComMypageDaoImpl AppAnnMemReg CHECK1=>" + appAnnMemReg.size());
		} catch (Exception e) {
			System.out.println("appAnnMem error=>" + e.getMessage());
		}

		return appAnnMemReg;
	}

	// 지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemCReg(AppAnnMem appAnnMem) {

		List<AppAnnMem> appAnnMemCReg = null;
		System.out.println(appAnnMem.getStart());
		System.out.println(appAnnMem.getEnd());
		try {
			appAnnMemCReg = session.selectList("SrAppAnnMemCReg", appAnnMem);
			System.out.println(appAnnMemCReg);
//			  System.out.println("SrComMypageDaoImpl AppAnnMemCReg CHECK2=>"+appAnnMemCReg.size());
		} catch (Exception e) {
			System.out.println("appAnnMem error=>" + e.getMessage());
		}
		return appAnnMemCReg;
	}

	//북마크회원
		@Override
		public List<Bookmark> listBmark3(Bookmark bookmark) {
			
			System.out.println("SrComMypageDaoImpl listBmark 시작!!");
			List<Bookmark> listBmark4=null;
			try {
				listBmark4 = session.selectList("SrMemBmarkList", bookmark);
				System.out.println("SrComMypageDaoImpl listBmark listBmark.size"+listBmark4.size());
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl listBmark 오류"+e.getMessage());
			}
			return listBmark4;
		}
		
		// 북마크 개인 상세
		@Override
		public Member userdetail(String user_id) {
			System.out.println("SrComMypageDaoImpl userdetail Start...");
			Member mem = null;
			try {
				mem = session.selectOne("SrUserDetail", user_id);
				System.out.println("Dao mem.getUser_name()->"+mem.getUser_name());
				System.out.println("Dao mem.getUser_addr()->"+mem.getUser_addr());
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl userdetail error"+e.getMessage());
			}
			
			return mem;
		}

		// 공통 테이블에서 원하는 직종 가져오기
		@Override
		public Comm jobtag(Member mem) {
			System.out.println("SrComMypageDaoImpl jobtag Start...");
			Comm jobtag = null;
			try {
				jobtag = session.selectOne("SrJobTag", mem);
				System.out.println("Dao jobtag.getComm_ctx()->"+jobtag.getComm_ctx());
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl jobtag error"+e.getMessage());
			}
			return jobtag;
		}

		// 북마크 유무
		@Override
		public int getinfo(Bookmark bookmark) {
			System.out.println("SrComMypageDaoImpl getinfo Start...");
			int getinfo = 0;
			try {
				getinfo = session.selectOne("SrGetInfo", bookmark);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl getinfo error"+e.getMessage());
			}
			return getinfo;
		}

		
		// 북마크 추가
		@Override
		public void bookmarkinsert(Bookmark bookmark) {
			System.out.println("SrComMypageDaoImpl bookmarkinsert Start...");
			try {
				session.insert("SrBminsert", bookmark);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl bookmarkinsert error"+e.getMessage());
			}
			
			
		}

		// 북마크 삭제
		@Override
		public void bookmarkdelete(Bookmark bookmark) {
			System.out.println("SrComMypageDaoImpl bookmarkdelete Start...");
			try {
				session.delete("SrBmdelete", bookmark);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl bookmarkdelete error"+e.getMessage());
			}
			
		}

		//열람 기록 있는지 Check 
		@Override
		public ResumeContect findRC(ResumeContect resumeContect) {
			System.out.println("SrComMypageDaoImpl findRC Start...");
			ResumeContect rc = null;
			try {
				rc = session.selectOne("SrFindRC",resumeContect);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl findRC error"+e.getMessage());
			}
			return rc;
		}
		
		// 이력서 열람 INSERT
		@Override
		public int insertResumeContect(ResumeContect resumeContect) {
			System.out.println("SrComMypageDaoImpl insertResumeContect Start...");
			int result = 0;
			try {
				result = session.delete("SrResumeContectInsert", resumeContect);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl SrComMypageDaoImpl error"+e.getMessage());
			}
			return result;
		}
		
		//알림 추가~
		@Override
		public void insertNotice(Notice notice) {
			System.out.println("SrComMypageDaoImpl insertNotice Start...");
			try {
				session.delete("SrInsertNotice", notice);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl insertNotice error"+e.getMessage());
			}
		}


		@Override
		public List<MemResumeBmark> memResumeBmarkList(String keyword1) {
			List<MemResumeBmark> memResumeBmarkList=null;
			try {
				memResumeBmarkList=session.selectList("SrMemResumeBmarkList", keyword1);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl memResumeBmarkList error=>"+e.getMessage());
			}
			return memResumeBmarkList;
		}
	
	
	
	
	
}
