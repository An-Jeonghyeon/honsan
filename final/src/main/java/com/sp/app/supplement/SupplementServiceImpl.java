package com.sp.app.supplement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("supplement.SupplementService")
public class SupplementServiceImpl implements SupplementService {

	@Autowired
	private CommonDAO dao; //이거 이미 만들어둔거
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertSupplement(Supplement dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);
				dao.insertData("supplement.insertSupplement", dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public List<Supplement> listSupplement(Map<String, Object> map) {
		List<Supplement> list=null;
		try {
			list=dao.selectList("supplement.listSupplement", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("supplement.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("supplement.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void insertSupplementLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("supplement.insertSupplementLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public int supplementLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("supplement.supplementLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@Override
	public List<Supplement> bestListSupplement(Map<String, Object> map) {
		List<Supplement> list = null;
		try {
			list = dao.selectList("supplement.listSupplementBest");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void deleteSupplement(int num, String pathname, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void updateSupplement(Supplement dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public Supplement readSupplement(int num) {
		Supplement dto=null;
		try {
			dto=dao.selectOne("supplement.readSupplement", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public void preReadSupplement(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void nextReadSupplement(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}


	
	

}
