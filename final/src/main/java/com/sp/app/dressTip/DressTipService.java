package com.sp.app.dressTip;

import java.util.List;
import java.util.Map;

public interface DressTipService {
	public void insertDressTip(DressTip dto) throws Exception;
	public List<DressTip> listDressTip(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map);
	public void updateHitCount(int num)throws Exception;
	public  DressTip readDressTip(int num);
	public void deleteDressTip(int num, String userId);
	public void updateDressTip(DressTip dto)throws Exception;
}
