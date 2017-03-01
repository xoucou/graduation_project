package com.instrument.dao;

import com.instrument.domain.Information;

public interface InformationDAO {
	int deleteByPrimaryKey(String informationname);

    int insert(Information record);

    int insertSelective(Information record);

    Information selectByPrimaryKey(String informationname);

    int updateByPrimaryKeySelective(Information record);

    int updateByPrimaryKey(Information record);
    
	void updateInformation(String name);

	String getDetail(String name);
}
