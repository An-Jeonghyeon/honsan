package com.sp.app.faq;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("faq.faqService")
public class faqServiceImpl implements faqService{
	@Autowired 
	private CommonDAO dao;
	@Override
	public void insertFaq(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("faq.faqinsert");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
