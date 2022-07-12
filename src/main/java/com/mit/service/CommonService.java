package com.mit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mit.model.CommonDAO;
import com.mit.model.CommonDTO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommonService extends com.mit.service.Service {
	
	CommonDAO commonDao;
	
	public List<CommonDTO> getCompanyList(CommonDTO commonDto) {
		return commonDao.getCompanyList(commonDto);
	}
	
	public Integer insertCompany(CommonDTO commonDto) {
		return commonDao.insertCompany(commonDto);
	}
	
	public List<CommonDTO> getPartList(CommonDTO commonDto) {
		return commonDao.getPartList(commonDto);
	}
	
	public Integer insertPart(CommonDTO commonDto) {
		return commonDao.insertPart(commonDto);
	}
}
