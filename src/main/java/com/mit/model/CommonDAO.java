package com.mit.model;

import java.util.List;

public interface CommonDAO {
	public List<CommonDTO> getCompanyList(CommonDTO commonDto);
	
	public Integer insertCompany(CommonDTO commonDto);
	
	public List<CommonDTO> getPartList(CommonDTO commonDto);
	
	public Integer insertPart(CommonDTO commonDto);
}
