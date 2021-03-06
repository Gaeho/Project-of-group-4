package com.oracle.s20210904.dj.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Announce;
import com.oracle.s20210904.comm.model.Comm;
import com.oracle.s20210904.comm.model.Company;

public interface DjAnnoDao {

	Company comInfoList(String com_id);

	List<Comm> mainCatList1();

	List<Comm> mainCatList2();

	List<Comm> mainCatList();

	void annoWriting(Announce anno);

	int insertComImg(Company comp);

	int imgDel(String imgpath11);

	String nullconfirm(String comId1);

}
