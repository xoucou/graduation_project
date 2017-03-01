package com.instrument.service;

import java.util.List;

import com.instrument.domain.InstrumentType;

public interface InstrumentTypeService {	
	public void deleteInstrumentType(String type);
	
	public boolean updateInstrumentType(String type, String newType);

	public void addInstrumentType(String type);
	
	List<InstrumentType> getInstrumentType();
	
}
