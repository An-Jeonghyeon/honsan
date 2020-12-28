package com.sp.app.interior;

import java.util.List;
import java.util.Map;

import com.sp.app.notice.Notice;

public interface InteriorService {
	public void insertInterior(Interior dto ,String pathname) throws Exception;
	public List<Interior> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Interior readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	
	public void updateInterior(Interior dto ,String pathname) throws Exception;
	public List<Interior> userlistBoard(Map<String, Object> map);
	public List<Interior> userlistBoard(String userId);
	
	// 파일 인서트 
	public void insertFile(Interior dto) throws Exception;
	public List<Interior> readBoardImg(int num);
	public Interior readFile(int filenum);
	public void deleteFile(Map<String, Object> map) throws Exception ;
}
