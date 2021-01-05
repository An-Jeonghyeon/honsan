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
	
	//사용자 도전
	public void insertUserChallenge(Challenge dto) throws Exception; //인서트
	public void updateTotalCount(Map<String, Object> map) throws Exception; //토탈카운트 증가
	public void updateCompletion(Map<String, Object> map) throws Exception; //토탈카운트 증가
	public Challenge readUserChallengeOne(Map<String, Object> map); //도전중인 챌린지 하나 읽어오기

}
