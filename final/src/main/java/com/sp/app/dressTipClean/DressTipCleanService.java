package com.sp.app.dressTipClean;

import java.util.List;
import java.util.Map;

public interface DressTipCleanService {
	public void insertDressTipClean(DressTipClean dto) throws Exception;
	public List<DressTipClean> listDressTipClean(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	public void updateHitCount(int num)throws Exception;
	public  DressTipClean readDressTipClean(int num);
	public void deleteDressTipClean(int num, String userId);
	public void updateDressTipClean(DressTipClean dto)throws Exception;
}
