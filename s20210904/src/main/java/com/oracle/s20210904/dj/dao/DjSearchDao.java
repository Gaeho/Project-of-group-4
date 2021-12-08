package com.oracle.s20210904.dj.dao;

import java.util.List;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.dj.model.DjSearch;

public interface DjSearchDao {

	List<DjSearch> searchAnno(String mainsearch);

	List<Company> searchCom(String mainsearch);

}
