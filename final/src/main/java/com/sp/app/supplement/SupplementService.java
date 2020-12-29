package com.sp.app.supplement;

import java.util.List;
import java.util.Map;

public interface SupplementService {
	//등록, 수정 삭제
	public void insertSupplement(Supplement dto, String pathname) throws Exception;
	public void deleteSupplement(int num, String pathname, String userId) throws Exception;
	public void updateSupplement(Supplement dto, String pathname) throws Exception;
	public Supplement readSupplement(int num);
	
	//리스트
	public List<Supplement> listSupplement(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void updateHitCount(int num) throws Exception;
	
	//이전, 다음 게시글
	public Supplement preReadSupplement(Map<String, Object> map);
	public Supplement nextReadSupplement(Map<String, Object> map);
	
	//베스트 리스트
	public List<Supplement> bestListSupplement(Map<String, Object> map);
	
	//게시글 추천(like)
	public void insertSupplementLike(Map<String, Object> map) throws Exception;
	public int supplementLikeCount(int num);
	public void deleteSupplementLike(Map<String, Object> map) throws Exception;
	public int readSupplementLike(Map<String, Object> map) throws Exception;
	
	//댓글(인서트,딜리트는 답글도 같이)
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int ReplyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	//대댓글
	public List<Reply> listReplyAnswer(int answer);
	public int ReplyAnswerCount(int answer);

	//답글 추천,비추천
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	public void deleteReplyLike(Map<String, Object> map) throws Exception;
}
	
