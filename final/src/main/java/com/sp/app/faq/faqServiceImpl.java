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
	@Override
	public int dataCount(Map<String, Object>map) throws Exception {
		int result=0;
		try {
			result= dao.selectOne("faq.faqDatacount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public void deleteFaq(int num) throws Exception {
		try {
			
			dao.deleteData("faq.faqDelete",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@Override
	public Faq readFaq(int num) throws Exception {
		Faq dto = null;
		try {
			dto = dao.selectOne("faq.readFaq",num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	@Override
	public List<Faq> faqMainlist() {
		List<Faq> list =null;
		try {
			list= dao.selectList("faq.faqMainlist");
		} catch (Exception e) {
		e.printStackTrace();
		}
		return list;
	}
	
	

}
