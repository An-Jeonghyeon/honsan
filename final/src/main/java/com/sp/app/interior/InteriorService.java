package com.sp.app.interior;

import java.util.List;
import java.util.Map;

public interface InteriorService {
	public void insertInterior(Interior dto ,String pathname) throws Exception;
	public List<Interior> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Interior readBoard(int num);
	public void updateHitCount(int num) throws Exception;
	
	// 파일 인서트 
	public void insertFile(Interior dto) throws Exception;
	public List<Interior> readBoardImg(int num);
}
