package com.sp.app.dressMain;

import java.util.List;
import java.util.Map;

public interface DressMainService {
	public Map<String, Object> serializeNode(String spec);
	public String documnetWriter(String spec);
	
	public List<DressMain> selectXYcode(String city);
}
