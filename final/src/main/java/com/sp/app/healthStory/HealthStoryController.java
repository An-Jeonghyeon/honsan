package com.sp.app.healthStory;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.member.SessionInfo;

@Controller("healthStory.healthStoryController")
@RequestMapping("/healthStory/*")
public class HealthStoryController {
	
	@Autowired
	private HealthStoryService service;
	
//	@Autowired
//	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
//			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
//		
//		
//		int rows = 3;
//		int dataCount= service.dataCount();
//		int total_page=myUtil.pageCount(rows, dataCount);
//		
//		if(current_page > total_page) {
//			current_page = total_page;
//		}
//
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		int offset = (current_page - 1) * rows;
//		if(offset < 0) offset = 0;
//		map.put("offset", offset);
//		map.put("rows", rows);
//		
//		List<HealthStory> list = service.listHealthStory(map);
//		for(HealthStory dto : list) {
//			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
//		}
//		
//		// 처리 결과를 JSON 으로 변환하여 전송
//		
//		model.addAttribute("dataCount", dataCount);
//		model.addAttribute("total_page", total_page);
//		model.addAttribute("pageNo", current_page);
//		model.addAttribute("list", list);
//		
		return ".healthStory.list";
	}
	
	//글쓰기 폼
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".healthStory.created";
	}
	
	//글쓰기 
	@RequestMapping(value = "created", method = RequestMethod.POST) 
	public String createdSubmit(
			HealthStory dto, 
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"healtyStory";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertHealthStory(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/healthStory/list";
	}
	

	
	
	
}
