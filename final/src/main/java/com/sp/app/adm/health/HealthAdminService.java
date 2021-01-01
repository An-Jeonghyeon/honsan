package com.sp.app.adm.health;

public interface HealthAdminService {

	//challenge1
	public void insertChallenge(HealthAdmin dto, String pathname) throws Exception;
	public void deleteChallenge(int num, String pathname) throws Exception;
	
	//같이 업데이트
	public void updateChallenge(HealthAdmin dto, String pathname) throws Exception;
	
	//challenge2
	public void insertChallengeMore(HealthAdmin dto) throws Exception;
	
	
	
	
}
