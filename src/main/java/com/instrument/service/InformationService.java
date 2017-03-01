package com.instrument.service;

import com.instrument.domain.Information;

public interface InformationService {
	
	public void updateInformation(Information information);
	
	String getDetail(String name);
		
}
