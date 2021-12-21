package com.oracle.s20210904.sr.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.Bookmark;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.MemBmark;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.model.CommResMemBook;
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
//	@Override
//	public List<Announce> listAnnReg(Announce announce) {
//		System.out.println("SrComMypageDaoImpl listAnnReg START....");
//		List<Announce> listAnnReg = session.selectList("SrComAnnReg", announce);
//		System.out.println(listAnnReg);
//		System.out.println("SrComMypageDaoImpl listAnnReg CHECK....");
//		return listAnnReg;
//	}
//
//	// 채용공고
//	@Override
//	public List<Announce> listAnnCReg(Announce announce) {
//		System.out.println("SrComMypageDaoImpl listAnnCReg START....");
//		List<Announce> listAnnCReg = session.selectList("SrComAnnCReg", announce);
//		System.out.println(listAnnCReg);
//		System.out.println("SrComMypageDaoImpl listAnnCReg CHECK....");
//		return listAnnCReg;
//	}



	// 지원현황 조인
	@Override
	public List<AppAnnMem> appAnnMemReg(AppAnnMem appAnnMem) {
		List<AppAnnMem> appAnnMemReg = null;
		try {
			appAnnMemReg = session.selectList("SrAppAnnMemReg", appAnnMem);
			System.out.println("SrComMypageDaoImpl AppAnnMemReg CHECK1=>" + appAnnMemReg.size());
			for (AppAnnMem appAnnMember1 : appAnnMemReg) {
				System.out.println("appAnnMember1.getApp_regdate()->" + appAnnMember1.getAnno_title());
				System.out.println("appAnnMember1.getUser_id()->" + appAnnMember1.getUser_id());
				System.out.println("appAnnMember1.getUser_img()->" + appAnnMember1.getUser_img());
				System.out.println("appAnnMember1.getAnno_code->" + appAnnMember1.getAnno_code());
			}
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
			for (AppAnnMem appAnnMember1 : appAnnMemCReg) {
				System.out.println("appAnnMember1.getApp_regdate()->" + appAnnMember1.getAnno_title());
				System.out.println("appAnnMember1.getUser_id()->" + appAnnMember1.getUser_id());
				System.out.println("appAnnMember1.getUser_img()->" + appAnnMember1.getUser_img());
				System.out.println("appAnnMember1.getAnno_code->" + appAnnMember1.getAnno_code());
			}
		} catch (Exception e) {
			System.out.println("appAnnMem error=>" + e.getMessage());
		}
		return appAnnMemCReg;
	}

		// 북마크 List

		@Override
		public List<MemResumeBmark> bookmarkList(MemResumeBmark memResumeBmark) {
			List<MemResumeBmark> bookmarkList = null;
			System.out.println("SrComMypageDaoImpl bookmarkList Start...");
			try {
				bookmarkList = session.selectList("BookMarkList", memResumeBmark);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl bookmarkList error"+e.getMessage());
			}
			return bookmarkList;
		}
	
		
		// 북마크 개인 상세
		@Override
		public CommResMemBook userdetail(CommResMemBook commResMemBook, Integer isResume) {
			System.out.println("4.SrComMypageDaoImpl userdetail Start...");
			CommResMemBook mem = null;
//			System.out.println("컨트롤러에서 넘어온 user_id=>"+mem.user_id);
//			System.out.println("컨트롤러에서 넘어온 mrk_res_code=>"+mrk_res_code);
			try {
				if(isResume != null && isResume == 1) {
					mem = session.selectOne("SrUserDetail2", commResMemBook);
				} else {
					mem = session.selectOne("SrUserDetail", commResMemBook);
				}
				System.out.println("5.SrComMypageDaoImpl mem.getUser_name()=>"+mem.getUser_name());
				System.out.println("5.SrComMypageDaoImpl mem.getUser_addr()=>"+mem.getUser_addr());
				System.out.println("5.SrComMypageDaoImpl mem.getJobTag()=>" + mem.getJobTag());
				System.out.println("5.SrComMypageDaoImpl mem.getHsMjr()=>" + mem.getHsMjr());
				System.out.println("5.SrComMypageCDaoImpl mem.getTag1()=>" + mem.getTag1());
				System.out.println("5.SrComMypageDaoImpl mem.getTag2()=>" + mem.getTag2());
				System.out.println("5.SrComMypageDaoImpl mem.getTag3()=>" + mem.getTag3());
				System.out.println("5.SrComMypageDaoImpl mem.getTag3()=>" + mem.getUniv_mjr());
			} catch (Exception e) {
				System.out.println("5.SrComMypageDaoImpl userdetail error"+e.getMessage());
			}
			
			return mem;
		}

		// 북마크 유무
		@Override
		public int getinfo(Bookmark bookmark) {
			System.out.println("8.SrComMypageDaoImpl getinfo Start...");
			int getinfo = 0;
			try {
				getinfo = session.selectOne("SrGetInfo", bookmark);
				System.out.println("9.SrGetInfo Dao"+getinfo);
			} catch (Exception e) {
				System.out.println("9.SrComMypageDaoImpl getinfo error"+e.getMessage());
			}
			return getinfo;
		}

		
		// 북마크 추가
		@Override
		public void bookmarkinsert(Bookmark bookmark) {
			System.out.println("SrComMypageDaoImpl bookmarkinsert Start...");
			System.out.println("북마크 추가 내용=>"+bookmark.getCom_id());
			System.out.println("북마크 추가 내용=>"+bookmark.getUser_id());
			System.out.println("북마크 추가 내용=>"+bookmark.getIt_bookmark());
			System.out.println("북마크 추가 내용=>"+bookmark.getMrk_res_code());
			try {
				session.insert("BookMarkInsert", bookmark);
				System.out.println("Dao.bookmark.getIt_bookmark()->"+bookmark.getIt_bookmark());
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl bookmarkinsert error"+e.getMessage());
			}
			
			
		}

		// 북마크 삭제
		@Override
		public void bookmarkdelete(Bookmark bookmark) {
			System.out.println("SrComMypageDaoImpl bookmarkdelete Start...");
			try {
				session.delete("BookMarkDelete", bookmark);
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
				result = session.insert("SrResumeContectInsert", resumeContect);
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
				session.insert("SrInsertNotice", notice);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl insertNotice error"+e.getMessage());
			}
		}



		@Override
		public List<MemResumeBmark> memResumeBmarkList(String keyword1){
			List<MemResumeBmark> memResumeBmarkList=null;
			try {
				memResumeBmarkList=session.selectList("SrMemResumeBmarkList", keyword1);
				for(MemResumeBmark aaa:memResumeBmarkList) {
					System.out.println("다오 aaa.getMrk_res_code()=>"+aaa.getMrk_res_code());
				}
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl memResumeBmarkList error=>"+e.getMessage());
			}
			return memResumeBmarkList;
		}


		@Override
		public Member member4(Member member) {
			Member member5=session.selectOne("SrComPWForComINfo", member);
			return member5;
		}


		@Override
		public List<Resume> userIdListbyResume(Resume resume) {
			List<Resume> resume2=session.selectList("SrUser_idListByResume", resume);
			return resume2;
		}


		@Override
		public CommMemResume comAppStatusListDetail(String user_id) {
			CommMemResume comAppStatusListDetail=session.selectOne("SrComAppStatusListDetail", user_id);
			return comAppStatusListDetail;
		}
		
		@Override
		public List<Announce> AnnounceList(String comid) {
			List<Announce> annoList = session.selectList("SrAnnoList",comid);
			return annoList;
		}
		
		@Override
		public int applyTotCnt(String anno_code) {
			int applyTotCnt = session.selectOne("SrApplyCnt",anno_code);
			return applyTotCnt;
		}
		
		@Override
		public void memFail(Apply apply) {
			session.update("SrMemFail",apply);
			
		}
		
		@Override
		public void memPass(Apply apply) {
			session.update("SrMemPass",apply);
		}

		@Override
		public void applyStsUpdate(Apply apply) {
			session.insert("ApplyStatusInsert",apply);
		}


		@Override
		public List<Announce> listAnn(Announce announce) {
			System.out.println("SrComMypageDaoImpl listAnnReg START....");
			System.out.println("다오 회사 아이디=>"+announce.getCom_id());
			List<Announce> listAnn = session.selectList("ComAnnounceList", announce);
			System.out.println(listAnn);
			System.out.println("사이즈~~~"+listAnn.size());
			for(Announce aaa:listAnn) {
				System.out.println("------------------------------");
				System.out.println("다오오오오오오옹"+aaa.getAnno_code());
				System.out.println("다오오오오오오옹"+aaa.getAnno_title());
				System.out.println("다오오오오오오옹"+aaa.getCom_bus());
				System.out.println("------------------------------");
			}
			System.out.println("SrComMypageDaoImpl listAnnReg CHECK....");
			return listAnn;
		}


		@Override
		public Bookmark bookmark(Bookmark bookmark) {
			Bookmark bookmark2=session.selectOne("CheckAfterBookMark", bookmark);
			return bookmark2;
		}
		
		@Override
		public void noticeDel(String ntc_code) {
			session.delete("NoticeDelete",ntc_code);
		}


		@Override
		public int comMyInfoUpdate(CommCompany commCompany) {
			System.out.println("SrComMypageDaoImpl comInfo UPDATE START...");
			int result=0;
			try {
				result=session.update("ComInfoUpdate", commCompany);
				System.out.println("rComMypageDaoImpl comInfo UPDATE 성공...?"+result);
			} catch (Exception e) {
				System.out.println("SrComMypageDaoImpl comInfo UPDATE ERROR..."+e.getMessage());
				result=0;
			}
			return result;
		}

		@Override
		public List<Comm> commList(Comm comm) {
			List<Comm> commList=session.selectList("CommListWithMAIN_CAT_050", comm);
			return commList;
		}
	
}
