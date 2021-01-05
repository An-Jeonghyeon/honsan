package com.sp.app.faq;

import java.util.List;
import java.util.Map;

public interface faqService {
	public void insertFaq(Faq dto) throws Exception;
	public List<Faq> faqList(Map<String, Object>map)throws Exception;
	 
}
