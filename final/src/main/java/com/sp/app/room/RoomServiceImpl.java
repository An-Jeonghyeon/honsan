package com.sp.app.room;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("room.roomSerivce")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private CommonDAO dao;
	/*
	@Autowired
	private FileManager fileManager;
	*/
	@Override
	public void insertRoom(Room dto) throws Exception {
		try {
			
			if(dto.getMrent()==0) {
				dto.setDealtype("전세");
			}else {
				dto.setDealtype("월세");
			}
			
			int roomSeq = dao.selectOne("room.roomSeq");
			dto.setNum(roomSeq);
			
			
			// 회원정보 저장
			dao.insertData("room.insertRoom", dto);
			
			dao.insertData("room.insertRoomlist", dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Room> listRoom(Map<String, Object> map) {
		List<Room> list = null;
		try {
			list = dao.selectList("room.listRoom", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("room.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Room readRoom(int num) {
		Room dto = null;
		
		try {
			dto = dao.selectOne("room.readRoom", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateRoom(Room dto, String pathname) throws Exception {
		try {
			/*  파일 처리
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if (saveFilename!=null) {
				if (dto.getSaveFilename().length()!=0) {
					// 기존 파일 삭제하기
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				// 새로 업로드 된 파일
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}*/
			
			dao.updateData("room.updateRoom", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteRoom(int num, String pathname, String userId) throws Exception {
		try {
			Room dto = readRoom(num);
			if (dto==null || (! userId.equals("admin") && ! dto.getUserId().equals(userId))) {
				return;
			}
			/*
			if (dto.getSaveFilename()!=null) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			}*/
			
			dao.deleteData("room.deleteRoom", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
