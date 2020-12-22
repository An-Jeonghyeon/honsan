package com.sp.app.interior;

import java.util.List;
import java.util.Map;

public interface InteriorService {
	public void insertInterior(Interior dto) throws Exception;
	public List<Interior> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Interior readBoard(int num);
}
