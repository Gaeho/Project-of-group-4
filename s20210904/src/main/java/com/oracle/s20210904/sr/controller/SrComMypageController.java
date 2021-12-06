package com.oracle.s20210904.sr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.sr.model.AppAnnMem;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.service.Paging;
import com.oracle.s20210904.sr.model.CommCompany;
import com.oracle.s20210904.sr.model.CommMemResume;
import com.oracle.s20210904.sr.service.SrComMypageService;

@Controller
public class SrComMypageController {

	@Autowired
	private SrComMypageService scms;

	// 기업정보
	@GetMapping(value = "ComInfo")
	public String ComInfo(Model model, CommCompany commCompany) {

		System.out.println("SrComMypageController ComInfo START...");

		// company+comm JOIN
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		model.addAttribute("commCompany1", commCompany1);

		return "sr/comInfoMenu";
	}

	// 채용공고
	@GetMapping(value = "ComAnn")
	public String ComAnn(CommCompany commCompany, Model model, Announce announce, String currentPage, String id) {

		System.out.println("SrComMypageController ComAnn START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		announce.setStart(pg.getStart()); // 1
		announce.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// announce list
		List<Announce> listAnn = scms.listAnnReg(announce);
		if (id != null) {
			if (id.equals("0")) {
				listAnn = scms.listAnnReg(announce);
				System.out.println("bnt1");
				System.out.println("SrComMypageController listAnn listAnnReg size=>" + listAnn.size());

			} else {
				listAnn = scms.listAnnCReg(announce);
				System.out.println("bnt2");
				System.out.println("SrComMypageController listAnn listAnnCReg size=>" + listAnn.size());

			}
		}
		// ----------------------------------------------------------------------------
		System.out.println("SrComMypageController ComAnn total=>" + total);
		System.out.println("SrComMypageController ComAnn company1=>" + commCompany1);
		System.out.println("SrComMypageController ComAnn listAnn=>" + listAnn);
		// ----------------------------------------------------------------------------
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("listAnn", listAnn);

		return "sr/comAnnMenu";
	}

	// 지원현황
	@GetMapping(value = "ComAppStatus")
	public String ComAppStatus(Model model, String currentPage, Member member, AppAnnMem appAnnMem,
			CommCompany commCompany, String id) {

		System.out.println("SrComMypageController ComAppStatus START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		appAnnMem.setStart(pg.getStart()); // 1
		appAnnMem.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// apply+member+announce JOIN list
		List<AppAnnMem> appAnnMember = scms.appAnnMemReg(appAnnMem);
		if (id != null) {
			if (id.equals("0")) {
				appAnnMember = scms.appAnnMemReg(appAnnMem);
				System.out.println("bnt1");
				System.out.println("SrComMypageController appAnnMember appAnnMemReg size=>" + appAnnMember.size());
			} else {
				appAnnMember = scms.appAnnMemCReg(appAnnMem);
				System.out.println("bnt2");
				System.out.println("SrComMypageController appAnnMember appAnnMemCReg size=>" + appAnnMember.size());

			}
		}
		// ----------------------------------------------------------------------------
		System.out.println("SrComMypageController ComAppStatus total=>" + total);
		System.out.println("SrComMypageController ComAppStatus company1=>" + commCompany1);
		System.out.println("SrComMypageController ComAppStatus appAnnMember=>" + appAnnMember);
		for (AppAnnMem appAnnMember1 : appAnnMember) {
			System.out.println("appAnnMember1.getApp_regdate()->" + appAnnMember1.getApp_regdate());
			System.out.println("appAnnMember1.getUser_id()->" + appAnnMember1.getUser_id());
			System.out.println("appAnnMember1.getUser_img()->" + appAnnMember1.getUser_img());
		}
		// ----------------------------------------------------------------------------
		model.addAttribute("total", total);
		model.addAttribute("pg", pg);
		model.addAttribute("commCompany1", commCompany1);
		model.addAttribute("appAnnMember", appAnnMember);

		return "sr/comAppStatusMenu";
	}

	// 회원검색
	@GetMapping(value = "ComMemberSearch")
	public String ComMemberSearch(Model model, String currentPage, CommMemResume commMemResume, CommCompany commCompany) {

		System.out.println("SrComMypageController ComMemberSearch START...");

		// paging
		int total = scms.total();
		Paging pg = new Paging(total, currentPage);
		commMemResume.setStart(pg.getStart()); // 1
		commMemResume.setEnd(pg.getEnd()); // 5
		// ----------------------------------------------------------------------------
		// company
		CommCompany commCompany1 = null;
		commCompany1 = scms.comInfo(commCompany);
		// ----------------------------------------------------------------------------
		// commMemResume list
		List<CommMemResume> commMemResumeList=scms.commMemResumeList(commMemResume);
		
		return "sr/comMemberSearchMenu";
	}

}
