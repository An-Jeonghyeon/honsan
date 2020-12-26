package com.sp.app.dress;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("dress.dressService")
public class DressServiceImpl implements DressService{
	
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public void insertDress(Dress dto) throws Exception {
		try {
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
	public void updateDress(Dress dto) throws Exception {
		try {
			dao.updateData("dress.updateDress",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteDress(int num, String userId) throws Exception {
		try {
			Dress dto =readDress(num);
			if(dto==null || (!userId.equals("admin")) && ! dto.getUserId().equals(userId)) {
				return;
			}
			dao.deleteData("dress.deleteDress",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertDressReply(DressReply dto) throws Exception {
		try {
			dao.insertData("dress.insertDressReply",dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<DressReply> listReply(Map<String, Object> map) {
		List<DressReply> list =null;
		try {
			list=dao.selectList("dress.listReply",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int DressReplyCount(Map<String, Object> map) {
		int result =0;
		try {
			result= dao.selectOne("dress.DressReplyCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteDressReply(Map<String, Object> map) throws Exception {
		try {
				dao.deleteData("dress.deleteDressReply");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
