package com.instrument.dao;

import java.util.List;

import com.instrument.domain.Instrument;

public interface InstrumentDAO {
    int deleteByPrimaryKey(String barcode);

    int insert(Instrument instrument);

    int insertSelective(Instrument record);

    Instrument selectByPrimaryKey(String barcode);

    int updateByPrimaryKeySelective(Instrument record);

    int updateByPrimaryKey(Instrument record);
    
    List<Instrument> getInstrument();
    
    List<Instrument> dynamicQuery(Instrument instrument);
    
    int countNum();
}