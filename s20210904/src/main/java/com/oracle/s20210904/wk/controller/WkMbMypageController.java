package com.oracle.s20210904.wk.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.Resume;
import com.oracle.s20210904.comm.model.ResumeDetail;
import com.oracle.s20210904.wk.model.WkApply;
import com.oracle.s20210904.wk.model.WkApplyCount;
import com.oracle.s20210904.wk.model.WkCommDto;
import com.oracle.s20210904.wk.model.WkNotice;
import com.oracle.s20210904.wk.model.WkResume;
import com.oracle.s20210904.wk.model.WkResumeDetail;
import com.oracle.s20210904.wk.model.WkScrap;
import com.oracle.s20210904.wk.service.WkMbMypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WkMbMypageController {
	
	private final WkMbMypageService ms;
	

	private String checkId(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mbid");
//		if(id==null || id.equals("")){              
//			return "/wk/wkindex";
//		}
//		System.out.println("checkId : "+id);
		return id;
	}
	
	private String Profile_img(String mbid) {
		String profile=ms.memberImg(mbid);
		return profile;
	}
	
	@GetMapping(value = "wkindex")
	public String index() {
		return "/wk/wkindex";
	}
	
	@GetMapping(value = "wkindex2")
	public String index2(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		String memberid=(String) request.getParameter("memberid");
		session.setAttribute("mbid", memberid);
//		System.out.println("index : "+memberid);
		return "redirect:mbMypage";
	}
	
	
	
	// 마이페이지 홈
	@RequestMapping(value = "mbMypage")
	public String mbMypage(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypage()");
//		HttpSession session = request.getSession();
//		String id=
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
//		System.out.println("WkMbMypageController mbMypage() mbid : "+mbid );
		
		List<WkApplyCount> countapply=ms.countApply(mbid);
		model.addAttribute("countapply", countapply);
		
		List<WkResume> resumelist=ms.resumeList(mbid);
		model.addAttribute("resumelist", resumelist);
		
		return "/wk/mbMypage";
	}
	
	// 마이페이지 입사지원현황
	@GetMapping(value = "mbMypageApply")
	public String mbMypageApply(HttpServletRequest request, Model model, String notice_msg) {
		System.out.println("WkMbMypageController mbMypageApply()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		List<WkApplyCount> countapply=ms.countApply(mbid);
		model.addAttribute("countapply", countapply);
		
		List<WkApply> applyList=ms.applyList(mbid);
		model.addAttribute("applyList", applyList);
		
		List<WkNotice> resConList=ms.resConList(mbid);
		model.addAttribute("resConList", resConList);
		
		model.addAttribute("notice_msg", notice_msg);
		
		return "/wk/mbMypageApply";
	}
	
	// 마이페이지 이력서관리
	@RequestMapping(value = "mbMypageResume")
	public String mbMypageResume(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageResume()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		List<WkResume> resumelist=ms.resumeList(mbid);
		model.addAttribute("resumelist", resumelist);
		
		return "/wk/mbMypageResume";
	}
	
	// 마이페이지 이력서작성(입력하는 페이지로)
	@RequestMapping(value = "mbMypageResumeWrite")
	public String mbMypageResumeWrite(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageResumeWrite()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		String main_cat="062";
		List<WkCommDto> commlist=ms.commList(main_cat);
		model.addAttribute("hs_mjr_commlist", commlist);
		
		main_cat="001";
		commlist=ms.commList(main_cat);
		model.addAttribute("tag1_commlist", commlist);
		
		main_cat="002";
		commlist=ms.commList(main_cat);
		model.addAttribute("tag2_commlist", commlist);
		
		Member memberdetail=ms.memberDetail(mbid);
		model.addAttribute("memberdetail", memberdetail);
		return "/wk/mbMypageResumeWrite"; 
	}
	
	// 마이페이지 이력서작성 db동작
	@RequestMapping(value = "mbMypageResumeWritePro", method = RequestMethod.POST)
	public String mbMypageResumeWritePro(WkResumeDetail wkResumeDetail, WkResume wkResume, HttpServletRequest request, Model model,
										String uploadstate) {
		System.out.println("WkMbMypageController mbMypageResumeWritePro()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		// 이력서프로필에 사진을 그대로 이력서사진에 넣을때 이력서 사진파일을 이력서폴더에 복사
		System.out.println("WkMbMypageController mbMypageResumeWritePro() uploadstate : "+uploadstate);
		String copy_result="notcopy";
		int resume_write_result=0;
		if(uploadstate.equals("non") && wkResume.getRes_img()!=null) {
			System.out.println("사진파일 복사 시작..");
			
			copy_result=mbMypageCopyfile(request, wkResume.getRes_img());
			if(!copy_result.equals("fail")) {
				wkResume.setRes_img(copy_result);
			}
//			https://codevang.tistory.com/159?category=827592
		}
		
		
		resume_write_result=ms.resumeWrite(wkResume, wkResumeDetail);
		System.out.println("WkMbMypageController mbMypageResumeWritePro() result : "+resume_write_result);
		
		
//		Member memberdetail=ms.memberdetail(mbid);
//		model.addAttribute("memberdetail", memberdetail);
		return "redirect:mbMypageResume"; 
	}
	
	
	// 마이페이지 이력서 수정(입력페이지로)
	@RequestMapping(value = "mbMypageResumeUpdate", method = RequestMethod.GET)
	public String mbMypageResumeUpdate(HttpServletRequest request, Model model, int res_code) throws ParseException {
		System.out.println("WkMbMypageController mbMypageResumeUpdate()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		Resume resume=new Resume();
		resume.setUser_id(mbid);
		resume.setRes_code(res_code);
		boolean res_select_msg=false;
		
		resume=ms.resumeSelect(resume);
		List<ResumeDetail> resumeDetailList=ms.resumeDetailSelect(resume);
		
		Member memberdetail=ms.memberDetail(mbid);
		model.addAttribute("memberdetail", memberdetail);
		
		if(resume!=null && !resume.getRes_sts().equals("003")) {
			res_select_msg=true;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			
			if(!memberdetail.getUser_edu().equals("001")) {
				String[] univ_date_array=resume.getUniv_date().split("~");
				Date univ_date1=new Date(sdf.parse(univ_date_array[0]).getTime());
				Date univ_date2=new Date(sdf.parse(univ_date_array[1]).getTime());
				model.addAttribute("univ_date1", univ_date1);
				model.addAttribute("univ_date2", univ_date2);
			}
			
			
			if(resumeDetailList!=null) {
				Date[] emp_date1 = new Date[2], 
						emp_date2=new Date[2];
				String[] emp_date_array=new String[2];
				for(int i=0; i<resumeDetailList.size(); i++) {
					emp_date_array=resumeDetailList.get(i).getEmp_date().split("~");
					emp_date1[i]=new Date(sdf.parse(emp_date_array[0]).getTime());
					emp_date2[i]=new Date(sdf.parse(emp_date_array[1]).getTime());
					
				}
				model.addAttribute("emp_date1", emp_date1);
				model.addAttribute("emp_date2", emp_date2);
			}
			
			model.addAttribute("resumedetail", resume);
			model.addAttribute("resumeDetailList", resumeDetailList);
			
			String main_cat="062";
			List<WkCommDto> commlist=ms.commList(main_cat);
			model.addAttribute("commlist", commlist);
			
			main_cat="001";
			commlist=ms.commList(main_cat);
			model.addAttribute("tag1_commlist", commlist);
			
			main_cat="002";
			commlist=ms.commList(main_cat);
			model.addAttribute("tag2_commlist", commlist);
			

			
		}
		model.addAttribute("res_select_msg", res_select_msg);
		return "/wk/mbMypageResumeUpdate"; 
	}
	
	// 마이페이지 이력서 수정 db동작
	@RequestMapping(value = "mbMypageResumeUpdatePro", method = RequestMethod.POST)
	public String mbMypageResumeUpdatePro(WkResumeDetail wkResumeDetail, Resume resume, HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageResumeUpdatePro()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		String msg=null;

		
		String univ_date1=request.getParameter("univ_date1");
		String univ_date2=request.getParameter("univ_date2");
		resume.setUniv_date(univ_date1+"~"+univ_date2);
		System.out.println("Univ_date : "+resume.getUniv_date());
		
		int resume_update_result=ms.resumeUpdate(resume, wkResumeDetail);
		System.out.println("WkMbMypageController mbMypageResumeUpdatePro() result : "+resume_update_result);
		
		if(resume_update_result>0) {
			msg="이력서가 수정되었습니다";
		}else {
			msg="이력서 수정에 실패하였습니다";
		}
//		Member memberdetail=ms.memberdetail(mbid);
		model.addAttribute("msg", msg);
		return "forward:mbMypageResume"; 
	}
	
	// 마이페이지 스크랩
	@RequestMapping(value = "mbMypageScrap")
	public String mbMypageScrap(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageScrap()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		List<WkScrap> scarplist=ms.scarpList(mbid);
		model.addAttribute("scarplist", scarplist);
		
		int scarpcount=ms.scarpCount(mbid);
		model.addAttribute("scarpcount", scarpcount);
		return "/wk/mbMypageScrap"; 
	}
	
	// 마이페이지 수정(비밀번호 확인 입력페이지로)
	@RequestMapping(value = "mbMypageUpdate")
	public String mbMypageUpdate(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageUpdate()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		return "/wk/mbMypageUpdate"; 
	}
	
	// 마이페이지 수정(수정정보 입력페이지)
	@PostMapping(value = "mbMypageUpdateForm")
	public String mbMypageUpdateForm(HttpServletRequest request, Model model) {
		System.out.println("WkMbMypageController mbMypageUpdateForm()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		String returnpage=null;
		
		String user_pw=request.getParameter("user_pw");
		Member member=ms.memberDetail(mbid);
		
		String main_cat="061";
		List<WkCommDto> commlist=ms.commList(main_cat);
		model.addAttribute("user_edu_commlist", commlist);
		
		if(user_pw.equals(member.getUser_pw())) {
			model.addAttribute("member", member);
			returnpage="/wk/mbMypageUpdateForm";
		}else {
			String msg="잘못된 비밀번호입니다";
			model.addAttribute("msg", msg);
			returnpage="/wk/mbMypageUpdate";
		}
		return returnpage; 
	}
	
	// 마이페이지 수정 db작동
	@PostMapping(value = "mbMypageUpdatePro")
	public String mbMypageUpdatePro(Member member, HttpServletRequest request, Model model, String user_img) {
		System.out.println("WkMbMypageController mbMypageUpdatePro()");
		String mbid=checkId(request);
		model.addAttribute("mbid", mbid);
		String profile=Profile_img(mbid);
		model.addAttribute("profile", profile);
		
		System.out.println("WkMbMypageController mbMypageUpdatePro() user_img : "+user_img);
//		Member member2=member;
		System.out.println("WkMbMypageController mbMypageUpdatePro() member : "+member.getUser_img());
		
		int mypage_update_result=ms.memberUpdate(member);
		String mypage_update_msg=null;
		System.out.println("WkMbMypageController mbMypageUpdatePro() mypage_update_result : "+mypage_update_result);
		if(mypage_update_result>=1) {
			mypage_update_msg="마이페이지 수정 완료";
		}else {
			mypage_update_msg="마이페이지 수정 실패";
		}
		model.addAttribute("mypage_update_msg", mypage_update_msg);
		return "forward:mbMypage";
	}
	
	// 프로필사진을 이력서 사진으로 복사
	private String mbMypageCopyfile(HttpServletRequest request, String user_img) {
		System.out.println("WkMbMypageController mbMypageCopyfile()");
		UUID uid = UUID.randomUUID();
		
		String mypage_img_realpath=request.getSession().getServletContext().getRealPath(user_img);	//프로필사진의 실제경로
		String[] array=mypage_img_realpath.split("_");
		String mypage_img_name=array[1];															//프로필사진의 실제이름
		String res_uploadPath=request.getSession().getServletContext().getRealPath("/upload/wk/resume/");	//이력서사진의 실제저장되는 경로
		String res_img="/upload/wk/resume/"+uid.toString() + "_" + mypage_img_name;					//이력서사진이 db에 저장되는 경로
		String res_img_realpath=request.getSession().getServletContext().getRealPath(res_img);	//이력서사진의 실제경로
		
		System.out.println("mypage_img_realpath : "+mypage_img_realpath);		//프로필사진의 실제경로
		System.out.println("mypage_img_name : "+mypage_img_name);			//프로필사진의 실제이름
		System.out.println("res_uploadPath : "+res_uploadPath);				//이력서사진의 실제저장되는 경로
		System.out.println("res_img : "+res_img);							//이력서사진이 db에 저장되는 경로
		System.out.println("res_img_realpath : "+res_img_realpath);			//이력서사진의 실제경로
		
		
		File fileDirectory = new File(res_uploadPath);
		if (!fileDirectory.exists()) { // 만약 파일디렉토리가 존재하지 않는다면,
			fileDirectory.mkdirs(); // mkdirs=make directory 폴더를 만들어라
			System.out.println("업로드용 폴더 생성 : " + res_uploadPath);
		}
		
		Path file1=Paths.get(mypage_img_realpath);
		Path file2=Paths.get(res_img_realpath);
		try {
			Files.copy(file1, file2, StandardCopyOption.REPLACE_EXISTING);	// 없으면 복사해서 만들고, 이미 있으면 내용을 덮어씀
		} catch (Exception e) {
			System.out.println("mbMypageCopyfile() 파일복사실패 : "+e.getMessage());
			res_img="fail";
		}
		return res_img;
	}
}
