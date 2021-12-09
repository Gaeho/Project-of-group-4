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
	
	
	//메인
	//@GetMapping(value="main")
	//public String main() {
		//System.out.println("ShMemberController main Start...");
		
		//return "sh/main";
	//}
	
	
	//개인 회원가입 
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
	//개인회원 로그인
	@GetMapping(value="login")
	public String login() {
		System.out.println("ShMemberController login Start...");
		
		return "sh/memberlogin";
	}
	@GetMapping(value="loginForm")
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
			System.out.println("ShMemberController loginForm ����....");
			rtnStr = "sh/main"; //성공
			// session에 user_id 저장
			session.setAttribute("mbid", user_id);
			
			 System.out.println("session.getAttribute mbid : " + session.getAttribute("mbid"));
		}else {
			System.out.println("ShMemberController loginForm ����......");
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
	
	@GetMapping(value="ComloginForm")
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
			rtnStr = "sh/main"; //성공
			
			// session 에 저장
				session.setAttribute("cmid", com_id);
			
			    System.out.println("session.getAttribute cmid : " + session.getAttribute("cmid"));
		}else {
			rtnStr = "sh/companylogin"; //실패 
		}
		
		return  rtnStr;
	}
	
	//개인회원 아이디 찾기 
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
	
	//기업회원 아이디 찾기 
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
		System.out.println("mailSending...");  
		String tomail = "gimsanghyun1221@gmail.com";
		System.out.println(tomail);
		String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람
		String title = "임시 비밀번호입니다"; //메일 제목
		int tempSavePwStatus = 0;     
		System.out.println("member.getUser_id()->" + member.getUser_id()); 
		
		try {
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); 
			messageHelper.setSubject(title); 
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("임시 비밀번호입니다:" + tempPassword);  
			System.out.println("임시 비밀번호입니다:" + tempPassword); 
			mailsender.send(message);
			member.setUser_pw(tempPassword);
     		tempSavePwStatus = ms.tempSavePw(member); //db에 값을 저장 
			System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
		    model.addAttribute("check",1);//메일 성공
	
		} catch (Exception e) {
			System.out.println("message Error->"+e.getMessage());
			model.addAttribute("check",2);//메일 실패
		}
		
		return "sh/findPwForm";
	}
	
	//기업 비밀번호 찾기
		@GetMapping(value="findComPw")
		public String findComPw() {
			System.out.println("ShMemberController findComPw Start...");
			
			return "sh/findComPw";
			
		}
		
		@GetMapping(value="findComPwForm")
		public String findComPwForm(Company company , Model model) {
			System.out.println("mailSending...");  
			String tomail = "gimsanghyun1221@gmail.com";
			System.out.println(tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람
			String title = "임시 비밀번호 입니다"; //제목
			int tempSavePwStatus = 0;     
			System.out.println("company.getCom_id()->" + company.getCom_id()); 
			
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); //
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("임시 비밀번호입니다:" + tempPassword); //
				System.out.println("임시 비밀번호입니다:" + tempPassword); 
				mailsender.send(message);
				company.setCom_pw(tempPassword);
	     		tempSavePwStatus = ms.tempComSavePw(company); //db에 업데이트
				System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
			    model.addAttribute("check",1);//메일 성공
		
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				model.addAttribute("check",2);//메일 실패
			}
			
			return "sh/findComPwForm";
		}
		
		//Mail Ajax(개인 회원가입 이메일 인증)
		@RequestMapping(value = "verifyEmail" , produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String  verifyEmail(String  user_email , Model model) {
			System.out.println("mailSending...");  
			String tomail = "user_email";
			System.out.println("verifyEmail tomail->"+tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
			String title = "이메일 인증입니다."; //제목
			String tempVerifyStatus = "0";     
				
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("���� ��ȣ�Դϴ�:" + tempPassword); //
				System.out.println("������ȣ�Դϴ�" + tempPassword); 
				mailsender.send(message);
				tempVerifyStatus = "1";
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				tempVerifyStatus = "0";
			}
			System.out.println("ShMemberController verifyEmail tempVerifyStatus->" + tempVerifyStatus); 
			
			return "tempVerifyStatus";
		}
	
		//Mail Ajax2(기업 회원가입 이메일 인증)
		@RequestMapping(value = "verifyEmail2" , produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String verifyEmail2(String com_email , Model model) {
			System.out.println("mailSending...");
			String tomail = "com_email";
			System.out.println("verifyEmail2 tomail->" + tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //보내는 사람 
			String title = "이메일 인증입니다."; //제목
			String tempVerifyStatus = "0";     
			
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); 
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); 
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("이메일 인증입니다:" + tempPassword); //
				System.out.println("이메일 인증입니다" + tempPassword); 
				mailsender.send(message);
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				tempVerifyStatus = "0";
			}
			System.out.println("ShMemberController verifyEmail tempVerifyStatus->" + tempVerifyStatus); 
			
			return "tempVerifyStatus";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-----실패작들(시도해본것들)------
		
	
	
	//�α��� HashMap �ẻ�� 

	//	@GetMapping(value="loginForm")
//	public String loginForm(String user_id , String user_pw, Model model) {
//		System.out.println("ShMemberController loginForm Start...");
//		 HashMap<String, String> map = new HashMap<String, String>();
//		 
//		 map.put("user_id", user_id);
//		 map.put("user_pw", user_pw);
//		String rtnStr = "";
//		member.setUser_id(rtnStr);
//		member.setUser_pw(rtnStr);
//		Member mem = ms.login(user_id,user_pw);
//		
//		System.out.println("ShMemberController mem.getUser_id()-> "+mem.getUser_id());
//		model.addAttribute("mem", mem);
//		int result = 
//		if(mem == member) {
//			rtnStr="sh/main";
//		}else
//			rtnStr="sh/login";
//		
//		return "sh/result";
//		}
		
	//��� �α��� 
//		@GetMapping(value="comlogin")
//		public String comlogin() {
//			System.out.println("ShMemberController login Start...");
//			
//			return "sh/companylogin";
//		}
//		@GetMapping(value="comloginForm")
//		public String comloginForm(Company company) {
//			
//			return "sh/result";
//		}
	
	//���� ���̵� ã�� 
//	@GetMapping(value="findId")
//	public String findId() {
//		System.out.println("ShMemberController findId Start...");
//		
//		return "sh/findId";
//	}
//	@GetMapping(value="findIdForm")
//	public String findIdForm(Member member , Model model) {
//		System.out.println("ShMemberController findIdForm Start...");
//		
//		Member mem = ms.findId(member);
//		if(member == null) {
//			model.addAttribute("check" , 1);
//		}else {
//			model.addAttribute("check", 0);
//			model.addAttribute("id", mem.getUser_id());
//		}
//		
//		
//		return "sh/findId";
//	}
	
	//����ȸ�� ���̵� ã��
//	@GetMapping(value="findId")
//		public String findId() {
//      		System.out.println("ShMemberController findId Start...");
//		
//      		return "sh/findId";
//	}	
//		
//	@GetMapping(value="findIdForm")
//		public String findIdForm(@RequestParam Map<String, Object> memberMap) {
//			System.out.println("ShMemberController findIdForm Start...");
//			Member member = ms.findId(memberMap);
//			String result = "";
//
//			if(member != null) {
//				String res = member.getUser_id();
//			
//				if (res.equals(null)) {
//					return "null";
//				} else {
//					result = member.getUser_id();
//				}
//			}
//			return result;
//		
//	}
	
	
	
	


	
	

}
	

