package com.sp.app.roomChecklist;

import java.util.List;
import java.util.Map;


public interface RoomChecklistService {
	public void insertChecklist(RoomChecklist dto) throws Exception; //리스트 등록
	
	public List<RoomChecklist> listChecklist(Map<String, Object> map);
	public RoomChecklist readChecklist(Map<String , Object> map);
	public int dataCount(String userId);
	public void updateChecklist(RoomChecklist dto) throws Exception;
	public void deleteChecklist(int num,String userId) throws Exception;
	
}
