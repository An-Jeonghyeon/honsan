package com.sp.app.challenge;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("challenge.challengeService")
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private CommonDAO  dao;
	
	@Override
	public Challenge readChallenge(long num) {
		Challenge dto =null;
		try {
			dto=dao.selectOne("challenge.readChallenge", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


	@Override
	public List<Challenge> listChallenge(Map<String, Object> map) {
		List<Challenge> list=null;
		
		try {
			list=dao.selectList("challenge.listChallenge", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("challenge.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Challenge> listChallenge2(long num) {
		List<Challenge> listChallenge2=null;
		try {
			listChallenge2=dao.selectList("challenge.listChallenge2", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listChallenge2;
	}

	@Override
	public Challenge readChallenge2(Map<String, Object> map) {
		Challenge dto =null;
		try {
			dto=dao.selectOne("challenge.readChallenge2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

//	@Override
//	public List<Challenge> listChallenge3(List<Challenge> list) {
//		List<Challenge> listChallenge3=null;
//		try {
//			for(Challenge s : list) {
//		      	int start = Integer.parseInt(s.getStartDate());
//	        	int end = Integer.parseInt(s.getEndDate());
//	        	
//	        	for(int i=start; i<=end; i++) {
//	        		
//	        	}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return listChallenge3;
//	}
}
