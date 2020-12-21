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
	public void preReadSupplement(Map<String, Object> map);
	public void nextReadSupplement(Map<String, Object> map);
	
	//베스트 리스트
	public List<Supplement> bestListSupplement(Map<String, Object> map);
	
	//게시글 추천(like)
	public void insertSupplementLike(Map<String, Object> map) throws Exception;
	public int supplementLikeCount(int num);
	

}
	
