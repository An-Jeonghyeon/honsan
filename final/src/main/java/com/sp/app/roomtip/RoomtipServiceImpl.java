package com.sp.app.roomtip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("room.roomtip")
public class RoomtipServiceImpl implements RoomtipService{
	
	@Autowired
	private CommonDAO dao;

	@Override
	public void insertRoomtip(RoomtipReply dto) throws Exception {
		try {
			dao.insertData("roomtip.insertRoomtip",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<RoomtipReply> listRoomtip(Map<String, Object> map) {
		List<RoomtipReply> list = null;
	      try {
	         list=dao.selectList("roomtip.listRoomtip", map);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
	      try {
	         result=dao.selectOne("roomtip.dataCount",map);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return result;
	}

	@Override
	public void deleteRoomtip(Map<String, Object> map) throws Exception {
		try {
	         dao.deleteData("roomtip.deleteRoomtip", map);
	      } catch (Exception e) {
	      e.printStackTrace();
	      throw e;
	      }
	}
	
	@Override
	public List<RoomtipReply> listCategory(Map<String, Object> map) {
		List<RoomtipReply> listCategory = null;
		try {
			listCategory = dao.selectList("roomtip.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}
	
	
	
}
