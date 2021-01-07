package com.sp.app.healthStory;

import java.util.List;
import java.util.Map;

import com.sp.app.room.Room;
import com.sp.app.supplement.Supplement;

public interface HealthStoryService {
	public void insertHealthStory(HealthStory dto, String pathname) throws Exception;
	public void deleteHealthStory(int num, String pathname, String userId) throws Exception;
	public void updateHealthStory(HealthStory dto, String pathname) throws Exception;
	public Supplement readHealthStory(int num);
	
	public List<Supplement> listHealthStory(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	//다중파일
	public void insertFile(HealthStory dto) throws Exception;
	public List<Room> listFile(int num);
	public Room readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
	//댓글은 나중에
}
	
