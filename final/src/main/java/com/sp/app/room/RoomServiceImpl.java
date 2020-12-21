package com.sp.app.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.dao.CommonDAO;

@Service("room.roomSerivce")
public class RoomServiceImpl implements RoomService{
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertRoom(Room dto) throws Exception {
		try {
			
			List<String> aditemslist=dto.getAditems();
			String aditem="";
			
			for(String aditems:aditemslist) {
				aditem+=aditems+" ";
			}
			dto.setAditem(aditem);
			
			
			List<String> optionlist=dto.getOption();
			
			String options="";
			
			for(String option:optionlist) {
				options+=option+" ";
			}
			dto.setAditem(options);
			
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

}
