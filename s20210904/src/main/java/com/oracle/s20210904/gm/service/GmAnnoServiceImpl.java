package com.oracle.s20210904.gm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.NoticeCom;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.comm.model.Scrap;
import com.oracle.s20210904.gm.dao.GmAnnoDao;


@Service
public class GmAnnoServiceImpl implements GmAnnoService {
	
	@Autowired
	private GmAnnoDao ad;

	@Override
	public int total() {
		System.out.println("GmAnnoServiceImpl total Start...");
		int totcnt = ad.total();
		System.out.println("GmAnnoServiceImpl total totcnt->"+totcnt);
		
		return totcnt;
	}

	@Override
	public List<ComAnnounce> listAnno(ComAnnounce comAnnounce) {
		
		List<ComAnnounce> annoList = null;
		System.out.println("GmAnnoServiceImpl listAnno Start...");
		annoList = ad.listAnno(comAnnounce);
		System.out.println("GmAnnoServiceImpl annoList.size"+annoList.size());
		
		return annoList;
	}

	@Override
	public ComAnnounce detail(String anno_code) {
		System.out.println("GmAnnoServiceImpl detail Start...");
		ComAnnounce comanno = null;
		comanno = ad.detail(anno_code);
		System.out.println("GmAnnoServiceImpl comanno.getCom_name()->"+comanno.getCom_name());
		
		return comanno;
	}
	/*
	@Override
	public List<Comm> recjob() {
		System.out.println("GmAnnoServiceImpl recjob Start...");
		List<Comm> recjob = ad.recjob();
		System.out.println("GmAnnoServiceImpl recjob.size()->"+recjob.size());
		
		return recjob;
	}
	*/
	// 공통 테이블에서 모집 직종 가져오기
	
		@Override
		public Comm recjob(ComAnnounce com) {
			System.out.println("GmAnnoServiceImpl recjob Start...");
			Comm comm = ad.recjob(com);
			System.out.println("GmAnnoServiceImpl recjob comm.getComm_ctx()"+comm.getComm_ctx());
			
			return comm;
		}
		
		/*
		// 모집 직종
		@Override
		public List<Comm> recjob(ComAnnounce com) {
			System.out.println("GmAnnoServiceImpl recjob Start...");
			List<Comm> recjob = ad.recjob(com);
			System.out.println("GmAnnoServiceImpl recjob.size()->"+recjob.size());
			
			return recjob;
		}
		*/
		// 고용형태
		
		@Override
		public Comm emptype(ComAnnounce com) {
			System.out.println("GmAnnoServiceImpl emptype Start...");
			Comm comm = ad.emptype(com);
			System.out.println("GmAnnoServiceImpl emptype comm.getComm_ctx()->"+comm.getComm_ctx());
			
			return comm;
		}
		
		 /*
		// 고용 형태
		@Override
		public List<Comm> emptype(ComAnnounce com) {
			System.out.println("GmAnnoServiceImpl emptype Start...");
			List<Comm> comm = ad.emptype(com);
			System.out.println("GmAnnoServiceImpl comm.getComm_ctx()->"+comm.size());
			
			return comm;
		}
		*/
		
		// 기술 스택1
		@Override
		public Comm Techtag1(ComAnnounce comanno) {
			System.out.println("GmAnnoServiceImpl Techtag1 Start...");
			Comm comm = ad.Techtag1(comanno);
			System.out.println("GmAnnoServiceImpl Techtag1 comm.getComm_ctx()->"+comm.getComm_ctx());
			
			return comm;
		}
		
		// 기술 스택2
			@Override
			public Comm Techtag2(ComAnnounce comanno) {
				System.out.println("GmAnnoServiceImpl Techtag2 Start...");
				Comm comm = ad.Techtag2(comanno);
				System.out.println("GmAnnoServiceImpl Techtag2 comm.getComm_ctx()->"+comm.getComm_ctx());
				
				return comm;
			}

