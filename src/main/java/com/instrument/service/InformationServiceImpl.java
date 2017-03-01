package com.instrument.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.instrument.dao.InformationDAO;
import com.instrument.domain.Information;
@Service("informationService")
public class InformationServiceImpl implements InformationService {

	@Resource(name = "informationDAO")
	private InformationDAO informationDAO;
	
	
	public void updateInformation(Information information) {
		informationDAO.updateByPrimaryKey(information);
		
	}


	@Override
	public String getDetail(String name) {
	
		return informationDAO.selectByPrimaryKey(name).getDetail();
	}

}
