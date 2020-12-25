package com.sp.app.room;

import java.util.List;
import java.util.Map;


public interface RoomService {
	public void insertRoom(Room dto, String pathname) throws Exception; //방 등록
	
	public List<Room> listRoom(Map<String, Object> map); //방 리스트
	public int dataCount(Map<String, Object> map);
	public Room readRoom(int num);
	public void updateRoom(Room dto, String pathname) throws Exception;
	public void deleteRoom(int num, String pathname, String userId) throws Exception;
	
	public void insertFile(Room dto) throws Exception;
	public List<Room> listFile(int num);
	public Room readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
	/* 댓글
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	*/
}
