package com.sp.app.healthStory;

import java.util.List;
import java.util.Map;

public interface HealthStoryService {
	public void insertHealthStory(HealthStory dto, String pathname) throws Exception;
	public void deleteHealthStory(int num, String pathname, String userId) throws Exception;
	public void updateHealthStory(HealthStory dto, String pathname) throws Exception;
	public HealthStory readHealthStory(int num);
	
	public List<HealthStory> listHealthStory(Map<String, Object> map);
	public int dataCount();
	
	//다중파일
	public void insertFile(HealthStory dto) throws Exception;
	public List<HealthStory> listFile(int num);
	public HealthStory readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;
	
	//댓글은 나중에
}
	
