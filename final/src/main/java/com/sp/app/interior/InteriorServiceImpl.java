package com.sp.app.interior;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.bbs.Board;
import com.sp.app.common.dao.CommonDAO;

@Service("interior.interiorService")
public class InteriorServiceImpl implements InteriorService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertInterior(Interior dto) throws Exception {
		try {
			int seq= dao.selectOne("interior.seq");
			dto.setNum(seq);
			
			dao.insertData("interior.insertInterior", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Interior> listBoard(Map<String, Object> map) {
		List<Interior> list = null;
		try {
			list = dao.selectList("interior.interiorlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("interior.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Interior readBoard(int num) {
		Interior dto = null;
		try {
			dto = dao.selectOne("interior.readBoard", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
