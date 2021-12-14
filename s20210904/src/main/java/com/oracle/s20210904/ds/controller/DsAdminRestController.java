package com.oracle.s20210904.ds.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.ds.service.DsAdminService;

@RestController
public class DsAdminRestController {
	
	@Autowired
	DsAdminService dsAdminService;
	
	@GetMapping(value="joinConfirm")
	public int joinConfirm(String comId) {
		
		System.out.println("DsAdminRestController Start...");
		int result= dsAdminService.joinConfirm(comId);
		
		return result;
	}
	
	@GetMapping(value="comDetail")
	public Company companyDetail(Company com) {
		Company company = dsAdminService.getCompany(com);
		return company;
	}
	
	@GetMapping(value="memberDel")
	public int memberDel(String user_id) {
		int result= dsAdminService.memberDel(user_id);
		return result;
	}
	
	@GetMapping(value="joinRefuse")
	public int joinRefuse(String comId) {
		int result = dsAdminService.joinRefuse(comId);
		return result;
	}
	
	@GetMapping(value="companyDel")
	public int companyDel(String comId) {
		int result = dsAdminService.companyDel(comId);
		return result;
	}
	
	@GetMapping(value="maxSubCate")
	public String maxSubCate(String mainCate) {
		int resultNum = dsAdminService.maxSubCate(mainCate);
		resultNum = resultNum+1;
		String result = null;
		if(resultNum<100) {
			result = "0"+ resultNum;
		}else {
			result = Integer.toString(resultNum);
		}
			
		return result;
	}
	
	@GetMapping(value="Adminalram")
	public Map<String,Integer> Adminalram() {
		int cctotCnt = dsAdminService.cctotCnt();
		int qtotCnt = dsAdminService.qtotCnt();
		Map<String,Integer> cnt = new HashMap<String, Integer>();
		cnt.put("ComConfirmCnt", cctotCnt);
		cnt.put("QnaListCnt", qtotCnt);
		return cnt;
	}
	
	
}
