package com.sp.app.dressTipClean;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("dressTipClean.dressTipCleanService")
public class DressTipCleanServiceImpl implements DressTipCleanService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertDressTipClean(DressTipClean dto) throws Exception {
		try {
		 dao.insertData("dressTipClean.insertdressTipClean",dto);
		} catch (Exception e) {
		 e.printStackTrace();
		 throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result= 0;
		try {
			result=dao.selectOne("dressTipClean.dateCountDressTipClean",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<DressTipClean> listDressTipClean(Map<String, Object> map) throws Exception {
		List<DressTipClean> list = null;
		try {
			list=dao.selectList("dressTipClean.listDressTipClean",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		
		try {
			dao.selectOne("dressTipClean.updateHitCount",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	@Override
	public DressTipClean readDressTipClean(int num) {
		DressTipClean dto= null;
		try {
			dto= dao.selectOne("dressTipClean.readDressTipClean",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void deleteDressTipClean(int num, String userId) {
		DressTipClean dto = readDressTipClean(num);
		if(dto==null||(!userId.equals("admin")) && !dto.getUserId().equals(userId)) {
			return;
		}
		try {
			 dao.deleteData("dressTipClean.deletedressTipClean",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDressTipClean(DressTipClean dto) throws Exception {
		try {
			dao.updateData("dressTipClean.updatedressTipClean",dto);
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
	}

}
