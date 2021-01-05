package com.sp.app.faq;

import java.util.List;
import java.util.Map;

public interface faqService {
	public void insertFaq(Faq dto) throws Exception;
	public List<Faq> faqList(Map<String, Object>map)throws Exception;
	public int dataCount(Map<String, Object>map)throws Exception;
	public Faq readFaq(int num) throws Exception;
	public void deleteFaq(int num)throws Exception;
	public List<Faq> faqMainlist();
}
