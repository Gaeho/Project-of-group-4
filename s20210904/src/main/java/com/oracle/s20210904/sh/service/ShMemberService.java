package com.oracle.s20210904.sh.service;

import java.util.Map;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;
 

public interface ShMemberService {

	 int joinmember(Member member); // ���� ȸ������
   	 int joincom(Company company); //��� ȸ������
	 int login(Member mem); //���� �α��� 
	 int Comlogin(Company com);  //��� �α��� 
	String findID(Member member); //���� ȸ�� ���̵� ã�� 
	String findID(Company company); //��� ȸ�� ���̵� ã�� 
	int tempSavePw(Member member); //���� ȸ�� ��й�ȣ ã�� 
	int tempComSavePw(Company company); //��� ȸ�� ��й�ȣ ã�� 
	
	 
	 
	 
	
   	 
   	 
   	 
   	 
   	 
   	 //�����۵�
   	 // int login(Member member, Company company);
	// Member login(String user_id, String user_pw);
	 //Member findId(Member mem); //���� ���̵�ã�� 
	 //Member findId(Map<String, Object> memberMap); //���� ���̵�ã��
	
}
