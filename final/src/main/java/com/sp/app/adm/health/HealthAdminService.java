package com.sp.app.adm.health;

import java.util.List;
import java.util.Map;

public interface HealthAdminService {

	//challenge1
	public void insertChallenge(HealthAdmin dto, String pathname) throws Exception;
	public void deleteChallenge(int num, String pathname) throws Exception;
	public HealthAdmin readChallenge(int num); 
	public List<HealthAdmin> listChallenge(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	//같이 업데이트
	public void updateChallenge(HealthAdmin dto, String pathname) throws Exception;
	
	//challenge2
	public void insertChallengeMore(HealthAdmin dto) throws Exception;
	
	
	
	
}
