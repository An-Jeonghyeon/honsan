package com.sp.app.healthStory;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.sp.app.room.Room;
import com.sp.app.supplement.Supplement;

@Service("today.TodayService")
public class HealthStoryServiceImpl implements HealthStoryService {

	@Override
	public void insertHealthStory(HealthStory dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteHealthStory(int num, String pathname, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateHealthStory(HealthStory dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Supplement readHealthStory(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Supplement> listHealthStory(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insertFile(HealthStory dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Room> listFile(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Room readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
