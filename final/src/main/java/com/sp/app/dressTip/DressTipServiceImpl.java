package com.sp.app.dressTip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("dressTip.dressTipService")
public class DressTipServiceImpl implements DressTipService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertDressTip(DressTip dto) throws Exception {
		try {
		 dao.insertData("dressTip.insertdressTip",dto);
		} catch (Exception e) {
		 e.printStackTrace();
		 throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result= 0;
		try {
			result=dao.selectOne("dressTip.dateCountDressTip",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<DressTip> listDressTip(Map<String, Object> map) throws Exception {
		List<DressTip> list = null;
		try {
			list=dao.selectList("dressTip.listDressTip",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
