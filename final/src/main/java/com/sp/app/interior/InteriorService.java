package com.sp.app.interior;

import java.util.List;
import java.util.Map;



public interface InteriorService {
	public void insertInterior(Interior dto ,String pathname) throws Exception;
	public List<Interior> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Interior readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	public void deleteBoard(Map<String, Object> map) throws Exception;
	public Interior readprofile(Map<String, Object> map) throws Exception;
	public int mdataCount(Map<String, Object> map);
	
	public void updateInterior(Interior dto ,String pathname) throws Exception;
	public List<Interior> userlistBoard(Map<String, Object> map);
	public List<Interior> userlistBoard(String userId);
	
	// 파일 인서트 
	public void insertFile(Interior dto) throws Exception;
	public List<Interior> readBoardImg(int num);
	public Interior readFile(int filenum);
	public void deleteFile(Map<String, Object> map) throws Exception ;
	
	// 게시판 좋아요 
	
	public void insertInteriorLike(Map<String, Object> map) throws Exception;
	public int interiorLikeCount(int num);
	public int readInteriorLike(Map<String, Object> map) throws Exception;
	public void deleteInteriorLike(Map<String, Object> map) throws Exception;
	
	// 게시판 찜
	
	public void insertInteriorZzim(Map<String, Object> map) throws Exception;
	public int interiorZzimCount(int num);
	public int readInteriorZzim(Map<String, Object> map) throws Exception;
	public void deleteInteriorZzim(Map<String, Object> map) throws Exception;
	
	//댓글 
	public void insertReply(Reply dto) throws Exception ;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map) ;
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	//대댓글 
	public List<Reply> listReplyAnswer(int answer);

}
