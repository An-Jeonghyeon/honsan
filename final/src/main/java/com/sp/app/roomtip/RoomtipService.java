package com.sp.app.roomtip;

import java.util.List;
import java.util.Map;

public interface RoomtipService {
	public void insertRoomtip(RoomtipReply dto) throws Exception;
	public List<RoomtipReply> listRoomtip(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void deleteRoomtip(Map<String, Object> map)throws Exception;
	public List<RoomtipReply> listCategory(Map<String, Object> map);
	
}
