package com.oracle.s20210904.gm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeContect;
import com.oracle.s20210904.comm.model.Scrap;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.gm.service.GmAnnoService;

@Controller
public class GmAnnoListController {
	// 공고 List 컨트롤러
	
	private static final Logger logger = LoggerFactory.getLogger(GmAnnoListController.class);
	@Autowired
	private GmAnnoService as;

	/*
	@GetMapping(value="GmAnnoList")
	public String AdminMain() {
		return "gm/GmAnnoList";
	}
	*/
	
	//공고리스트
	@RequestMapping(value = "GmAnnoList")
	public String GmAnnoList(ComAnnounce comAnnounce, String currentPage, Model model,String annosearch) {
		System.out.println("GmAnnoListController Start List...");
		//원본토탈
		//int total = as.total();
		
		int total = 0;
		//띄어쓰기 제거
		if(annosearch!=null) {
			System.out.println("annosearch->"+annosearch);
			String annosearch1 = annosearch.replaceAll("\\s+","");
			total = as.searchtotal(annosearch1);
			System.out.println("변환된 annosearch1 내용->"+annosearch1);
			System.out.println("검색어 있을 때의 total->"+total);	
			comAnnounce.setAnnosearch(annosearch1);
			model.addAttribute("annosearch1", annosearch1);
		} else if (annosearch==null) {
			total = as.total();
			System.out.println("검색어 없을 때의 total->"+total);	
		}
		
		
		System.out.println("GmAnnoList total->"+total);
		System.out.println("GmAnnoList currentPage->"+currentPage);
		System.out.println("GmAnnoList getAnnosearch->"+comAnnounce.getAnnosearch());
		System.out.println("----------------------------------");
		
		// Paging
		Paging pg = new Paging(total, currentPage);
		comAnnounce.setStart(pg.getStart()); // 1 
		comAnnounce.setEnd(pg.getEnd()); // 5
		
		System.out.println("GmAnnoListController GmAnnoList Start...");
		List<ComAnnounce> listAnno = as.listAnno(comAnnounce); // (Paging이 포함된) Announcr 파라미터 가지고 service 단으로 이동
		
		System.out.println("GmAnnoListController GmAnnoList listAnno.size->"+listAnno.size());
		System.out.println("---------------------------------------------------------------");
		for(ComAnnounce comanno : listAnno) {
			System.out.println("---------GmAnnoList Start -------------");
			System.out.println("comanno.getCom_name()-> "+comanno.getCom_name());
			System.out.println("comanno.getCom_id()->"+comanno.getCom_id());
			System.out.println("comanno.getAnno_code()->"+comanno.getAnno_code());
			System.out.println("comanno.getAnno_title()-> "+comanno.getAnno_title());
			System.out.println("----------GmAnnoList End------------------");
			
		}
		
		model.addAttribute("total", total);
		model.addAttribute("listAnno", listAnno);
		model.addAttribute("pg", pg);
		System.out.println("저장됨");
		
		return "gm/GmAnnoList";
		
	}
	
	
	
	
	
	
	@GetMapping(value = "detail")
	public String detail(String anno_code, ComAnnounce com, Model model) {
		
		String user_id ="dmdtla054";
		
		System.out.println("GmAnnoListController detail Start...");
		System.out.println("anno_code->"+anno_code);
		ComAnnounce comanno = as.detail(anno_code);
		model.addAttribute("comanno", comanno);
		System.out.println("----------------------------------------");
		System.out.println("comanno.getCom_name()-> "+comanno.getCom_name());
		System.out.println("comanno.getCom_id()->"+comanno.getCom_id());
		System.out.println("comanno.getAnno_code()->"+comanno.getAnno_code());
		System.out.println("comanno.getAnno_title()-> "+comanno.getAnno_title());
		System.out.println("comanno.getJob_tag()-> "+comanno.getJob_tag());
		System.out.println("----------------------------------------");
		
		// 스크랩 유무
		Scrap scrap = new Scrap();
		scrap.setAnno_code(anno_code);
		scrap.setUser_id(user_id);
		
		int itlike = as.likegetinfo(scrap);
		model.addAttribute("itlike",itlike);
		
		
		// 공통 테이블에서 값 가져오기
		// 모집 직종 
		
		System.out.println("GmAnnoListController recjob Start...");
		Comm recjob = as.recjob(comanno);
		System.out.println("GmAnnoListController recjob.getComm_ctx()->"+recjob.getComm_ctx());
		model.addAttribute("recjob", recjob);
		System.out.println("------------------------------------");
		
		/*
		System.out.println("GmAnnoListController recjob Start...");
		List<Comm> recjob = as.recjob(com);
		System.out.println("GmAnnoListController recjob.size()->"+recjob.size());
		model.addAttribute("recjob", recjob);
		*/
		
		// 고용형태
		System.out.println("GmAnnoListController emptype Start...");
		Comm emptype = as.emptype(comanno);
		System.out.println("GmAnnoListController emptype.getComm_ctx()->"+emptype.getComm_ctx());
		model.addAttribute("emptype", emptype);
		System.out.println("------------------------------------");
		
		/*
		System.out.println("GmAnnoListController emptype Start...");
		List<Comm> emptype = as.emptype(com);
		System.out.println("GmAnnoListController emptype.getComm_ctx()->"+emptype.size());
		model.addAttribute("emptype", emptype);
		*/
		
		// 기술 스택 1
		System.out.println("GmAnnoListController Techtag1 Start...");
		Comm Techtag1 = as.Techtag1(comanno);
		System.out.println("GmAnnoListController Techtag1.getComm_ctx() "+Techtag1.getComm_ctx());
		model.addAttribute("Techtag1", Techtag1);
		System.out.println("------------------------------------");
		
		// 기술 스택 2
		System.out.println("GmAnnoListController Techtag2 Start...");
		Comm Techtag2 = as.Techtag2(comanno);
		System.out.println("GmAnnoListController Techtag2.getComm_ctx() "+Techtag2.getComm_ctx());
		model.addAttribute("Techtag2", Techtag2);
		System.out.println("------------------------------------");
		
		// 경력
		System.out.println("GmAnnoListController career Start...");
		Comm career = as.career(comanno);
		System.out.println("GmAnnoListController career.getComm_ctx()-> "+career.getComm_ctx());
		model.addAttribute("career", career);
		System.out.println("------------------------------------");
		
		// 업종
		System.out.println("GmAnnoListController comsec Start...");
		Comm comsec = as.comsec(comanno);
		System.out.println("GmAnnoListController comsec.getComm_ctx()->"+comsec.getComm_ctx());
		model.addAttribute("comsec", comsec);
		System.out.println("------------------------------------");
		
		return "gm/GmAnnoDetail";
			
	}
	
