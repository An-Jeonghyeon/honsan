package com.sp.app.dress;

import java.util.List;
import java.util.Map;

public interface DressService {
	public void insertDress(Dress dto) throws Exception;
	public List<Dress> listDress(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Dress readDress(int num);
	public void updateHitCount(int num) throws Exception;
	public void updateDress(Dress dto)throws Exception;
	public void deleteDress(int num,String userId)throws Exception;
	public void insertDressLikeCount(Map<String, Object>map) throws Exception;
	public int DressLikeCount(int num);
	public void deleteDressLikeCount(Map<String, Object>map) throws Exception;
	public List<Dress> bestlist(Map<String, Object>map);
	
	
	public void insertDressReply(DressReply dto) throws Exception;
	public List<DressReply> listReply(Map<String, Object> map);
	public int DressReplyCount(Map<String, Object> map);
	public void deleteDressReply(Map<String, Object>map) throws Exception;
	
	public List<DressReply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	public int thumbColor(Map<String, Object> map) throws Exception;

	public void insertReplyLike(Map<String, Object>map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object>map);
}
