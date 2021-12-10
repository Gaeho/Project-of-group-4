package com.oracle.s20210904.sh.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.sh.service.ShMemberService;

@Controller
public class ShMemberController {

	private static final Logger logger = LoggerFactory.getLogger(ShMemberController.class);
	
	@Autowired
	private ShMemberService ms;
	@Autowired
	private JavaMailSender mailsender;
	
	
	//메인화면 
	//@GetMapping(value="main")
	//public String main() {
		//System.out.println("ShMemberController main Start...");
		
		//return "sh/main";
	//}
	
	
	//개인회원가입 
	@RequestMapping(value = "join")
	public String join (Member memebr) {
		System.out.println("ShMemberController join Start...");
		
		return "sh/register";
	}
	
	@RequestMapping(value = "joinSave")
	public String joinSave (Member member, Model model) {
		System.out.println("ShMemberController joinSave Start...");
		
		int joinmember = ms.joinmember(member);
		//System.out.println("ShMemberController joinmember"+joinmemeber.getUser_id());
		model.addAttribute("joinmember", joinmember);
		
		return "redirect:/";
	}
	

	//기업 회원가입 
	@RequestMapping(value="Comjoin")
	public String Comjoin(Company company) {
		System.out.println("ShMemberController Comjoin Start...");
			
		return "sh/register2";
	}
	@RequestMapping(value = "ComjoinSave")
	public String ComjoinSave(Company company, Model model) {
		System.out.println("ShMemberController ComjoinSave Start...");
	    int joincom = ms.joincom(company);
		model.addAttribute("joincom", joincom);
		return "redirect:/";
		
	}
	//개인로그인 
	@GetMapping(value="login")
	public String login() {
		System.out.println("ShMemberController login Start...");
		
		return "sh/memberlogin";
	}
	@PostMapping(value="loginForm")
	public String loginForm( HttpServletRequest request, String user_id , String user_pw , Model model) {
		System.out.println("ShMemberController loginForm Start...");
		
		String rtnStr="";
		Member mem = new Member();
		mem.setUser_id(user_id);
		mem.setUser_pw(user_pw);
	
		//세션
		HttpSession session =	request.getSession();
		int result = ms.login(mem);
		System.out.println("ShMemberController loginForm  result->" + result);

	
		if(result == 1) {
			System.out.println("ShMemberController loginForm 성공....");
			rtnStr = "redirect:/main"; //성공
			// session에 user_id 저장 
			session.setAttribute("mbid", user_id);
			// session 가져올때
			 System.out.println("session.getAttribute mbid : " + session.getAttribute("mbid"));
		}else {
			System.out.println("ShMemberController loginForm 실패......");
			rtnStr = "sh/memberlogin"; //실패 
		}
		
		return rtnStr;
	}
	
	//기업 로그인 
	@GetMapping(value="Comlogin")
	public String comlogin() {
		System.out.println("ShMemberController Comlogin Start...");
		
		return "sh/companylogin";
	}
	
	@PostMapping(value="ComloginForm")
	public String ComloginForm( HttpServletRequest request , String com_id, String com_pw, Model model) {
		System.out.println("ShMemberController ComloginForm Start...");
		
		String rtnStr = "";
		Company com  = new Company();
		com.setCom_id(com_id);
		com.setCom_pw(com_pw);
		
		//세션 
		HttpSession session = request.getSession();
		int result = ms.Comlogin(com);
		
		if(result == 1) {
			rtnStr = "redirect:/main"; //성공 
			// session에 user_id 저장 
				session.setAttribute("cmid", com_id);
			// session 가져올때
			    System.out.println("session.getAttribute cmid : " + session.getAttribute("cmid"));
		}else {
			rtnStr = "sh/companylogin"; //실패 
		}
		
		return  rtnStr;
	}
	///로그아웃
	@GetMapping(value="logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();;
		return "redirect:/main";
	}
	
	//개인 회원 아이디 찾기 
	@GetMapping(value="findId" ) 
	public String findId() {
		System.out.println("ShMemberController findId Start..");
		
		return "sh/findId";
	}
	
	@GetMapping (value="findIdForm")
	public String findIdForm(Member member , Model model ) {
		System.out.println("ShMemberController findIdForm Start..");
		System.out.println("ShMemberController findIdForm getUser_name->"+member.getUser_name());
		System.out.println("ShMemberController findIdForm getUser_email->"+member.getUser_email());
		String user_id = ms.findID(member);
		System.out.println("ShMemberController findIdForm user_id->"+user_id);
		
		model.addAttribute("user_id", user_id);
		return "sh/findId";
	}
	
