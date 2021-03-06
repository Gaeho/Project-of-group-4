package com.oracle.s20210904.ds.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.comm.model.Post;
import com.oracle.s20210904.comm.model.Member;
import com.oracle.s20210904.comm.model.NoticeApplyAnno;
import com.oracle.s20210904.ds.model.AnnounceCnt;
import com.oracle.s20210904.ds.model.DsComm;

@Repository
public class DsAdminDaoImpl implements DsAdminDao {
	@Autowired
	SqlSession session;
	
	@Override 
	public List<Company> getWaitCompany() {
		List<Company> waitComList = session.selectList("DsWaitComList");
		return waitComList;
	}
	
	@Override
	public int joinConfirm(String com_id) {
		int result = session.update("DsJoinConfirm",com_id);
		System.out.println("result->"+result);
		
		return result;
	}
	// 페이징 안된 QnA
	@Override
	public List<Post> getQnaList() {
		List<Post> qnaList = session.selectList("DsQnaList");
		return qnaList;
	}
	
	@Override
	public List<AnnounceCnt> announceCnt() {
		List<AnnounceCnt> annCntList= session.selectList("DsAnnounceCnt");
		return annCntList;
	}
	
	@Override
	public List<Announce> getAnnounce() {
		List<Announce> announce = session.selectList("announceSelectAll");
		return announce;
	}
	
	@Override
	public List<Member> getUserList(Member member) {
		List<Member> userList = session.selectList("DsMemberList",member);
		return userList;
	}
	
	@Override
	public int totCnt() {
		int totCnt = session.selectOne("DsTotCnt");
		return totCnt;
	}
	
	@Override
	public int ctotCnt() {
		int ctotCnt = session.selectOne("DscTotCnt");
		return ctotCnt;
	}
	
	@Override
	public int cctotCnt() {
		int cctotCnt = session.selectOne("DsccTotCnt");
		return cctotCnt;
	}
	
	@Override
	public List<Company> getCompanyList(Company com) {
		List<Company> companyList = session.selectList("DsCompanyList",com);
		return companyList;
	}
	
	@Override
	public List<Company> getComConfirmList(Company com) {
		List<Company> comConfirmList = session.selectList("DsComConfirmList",com);
		return comConfirmList;
	}
	
	@Override
	public Company getCompany(Company com) {
		Company company = session.selectOne("companySelectOne",com);
		return company;
	}
	//comm 총 갯수
	@Override
	public int ttotCnt() {
		int ttotCnt = session.selectOne("DsttotCnt");
		return ttotCnt;
	}
	
	@Override
	public List<DsComm> getDsCommList(DsComm dsComm) {
		List<DsComm> dsCommList = session.selectList("DsCommList",dsComm);
		return dsCommList;
	}
	
	@Override
	public List<Post> getNoticeList(Post post) {
		List<Post> noticeList = session.selectList("DsNoticeList",post);
		return noticeList;
	}
	// 페이징 QnA
	@Override
	public List<Post> getQnaList(Post post) {
		List<Post> qnaList = session.selectList("DsQnAList",post);
		return qnaList;
	}
	@Override
	public int ntotCnt() {
		int ntotCnt = session.selectOne("DsntotCnt");
		return ntotCnt;
	}
	@Override
	public int qtotCnt() {
		int qtotCnt = session.selectOne("DsqtotCnt");
		return qtotCnt;
	}
	@Override
	public int memberDel(String user_id) {
		int result = session.update("DsMemberDel",user_id);
		return result;
	}
	@Override
	public int joinRefuse(String comId) {
		int result = session.update("DsJoinRefuse",comId);
		return result;
	}
	
	@Override
	public int companyDel(String comId) {
		int result = session.update("DsCompanyDel",comId);
		return result;
	}
	
	@Override
	public List<Comm> getMainCate() {
		List<Comm> mainCate = session.selectList("DsMainCate");
		return mainCate;
	}
	
	@Override
	public int maxSubCate(String mainCate) {
		int result = session.selectOne("maxSubCate",mainCate);
		return result;
	}
	
	@Override
	public int tagInsert(Comm comm) {
		int result = session.insert("DsInsertTag",comm);
		return result;
	}
	
	@Override
	public int alramCnt(String id) {
		int result = session.selectOne("alramCnt",id);
		
		return result;
	}
	
	@Override
	public List<NoticeApplyAnno> alramList(String id) {
		 List<NoticeApplyAnno> alramList = session.selectList("DsAlramList",id);
		return alramList;
	}
	
	@Override
	public List<Member> searchUserList(Member member) {
		List<Member> userList = session.selectList("DsSearchUser",member);
		return userList;
	}
	
	@Override
	public int searchTotCnt(String searchTxt) {
		int mtotCnt = session.selectOne("DsSearchTotCnt",searchTxt);
		return mtotCnt;
	}
	
	@Override
	public List<DsComm> getMainCateList(DsComm dsComm) {	
		List<DsComm> commList = session.selectList("DsMainCateList",dsComm);
		return commList;

	}
	
	@Override
	public int mainCateCnt(String main_cat) {
		int ttotCnt = session.selectOne("DsMainCateCnt",main_cat);
		return ttotCnt;
	}
	
	@Override
	public int tagDel(Comm comm) {
		int result = session.delete("DsTagDel",comm);
		return result;
	}
}
