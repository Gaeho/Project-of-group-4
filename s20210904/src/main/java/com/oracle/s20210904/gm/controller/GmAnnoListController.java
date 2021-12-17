package com.oracle.s20210904.gm.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Apply;
import com.oracle.s20210904.comm.model.ComAnnounce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Notice;
import com.oracle.s20210904.comm.model.NoticeCom;
import com.oracle.s20210904.comm.model.Resume;
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
	
	private String check_userid(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mbid");
		//user_id의 항목이 넘어오기 때문에 기업(com_id)이 이 페이지를 로드하려고 하면 메인으로 튕길 것
			
		if(id==null || id.equals("")){              
			return "/Main"; //여기 다시 조정할 것
		}
		
		return id;
	}
	
	@RequestMapping(value = "GmAnnoList")
	public String GmAnnoList(HttpServletRequest request, ComAnnounce comAnnounce, String annosearch, String currentPage, Model model) {
		System.out.println("GmAnnoListController Start List...");
		
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
		
		System.out.println("----------------------------------");
		
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
		System.out.println("GmAnnoList total->"+total);
		System.out.println("----------------pg 내부 확인하자-------------------");
		System.out.println("pg.getCurrentPage()->"+pg.getCurrentPage());
		System.out.println("pg.getStart()->"+pg.getStart());
		System.out.println("pg.getEnd()->"+pg.getEnd());
		System.out.println("pg.getStartPage()->"+pg.getStartPage());
		System.out.println("pg.getEndPage()->"+pg.getEndPage());
		System.out.println("pg.getPageBlock()->"+pg.getPageBlock());
		System.out.println("pg.getRowPage()->"+pg.getRowPage());
		System.out.println("pg.getgetTotal()->"+pg.getTotal());
		System.out.println("pg.getTotalPage()->"+pg.getTotalPage());
		System.out.println("--------------------------------------");
		
		
		model.addAttribute("total", total);
		model.addAttribute("listAnno", listAnno);
		model.addAttribute("pg", pg);
		System.out.println("저장됨");
		
		return "gm/GmAnnoList";
		
	}
	
	@GetMapping(value = "detail")
	public String detail(HttpServletRequest request, String anno_code, ComAnnounce com, Model model) {
		
		//String user_id ="dmdtla054";
		String id=check_userid(request);
		System.out.println("세션 확인 아이디를 갖고오는지->"+id);
		
		System.out.println("GmAnnoListController detail Start...");
		System.out.println("anno_code->"+anno_code);
		ComAnnounce comanno = as.detail(anno_code);
		model.addAttribute("comanno", comanno);
		System.out.println("----------------------------------------");
		System.out.println("comanno.getCom_name()-> "+comanno.getCom_name());
		System.out.println("comanno.getAnno_code()->"+comanno.getAnno_code());
		System.out.println("comanno.getAnno_title()-> "+comanno.getAnno_title());
		System.out.println("comanno.getJob_tag()-> "+comanno.getJob_tag());
		System.out.println("----------------------------------------");
		
		// 스크랩 유무
		Scrap scrap = new Scrap();
		scrap.setAnno_code(anno_code);
		scrap.setUser_id(id);
		
		System.out.println("GmAnnoListController likegetinfo Start...");
		int itlike = as.likegetinfo(scrap);
		model.addAttribute("itlike",itlike);
		
		
		// 공통 테이블에서 값 가져오기
		// 모집 직종 
		
		System.out.println("GmAnnoListController recjob Start...");
		Comm recjob = as.recjob(comanno);
		System.out.println("GmAnnoListController recjob.getComm_ctx()->"+recjob.getComm_ctx());
		model.addAttribute("recjob", recjob);
		System.out.println("------------------------------------");
		
		// 고용형태
		System.out.println("GmAnnoListController emptype Start...");
		Comm emptype = as.emptype(comanno);
		System.out.println("GmAnnoListController emptype.getComm_ctx()->"+emptype.getComm_ctx());
		model.addAttribute("emptype", emptype);
		System.out.println("------------------------------------");
		
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
		public String apply(HttpServletRequest request, Resume resume, String anno_code, String currentPage, Model model) {
			
			String id=check_userid(request);
			System.out.println("세션 확인 아이디를 갖고오는지->"+id);
			
			System.out.println("GmAnnoListController apply Start List...");
			int tot = as.applytotal();
			System.out.println("applyList tot->"+tot);
			System.out.println("----------------------------------");
				
			System.out.println("GmAnnoListController applyList Start...");
			System.out.println("GmAnnoListController applyList resume.getUser_id()->"+resume.getUser_id());
			
			String user_id = "";
			// 이력서 List
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
			model.addAttribute("anno_code", anno_code); // 따로 가져온 값들을 저장해서 넘겨야함
			model.addAttribute("user_id", user_id); // 따로 가져온 값들을 저장해서 넘겨야함
			
			return "gm/GmApplyList";
			
		}
	
		// 알림
		@GetMapping(value = "applyDetail")
		public String applyDetail(Apply apply,Model model) {
			System.out.println("GmAnnoListController applyDetail Start...");
			//int app = as.applyResume(apply);
			insertapplyDetail(apply);
			apply = as.checkRC(apply);
			System.out.println("GmAnnoListController applyDetail apply.getAnno_code()->"+apply.getAnno_code());
			
			model.addAttribute("apply", apply);
			System.out.println("여기까지 왔어?");
			
			return "/Main";
			
		}
		
		// 지원 이력서 확인
		public int insertapplyDetail(Apply apply) {
			
			//String user_id ="siasia54";
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
					Apply apply1 = as.checkRC(apply);
					NoticeCom noticeCom = new NoticeCom();
					noticeCom = as.selectNc(apply1);
					System.out.println("컨트롤러noticeCom.getCom_id()->"+noticeCom.getCom_id());
					
					as.Noticeinesert(noticeCom);
					
				}
			}
			return result;
			
		}
	
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
}
