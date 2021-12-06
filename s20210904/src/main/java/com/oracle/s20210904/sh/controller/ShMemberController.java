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
	
	
	//����ȭ�� 
	//@GetMapping(value="main")
	//public String main() {
		//System.out.println("ShMemberController main Start...");
		
		//return "sh/main";
	//}
	
	
	//����ȸ������ 
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
	

	//��� ȸ������ 
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
	//���ηα��� 
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
	
		//����
		HttpSession session =	request.getSession();
		int result = ms.login(mem);
		System.out.println("ShMemberController loginForm  result->" + result);

	
		if(result == 1) {
			System.out.println("ShMemberController loginForm ����....");
			rtnStr = "sh/main"; //����
			// session�� user_id ���� 
			session.setAttribute("mbid", user_id);
			// session �����ö�
			 System.out.println("session.getAttribute mbid : " + session.getAttribute("mbid"));
		}else {
			System.out.println("ShMemberController loginForm ����......");
			rtnStr = "sh/memberlogin"; //���� 
		}
		
		return rtnStr;
	}
	
	//��� �α��� 
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
		
		//���� 
		HttpSession session = request.getSession();
		int result = ms.Comlogin(com);
		
		if(result == 1) {
			rtnStr = "sh/main"; //���� 
			// session�� user_id ���� 
				session.setAttribute("cmid", com_id);
			// session �����ö�
			    System.out.println("session.getAttribute cmid : " + session.getAttribute("cmid"));
		}else {
			rtnStr = "sh/companylogin"; //���� 
		}
		
		return  rtnStr;
	}
	
	//���� ȸ�� ���̵� ã�� 
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
	
	//��� ȸ�� ���̵� ã�� 
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
	//����ȸ�� ��й�ȣ ã�� 
	@GetMapping(value="findPw")
	public String findPw() {
		System.out.println("ShMemberController findpw Start...");
		
		return "sh/findpw";
	}
	
	@GetMapping(value="findPwForm")
	public String findPwForm(Member member , Model model) {
		System.out.println("mailSending...");  //�޴� ����̸��� 
		String tomail = "gimsanghyun1221@gmail.com";
		System.out.println(tomail);
		String setfrom = "mingyeongmin285@gmail.com"; //������ ��� 
		String title = "�ӽ� ��й�ȣ�Դϴ�"; //����
		int tempSavePwStatus = 0;     //�����Ȳ
		System.out.println("member.getUser_id()->" + member.getUser_id()); 
		
		try {
			MimeMessage message = mailsender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //true�� ��Ƽ��Ʈ �޼��� ���
			messageHelper.setFrom(setfrom); 
			messageHelper.setTo(tomail); //�޴»�� �̸��� 
			messageHelper.setSubject(title); 
			String tempPassword = (int) (Math.random() * 999999) + 1 + "";
			messageHelper.setText("�ӽ� ��й�ȣ�Դϴ�:" + tempPassword); //���ϳ��� 
			System.out.println("�ӽ� ��й�ȣ�Դϴ�:" + tempPassword); 
			mailsender.send(message);
			member.setUser_pw(tempPassword);
     		tempSavePwStatus = ms.tempSavePw(member); //db�� ��й�ȣ�� �ӽú�й�ȣ�� ������Ʈ
			System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
		    model.addAttribute("check",1);//���� ���� 
	
		} catch (Exception e) {
			System.out.println("message Error->"+e.getMessage());
			model.addAttribute("check",2);//���� ���� ����
		}
		
		return "sh/findPwForm";
	}
	
	//��� ȸ�� ��й�ȣ ã�� 
		@GetMapping(value="findComPw")
		public String findComPw() {
			System.out.println("ShMemberController findComPw Start...");
			
			return "sh/findComPw";
			
		}
		
		@GetMapping(value="findComPwForm")
		public String findComPwForm(Company company , Model model) {
			System.out.println("mailSending...");  //�޴� ����̸��� 
			String tomail = "gimsanghyun1221@gmail.com";
			System.out.println(tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //������ ��� 
			String title = "�ӽ� ��й�ȣ�Դϴ�"; //����
			int tempSavePwStatus = 0;     //�����Ȳ
			System.out.println("company.getCom_id()->" + company.getCom_id()); 
			
			try {
				MimeMessage message = mailsender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8"); //true�� ��Ƽ��Ʈ �޼��� ���
				messageHelper.setFrom(setfrom); 
				messageHelper.setTo(tomail); //�޴»�� �̸��� 
				messageHelper.setSubject(title); 
				String tempPassword = (int) (Math.random() * 999999) + 1 + "";
				messageHelper.setText("�ӽ� ��й�ȣ�Դϴ�:" + tempPassword); //���ϳ��� 
				System.out.println("�ӽ� ��й�ȣ�Դϴ�:" + tempPassword); 
				mailsender.send(message);
				company.setCom_pw(tempPassword);
	     		tempSavePwStatus = ms.tempComSavePw(company); //db�� ��й�ȣ�� �ӽú�й�ȣ�� ������Ʈ
				System.out.println("ShMemberController findPwForm tempSavePwStatus->" + tempSavePwStatus); 
			    model.addAttribute("check",1);//���� ���� 
		
			} catch (Exception e) {
				System.out.println("message Error->"+e.getMessage());
				model.addAttribute("check",2);//���� ���� ����
			}
			
			return "sh/findComPwForm";
		}
		
		//Mail Ajax(����ȸ������ �̸�������)
		@RequestMapping(value = "verifyEmail" , produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String  verifyEmail(String  user_email , Model model) {
			System.out.println("mailSending...");  //������ ��
			String tomail = "user_email";
			System.out.println("verifyEmail tomail->"+tomail);
			String setfrom = "mingyeongmin285@gmail.com"; //������ ��� 
			String title = "���� ��ȣ�Դϴ�"; //����
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//-----�����۵�(�õ��غ��� Ȥ�� ���� ������)------
		
	
	
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
	

