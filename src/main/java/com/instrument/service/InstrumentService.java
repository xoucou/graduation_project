package com.instrument.service;

import java.util.List;

import com.instrument.domain.Instrument;
import com.instrument.domain.InstrumentType;

public interface InstrumentService {
		
	public void addInstrument(Instrument instrument);
	
	public void deleteInstrument(String barcode);
	
	public void updateInstrument(Instrument instrument);

	List<Instrument> listInstrument(Instrument instrument);
	
}