	//기업 회원 아이디 찾기 
	@GetMapping(value="findComId")
	public String findComId() {
		System.out.println("ShMemberController  findComId Start...");
		
		return "sh/findComId";
	}
	@GetMapping(value="findComIdForm")
	public String findComIdForm(Company company , Model model) {
		System.out.println("ShMemberController findComIdForm Start...");
		System.out.println("ShMemberController findIdForm getCom_name()->"+company.getCom_name());
		System.out.println("ShMemberController findIdForm getCom_user()->"+company.getCom_user());
		System.out.println("ShMemberController findIdForm getCom_regnum())->"+company.getCom_regnum());
		System.out.println("ShMemberController findIdForm company.getCom_email()->" + company.getCom_email());
		
		String com_id = ms.findID(company);
		System.out.println("ShMemberController findIdForm com_id->" + com_id);
		
		model.addAttribute("com_id", com_id);
		return "sh/findComId";
	}
	//개인회원 비밀번호 찾기 
	@GetMapping(value="findPw")
	public String findPw() {
		System.out.println("ShMemberController findpw Start...");
		
		return "sh/findpw";
	}
	
	@GetMapping(value="findPwForm")
	public String findPwForm(Member member , Model model) {
		System.out.println("mailSending...");  //받는 사람이메일 
		String tomail = "gimsanghyun1221@gmail.com";
		System.out.println(tomail);
		String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
		String title = "임시 비밀번호입니다"; //제목
		int tempSavePwStatus = 0;     //저장상황
		System.out.println("member.getUser_id()->" + member.getUser_id()); 
		
		try {
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //true는 멀티파트 메세지 사용
			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); //받는사람 이메일 
			messageHelper.setSubject(title); 
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("임시 비밀번호입니다:" + tempPassword); //메일내용 
			System.out.println("임시 비밀번호입니다:" + tempPassword); 
			mailsender.send(message);
			member.setUser_pw(tempPassword);
     		tempSavePwStatus = ms.tempSavePw(member); //db에 비밀번호를 임시비밀번호로 업데이트
			System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
		    model.addAttribute("check",1);//정상 전달 
	
		} catch (Exception e) {
			System.out.println("message Error->"+e.getMessage());
			model.addAttribute("check",2);//메일 전달 실패
		}
		
		return "sh/findPwForm";
	}
	
	//기업 회원 비밀번호 찾기 
		@GetMapping(value="findComPw")
		public String findComPw() {
			System.out.println("ShMemberController findComPw Start...");
			
			return "sh/findComPw";
			
		}
		
		@GetMapping(value="findComPwForm")
		public String findComPwForm(Company company , Model model) {
			System.out.println("mailSending...");  //받는 사람이메일 
			String tomail = "gimsanghyun1221@gmail.com";
			System.out.println(tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
			String title = "임시 비밀번호입니다"; //제목
			int tempSavePwStatus = 0;     //저장상황
			System.out.println("company.getCom_id()->" + company.getCom_id()); 
			
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //true는 멀티파트 메세지 사용
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); //받는사람 이메일 
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("임시 비밀번호입니다:" + tempPassword); //메일내용 
				System.out.println("임시 비밀번호입니다:" + tempPassword); 
				mailsender.send(message);
				company.setCom_pw(tempPassword);
	     		tempSavePwStatus = ms.tempComSavePw(company); //db에 비밀번호를 임시비밀번호로 업데이트
				System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
			    model.addAttribute("check",1);//정상 전달 
		
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				model.addAttribute("check",2);//메일 전달 실패
			}
			
			return "sh/findComPwForm";
		}
		
		//Mail Ajax(개인회원가입 이메일인증)
		@RequestMapping(value = "verifyEmail" , produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String  verifyEmail(String  user_email , Model model) {
			System.out.println("mailSending...");  //받는사람이메일
			String tomail = user_email;
			System.out.println("verifyEmail tomail->"+tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
			String title = "인증 번호입니다"; //제목
			String tempVerifyStatus = "0";     
				
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("인증 번호입니다:" + tempPassword); //
				System.out.println("인증번호입니다" + tempPassword); 
				mailsender.send(message);
				tempVerifyStatus = "1";
			
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				tempVerifyStatus = "0";
			}
			System.out.println("ShMemberController verifyEmail tempVerifyStatus->" + tempVerifyStatus); 
			
			return tempVerifyStatus;
		}

		//Mail Ajax2(기업회원가입 이메일인증)
				@RequestMapping(value = "verifyEmail2" , produces = "application/text;charset=UTF-8")
				@ResponseBody
				public String  verifyEmail2(String  com_email , Model model) {
		     	                     System.out.println("mailSending...");  //받는사람이메일
				String tomail = com_email;
				System.out.println("verifyEmail tomail->"+tomail);
				String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
				String title = "인증 번호입니다"; //제목
				String tempVerifyStatus = "0";     
						
					try {
						MimeMessage message = mailsender.createMimeMessage();
						MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
						messageHelper.setFrom(setfrom); 
						messageHelper.setTo(tomail); 
						messageHelper.setSubject(title); 
						String tempPassword = (int) (Math.random() * 999999) + 1 + "";
						messageHelper.setText("인증 번호입니다:" + tempPassword); //
						System.out.println("인증번호입니다" + tempPassword); 
						mailsender.send(message);
						tempVerifyStatus = "1";

					} catch (Exception e) {
						System.out.println("message Error->"+e.getMessage());
						tempVerifyStatus = "0";
					}
					System.out.println("ShMemberController verifyEmail tempVerifyStatus->" + tempVerifyStatus); 
					
					return tempVerifyStatus;
				}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	

}
	

