package com.sp.app.cook.honCooq.cookTip;

import java.util.List;
import java.util.Map;

public interface CookTipService {
	public void insertCookTip(CookTip dto, String pathname) throws Exception;
	public List<CookTip> listCookTip(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public CookTip readCookTip(int num);
	public void updateHitCount(int num) throws Exception;
	public CookTip preReadCookTip(Map<String, Object> map);
	public CookTip nextReadCookTip(Map<String, Object> map);
	public void updateCookTip(CookTip dto) throws Exception;
	public void deleteCookTip(int num, String userId) throws Exception;
	
	public void insertCookTipLike(Map<String, Object> map) throws Exception;
	public int CookTipLikeCount(int num);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
}
