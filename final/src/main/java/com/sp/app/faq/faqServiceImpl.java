package com.sp.app.faq;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;
@Service("faq.faqService")
public class faqServiceImpl implements faqService{
	@Autowired 
	private CommonDAO dao;
	@Override
	public void insertFaq(Faq dto) throws Exception {
		try {
			dao.insertData("faq.faqinsert",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public List<Faq> faqList(Map<String, Object> map) throws Exception {
		List<Faq> list = null;
		try {
			list= dao.selectList("faq.faqList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	

}
