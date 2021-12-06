package com.oracle.s20210904.sh.dao;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Member;


public interface ShMemberDao {

	int joinmember(Member member);  //���� ȸ������
	int joincom(Company company); //��� ȸ������ 
	int login(Member mem); //���� �α��� 
	int Comlogin(Company com); //��� �α��� 
	String findID(Member member); //���� ȸ�� ���̵� ã�� 
	String findID(Company company); //���ȸ�� ���̵� ã��
	int tempSavePw(Member member); //���� ȸ�� ��й�ȣ ã�� 
	int tempComSavePw(Company company); //��� ȸ�� ��й�ȣ ã�� 
	
	

	
	
	//�����۵�
	//Member login(String user_id, String user_pw);
	//Member findId(Member mem);//���� ���̵�ã�� 
	//Member findId(Map<String, Object> memberMap); 

}
