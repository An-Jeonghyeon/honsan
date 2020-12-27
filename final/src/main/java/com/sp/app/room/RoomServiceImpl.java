package com.sp.app.room;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("room.roomSerivce")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public void insertRoom(Room dto, String pathname) throws Exception {
		try {
			
			if(dto.getMrent()==0) {
				dto.setDealtype("전세");
			}else {
				dto.setDealtype("월세");
			}
			
			int roomSeq = dao.selectOne("room.roomSeq");
			dto.setNum(roomSeq);
			
			
			//메인 이미지
			MultipartFile mainImg = dto.getMainUpload();
			String mainFilename = fileManager.doFileUpload(mainImg, pathname);
			dto.setMainimg(mainFilename);
			
			
			dao.insertData("room.insertRoom", dto);
			
			dao.insertData("room.insertRoomlist", dto);
			
			// 파일 업로드
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFile=fileManager.doFileUpload(mf, pathname);
					if(saveFile==null) continue;
					
					dto.setSaveFile(saveFile);
					
					insertFile(dto);
				}
			}


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
			if(dto.getMrent()==0) {
				dto.setDealtype("전세");
			}else {
				dto.setDealtype("월세");
			}
			
			//메인 이미지
			MultipartFile mainImg = dto.getMainUpload();
			String mainFilename = fileManager.doFileUpload(mainImg, pathname);
			dto.setMainimg(mainFilename);
			
			dao.updateData("room.updateRoom", dto);
			dao.updateData("room.updateRoomlist", dto);
			//  파일 처리
			if(! dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					String saveFile=fileManager.doFileUpload(mf, pathname);
					if(saveFile==null) continue;
					
					
					dto.setSaveFile(saveFile);
					
					insertFile(dto);
				}
			}
			
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
			// 파일 지우기
			List<Room> listFile=listFile(num);
			if(listFile!=null) {
				for(Room dtos:listFile) {
					fileManager.doFileDelete(dtos.getSaveFile(), pathname);
				}
			}
			
			// 파일 테이블 내용 지우기
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			dao.deleteData("room.deleteRoomlist", num);
			dao.deleteData("room.deleteRoom", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Override
	public void insertFile(Room dto) throws Exception {
		try {
			dao.insertData("room.insertFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	@Override
	public List<Room> listFile(int num) {
		List<Room> listFile=null;
		
		try {
			listFile=dao.selectList("room.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFile;
	}

	@Override
	public Room readFile(int fileNum) {
		Room dto=null;
		
		try {
			dto=dao.selectOne("room.readFile", fileNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("room.deleteFile", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	

}
