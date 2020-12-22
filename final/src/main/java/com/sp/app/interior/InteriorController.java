package com.sp.app.interior;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.sp.app.bbs.Board;
import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("interior.interiorController")
@RequestMapping("/interior/*")
public class InteriorController {
	
	@Autowired
	private InteriorService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("main")
	public String InteriorList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{

		int rows = 16;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if (dataCount!=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * rows;
		if (offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Interior> list = service.listBoard(map);
			
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/interior/list";
		String articleUrl = cp+"/interior/boardItem?page=" + current_page;
		if (keyword.length() != 0) {
			query =  "&keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
		
		return ".interior.InteriorMain";
	}
	
	@RequestMapping(value="created" , method = RequestMethod.GET)
	public String InteriorForm(
			Model model
			) throws Exception{
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return ".interior.interior_created";
	}
	
	@RequestMapping(value="created" , method = RequestMethod.POST)
	public String Interiorsubmit(
			Interior dto,
			HttpSession session,
			@RequestParam(value="category" ,defaultValue = "" , required = true) List<String> categorys)
			 throws Exception{
		
		
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			String tags = "" ;
			for(String category : categorys) {
				
				tags += category.trim();
			}
			
			dto.setUserId(info.getUserId());
			dto.setCategory(tags);
			service.insertInterior(dto);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/interior/main";
		
	}
	
	@RequestMapping(value = "boardItem" , method = RequestMethod.GET)
	public String boardItem(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "1")String page,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		//service.updateHitCount(num);

			
		Interior dto = service.readBoard(num);
		if (dto==null) {
			return "redirect:/interior/main?"+query;
		}
		
			
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
			
		map.put("keyword", keyword);
					
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		String category = dto.getCategory();
		
		if(category!=null) {
			String categorylist[] = dto.getCategory().trim().split("#");			
			model.addAttribute("categorylist", categorylist);
		}
			

		return ".interior.boardItem";
	}
}
