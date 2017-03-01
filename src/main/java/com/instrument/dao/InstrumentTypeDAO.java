package com.instrument.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.instrument.domain.InstrumentType;

public interface InstrumentTypeDAO {
    int deleteByPrimaryKey(String Instrumenttypeid);

    int insert(String record);

    int insertSelective(InstrumentType record);

    InstrumentType selectByPrimaryKey(Integer instrumenttypeid);

    int updateByPrimaryKeySelective(@Param("instrumenttypeid")String type, @Param("instrumenttypename")String newType);

    int updateByPrimaryKey(InstrumentType record);
    
    List<InstrumentType> getInstrumentType();  
    
    int countInstrumentType(String instrumentType); 
    
    ArrayList<InstrumentType> getType();
    
    
}