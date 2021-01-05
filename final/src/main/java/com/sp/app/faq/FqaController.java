package com.sp.app.faq;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FqaController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private faqService service;
	
	
//	@RequestMapping(value = "main")
//	public String FaqMain()throws Exception{
//		return ".faq.main";
//	}	
	
	@RequestMapping(value = "created", method= RequestMethod.GET)
	public String FaqCreatedFrom(Model model)throws Exception{
		model.addAttribute("mode","created");
		return ".faq.created";
	}
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String FaqCreatedSubmit(Faq dto , HttpSession session)throws Exception{
		SessionInfo info= (SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertFaq(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/faq/main";
	}
	@RequestMapping(value = "main")
	public String FaqList(@RequestParam(value="page", defaultValue="1")int current_page,
						  @RequestParam(defaultValue="member")String questionSelect,
						  @RequestParam(defaultValue="")String keyword,
						  HttpServletRequest req,
						  Model model
							)throws Exception{
		int rows =10;
		int total_page =0;
		int dataCount =0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("questionSelect", questionSelect);
		map.put("keyword", keyword);
		
//		dataCount = service.dataCount(map);
		if(dataCount !=0) {
			total_page= myUtil.pageCount(rows, dataCount);
		}
		if(total_page < current_page) {
			current_page=total_page;
		}
		int offset =(current_page-1)* rows;
		if(offset<0)offset=0;
		map.put("offset",offset);
		map.put("rows", rows);
		
		List<Faq> list = service.faqList(map);
		int listNum ,n =0;
		for(Faq dto:list) {
			listNum= dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		 
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		
		model.addAttribute("questionSelect", questionSelect);
		model.addAttribute("keyword", keyword);
		
		
		return ".faq.main";
	}
}
