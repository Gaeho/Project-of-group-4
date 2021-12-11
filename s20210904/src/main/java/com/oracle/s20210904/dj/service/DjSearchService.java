package com.oracle.s20210904.dj.service;

import java.util.List;

import com.oracle.s20210904.comm.model.Company;
import com.oracle.s20210904.dj.model.DjSearch;

public interface DjSearchService {

    List<DjSearch> searchAnno(DjSearch djsearch);

	List<Company> searchCom(Company company);
	

}
