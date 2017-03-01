package com.instrument.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.instrument.dao.InstrumentTypeDAO;
import com.instrument.domain.InstrumentType;

@Service("instrumentTypeService")
public class InstrumentTypeServiceImpl implements InstrumentTypeService {

	@Resource(name = "instrumentTypeDAO")
	private InstrumentTypeDAO itd;

	private List<InstrumentType> instrumentTypeList;



	@Override
	public boolean updateInstrumentType(String type, String newType) {
		InstrumentTypeServiceImpl its = null;
		boolean a = its.checkRepeat(type);
		if(a == true){
			itd.updateByPrimaryKeySelective(type, newType);
			return true;
		}
		
		return false;
	}


	// @Override
	// public List<InstrumentType> getUser(String type) {
	// if (type.getPage() == null) {
	// type.setPage(new CurrentPage());
	// }
	// Integer rows = itd.countInstrumentType(type);
	// type.getPage().setTotalCount(rows);
	// CurrentPage page = clientVersionVo.getPage();
	// List<ClientVersionVo> list = userDao.getUser(userVo);
	// return list;
	// }
	public boolean checkRepeat(String type){
		List<InstrumentType> list = itd.getType();
		for (InstrumentType l : list) {
			if (l.getInstrumenttypename().equals(type)) {
				return true;
			}
		}
		return false;		
	}


	@Override
	public void deleteInstrumentType(String type) {
		itd.deleteByPrimaryKey(type);
		
	}


	@Override
	public void addInstrumentType(String type) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public List<InstrumentType> getInstrumentType() {
		return itd.getInstrumentType();
	}



}
