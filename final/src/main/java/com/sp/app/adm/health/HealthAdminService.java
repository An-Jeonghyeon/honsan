package com.sp.app.adm.health;

import java.util.List;
import java.util.Map;

public interface HealthAdminService {

	//challenge1
	public void insertChallenge(HealthAdmin dto, String pathname) throws Exception;
	public void deleteChallenge(long num, String pathname) throws Exception; //둘다 전체지우는거 같이
	public HealthAdmin readChallenge(long num); 
	public List<HealthAdmin> listChallenge(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	//같이 업데이트
	public void updateChallenge(HealthAdmin dto, String pathname) throws Exception;
	
	//challenge2
	public void insertChallengeMore(HealthAdmin dto) throws Exception;
	public List<HealthAdmin> listChallenge2(long num); //상세정보 리스트
	public HealthAdmin readChallenge2(Map<String, Object> map);
	public void deleteChallenge2(Map<String, Object> map) throws Exception; //상세정보만 개별삭제
	
	
}
