package com.instrument.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.instrument.dao.InstrumentDAO;
import com.instrument.domain.Instrument;
import com.instrument.domain.InstrumentType;

@Service("instrumentService")
public class InstrumentServiceImpl implements InstrumentService{
	
	@Resource(name = "instrumentDAO")
	private InstrumentDAO id;
	
	
	public List<Instrument> listInstrument(Instrument instrument) {
		String date = instrument.getDate();
		List<Instrument> list = id.dynamicQuery(instrument);
		
		return list;
	}

	@Override
	public void addInstrument(/*String barcode, String instrumentphoto,String instrumentname, String instrumenttype, Integer count, String date*/Instrument instrument) {
		id.insert(instrument);
		
	}

	@Override
	public void deleteInstrument(String barcode) {
		// TODO Auto-generated method stub
		id.deleteByPrimaryKey(barcode);
	}

	@Override
	public void updateInstrument(Instrument instrument) {
		// TODO Auto-generated method stub
		
	}

}
