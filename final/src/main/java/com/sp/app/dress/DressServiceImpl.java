package com.sp.app.dress;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("dress.dressService")
public class DressServiceImpl implements DressService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertDress(Dress dto, String pathname) throws Exception {
		try {
			String saveFilename= fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename !=null) {
				dto.setSaveFilename(saveFilename);
			}
			dao.insertData("dress.insertDress",dto); 
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Dress> listDress(Map<String, Object> map) {
		List<Dress> list= null;
		try {
			list= dao.selectList("dress.listDress",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result= dao.selectOne("dress.dataCount",map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Dress readDress(int num) {
		Dress dto= null;
		try {
			dto=dao.selectOne("dress.readDress",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("dress.updateHitCount",num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateDress(Dress dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDress(int num, String pathname, String userId) throws Exception {
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
