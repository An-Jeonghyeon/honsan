package com.sp.app.roomChecklist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("room.roomChecklistServier")
public class RoomChecklistServiceImpl implements RoomChecklistService{
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertChecklist(RoomChecklist dto) throws Exception {
		try {
			dao.insertData("roomChecklist.insertRoomChecklist", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<RoomChecklist> listChecklist(Map<String, Object> map) {
		List<RoomChecklist> list = null;
		try {
			list = dao.selectList("roomChecklist.listRoomChecklist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(String userId) {
		int result = 0;
		
		try {
			result = dao.selectOne("roomChecklist.dataCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateChecklist(RoomChecklist dto) throws Exception {
		try {
			dao.updateData("roomChecklist.updateRoomChecklist", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteChecklist(int num, String userId) throws Exception {
		try {
			Map<String , Object> map = new HashMap<>();
			map.put("num", num);
			map.put("userId", userId);
			
			RoomChecklist dto = readChecklist(map);
			if (dto==null || (! userId.equals("admin") && ! dto.getUserId().equals(userId))) {
				return;
			}
			dao.deleteData("roomChecklist.deleteRoomChecklist", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public RoomChecklist readChecklist(Map<String , Object> map) {
		RoomChecklist dto = null;
		
		try {
			dto = dao.selectOne("roomChecklist.readRoomChecklist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	
	
	
}
