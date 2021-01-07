package com.sp.app.interiorTip;

import java.util.List;
import java.util.Map;


import com.sp.app.interior.Reply;






public interface InteriorTipService {
	public void insertBoard(InteriorTip dto) throws Exception;
	public void updateHitCount(int num) throws Exception;
	public InteriorTip readBoard(int num);
	public InteriorTip preReadBoard(Map<String, Object> map);
	public InteriorTip nextReadBoard(Map<String, Object> map);
	public void updateBoard(InteriorTip dto) throws Exception;
	public void deleteBoard(int num , String userId) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<InteriorTip> listBoard(Map<String, Object> map);
	public List<InteriorTip> listAllBoard(Map<String, Object> map);
	

	//댓글 
	public void insertReply(Reply dto) throws Exception ;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map) ;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	//좋아요 
	
	public void insertInteriorTipLike(Map<String, Object> map) throws Exception;
	public int interiorTipLikeCount(int num);
	public int readInteriorTipLike(Map<String, Object> map) throws Exception;
	public void deleteInteriorTipLike(Map<String, Object> map) throws Exception;
}
