package com.sp.app.challenge;

import java.util.List;
import java.util.Map;

public interface ChallengeService {
	
	public Challenge readChallenge(long num); 
	public List<Challenge> listChallenge(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public List<Challenge> listChallenge2(long num); //상세정보 리스트
	public Challenge readChallenge2(Map<String, Object> map);
//	public List<Challenge> listChallenge3(List<Challenge> list);
	
}