			// 경력
			@Override
			public Comm career(ComAnnounce comanno) {
				System.out.println("GmAnnoServiceImpl career Start...");
				Comm comm = ad.career(comanno);
				System.out.println("GmAnnoServiceImpl career comm.getComm_ctx()->"+comm.getComm_ctx());
				
				return comm;
			}

			// 업종
			@Override
			public Comm comsec(ComAnnounce comanno) {
				System.out.println("GmAnnoServiceImpl comsec Start...");
				Comm comm = ad.comsec(comanno);
				System.out.println("GmAnnoServiceImpl comsec comm.getComm_ctx()->"+comm.getComm_ctx());
				
				return comm;
			}
			
			/*
			// 스크랩 추가
			@Override
			public Scrap scrap(String anno_code, String user_id) {
				System.out.println("GmAnnoServiceImpl scrap Start...");
				Scrap scrap = ad.scrap(anno_code, user_id);
				System.out.println("");
				return null;
			}
			*/
			
			// 스크랩 추가
			@Override
			public void likeinsert(Scrap scrap) {
				System.out.println("GmAnnoServiceImpl likeinsert Start...");
				ad.likeinsert(scrap);
			}
			
			// 스크랩 취소
			@Override
			public void likedelete(Scrap scrap) {
				System.out.println("GmAnnoServiceImpl likedelete Start...");
				ad.likedelete(scrap);
				
			}
			// 스크랩 유무 
			@Override
			public int likegetinfo(Scrap scrap) {
				System.out.println("GmAnnoServiceImpl likeinsert Start...");
				int itlike = ad.likegetinfo(scrap);
				System.out.println("Service like ->"+itlike);
				
				return itlike;
			}
			
			// 이력서 total
			@Override
			public int applytotal() {
				System.out.println("GmAnnoServiceImpl applytotal Start...");
				int tot = ad.applytotal();
				System.out.println("GmAnnoServiceImpl applytotal-> "+tot);
				
				return tot;
			}

			// 이력서 목록
			@Override
			public List<Resume> listres(Resume resume) { 
				List<Resume> resList = null;
				System.out.println("GmAnnoServiceImpl listres Start...");
				resList = ad.listres(resume);
				System.out.println("GmAnnoServiceImpl resList.size()->"+resList.size());
				
				return resList;
			}
			
			// 이력서 제출
			@Override
			public int applyResume(Apply apply) {
				System.out.println("GmAnnoServiceImpl applyResume Start...");
				int app = ad.applyResume(apply);
				
				return app;
			}
	
			// 이력서 지원 기록 있는지 check
			@Override
			public Apply checkRC(Apply apply) {
				System.out.println("GmAnnoServiceImpl checkRC Start...");
				Apply ap = ad.checkRC(apply);

				//System.out.println("Service ap.getAnno_code()->"+ap.getAnno_code());

				
				return ap;
			}

			// 이력서 추가
			@Override
			public int insertapplyDetail(Apply apply) {
				System.out.println("GmAnnoServiceImpl insertapplyDetail Start...");
				int result = ad.insertapplyDetail(apply);
				
				return result;
			}

			// 알림 추가
			@Override
			public void Noticeinesert(NoticeCom noticeCom) {
				System.out.println("GmAnnoServiceImpl Noticeinesert Start...");
				ad.Noticeinesert(noticeCom);
				
			}
	 
			@Override
			public List<ComAnnounce> listsearchAnno(ComAnnounce comAnnounce) {
				
				return ad.listsearchAnno(comAnnounce);
			}

			@Override
			public int searchtotal(String annosearch) {
				
				return ad.searchtotal(annosearch);
			}

			@Override
			public NoticeCom selectNc(Apply apply) {
				System.out.println("GmAnnoServiceImpl에서 selectNc실행 중..");
				NoticeCom noticecom = ad.selectNc(apply);
				
				return noticecom;
			}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