	/*
	// 스크랩
		@GetMapping(value = "scrap")
		public String scrap (String anno_code, String user_id) {
			System.out.println("GmAnnoListController scrap Start...");
			Scrap scrap = as.scrap(anno_code, user_id);
			System.out.println("GmAnnoListController scrap.getAnno_code()->"+scrap.getAnno_code());
			
			return "gm/scrap";
			
		}
	*/	
		
		// 스크랩
		@RequestMapping(value = "scrap", produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String scrap (String anno_code, String user_id, int it_like, Model model) {
			System.out.println("GmAnnoListController scrap Start...");
			
			Scrap scrap = new Scrap();
			scrap.setAnno_code(anno_code);
			scrap.setUser_id(user_id);
			
			System.out.println("GmAnnoListController scrap anno_code->"+anno_code);
			System.out.println("GmAnnoListController scrap user_id->"+user_id);
			System.out.println("GmAnnoListController scrap it_like->"+it_like);
			
			/* int check = as.likecnt(scrap); */
			String imgSrc = null; // ajax로 리턴 될 놈 ex)img에 들어갈 src
			
			if (it_like == 0) { 		// 스크랩하기
				as.likeinsert(scrap);
				imgSrc = "스크랩취소IMGSRC";
			} else if (it_like == 1) { 	// 스크랩취소
				as.likedelete(scrap);
				imgSrc = "스크랩하기IMGSRC";
			}

			return imgSrc;

		 }
		
		// 이력서 List
		@RequestMapping(value = "GmApplyList")
		public String apply(Resume resume, String anno_code, String currentPage, Model model) {
			System.out.println("GmAnnoListController apply Start List...");
			int tot = as.applytotal();
			System.out.println("applyList tot->"+tot);
			System.out.println("----------------------------------");
			
			// Paging
			Paging pg = new Paging(tot, currentPage);
			resume.setStart(pg.getStart()); // 1 
			resume.setEnd(pg.getEnd()); // 5
			
			ComAnnounce comanno = new ComAnnounce();
			comanno.setAnno_code(anno_code);
			
			System.out.println("GmAnnoListController applyList Start...");
			System.out.println("GmAnnoListController applyList anno_code->"+comanno.getAnno_code());
			String user_id = "";
			List<Resume> listres = as.listres(resume); 
			
			System.out.println("GmAnnoListController applyList listres.size->"+listres.size());
			for(Resume res : listres) {
				if (user_id.isEmpty()) { // user_id 값이 없을 때 
					user_id = res.getUser_id();
					System.out.println("GmAnnoListController user_id->"+user_id);
				}
				System.out.println("---------applyList Start -------------");
				System.out.println("res.getUser_id()->"+res.getUser_id());
				System.out.println("res.getRes_title()-> "+res.getRes_title());
				System.out.println("res.getRes_date()->"+res.getRes_date());
				System.out.println("----------applyList End------------------");
				
			}
			
			model.addAttribute("tot", tot);
			model.addAttribute("listres", listres);
			model.addAttribute("pg", pg);
			model.addAttribute("anno_code", anno_code); // 따로 가져온 값들을 저장해서 넘겨야함
			model.addAttribute("user_id", user_id); // 따로 가져온 값들을 저장해서 넘겨야함
			
			return "gm/GmApplyList";
			
		}
		
		// 이력서 제출
		@GetMapping(value = "applyResume")
		public String applyResume (Apply apply,  Model model) {
			System.out.println("GmAnnoListController applyResume Start...");
			System.out.println("GmAnnoListController applyResume apply.getRes_code()->"+apply.getRes_code());
			System.out.println("GmAnnoListController applyResume apply.getAnno_code()->"+apply.getAnno_code());
			System.out.println("GmAnnoListController applyResume apply.getUser_id()"+apply.getUser_id());
			// 1. 지원자 user_id, res_code, anno_code, app_sts(065-001), app_regdate(sysdate), com_ntc_code(sequence), user_ntc_code(회원알림 null)
			int app = as.applyResume(apply);
			
			model.addAttribute("apply", apply);
			

			
			return "gm/result";
			
		}
		
		// 알림
		@GetMapping(value = "applyDetail")
		public String applyDetail(Apply apply,Model model) {
			System.out.println("GmAnnoListController applyDetail Start...");
			insertapplyDetail(apply);
			apply = as.checkRC(apply);
			System.out.println("GmAnnoListController applyDetail apply.getAnno_code()->"+apply.getAnno_code());
			
			model.addAttribute("apply", apply);
			System.out.println("여기까지 왔어?");
			
			return "gm/GmApplyDetail";
			
		}
		
		// 지원 이력서 확인
		public int insertapplyDetail(Apply apply) {
			
			String user_id ="siasia54";
			System.out.println("insertapplyDetail apply.getUser_id()->"+apply.getUser_id());
			System.out.println("insertapplyDetail apply.getAnno_code()->"+apply.getAnno_code());
			
			int result = 0;
			// 지원 이력서 존재하는지 ~ 없으면 null~
			System.out.println("GmAnnoListController checkRC Start...");
			Apply ap = as.checkRC(apply);
			// 없으면 insert~
			if(ap == null) {
				result = as.insertapplyDetail(apply);
				// insert 확인  성공시 1, 성공했으면 알림 추가~
				if(result == 1) {
					ap = as.checkRC(apply);
					Notice notice = new Notice();
					notice.setUser_id(ap.getUser_id());
					notice.setAnno_code(ap.getAnno_code());
					notice.setNtc_ctg("001");
					notice.setNtc_code(ap.getCom_ntc_code());
					as.Noticeinesert(notice);
				}
			}
			return result;
			
		}
	
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
