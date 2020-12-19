package com.sp.app.dress;

import java.io.File;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;
@Controller("dress.dressController")
@RequestMapping("/dress/*")
public class DressController {
	
	@Autowired
	private DressService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String DressList(@RequestParam(value = "page",defaultValue = "1")int current_page,
							@RequestParam(defaultValue = "all")String condition,
							@RequestParam(defaultValue = "") String keyword,
							HttpServletRequest req,
							Model model) throws Exception{
		int rows =9;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword,"utf-8");
		}
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword",keyword);
		
		dataCount=service.dataCount(map);
		
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page) {
			current_page= total_page;
		}
		int offset= (current_page-1) *rows;
		if(offset<0) {
			offset=0;
		}
		map.put("offset", offset);
		map.put("rows",rows);
		
		List<Dress> list = service.listDress(map); 
		
		int listNum;
		int n=0;
		for(Dress dto:list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
		}
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/dress/list";
		String articleUrl = cp+"/dress/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition="+condition + "&keyword=" 
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
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".dress.list";
	}
	
	
	@GetMapping("created")
	public String DressCreated() throws Exception{
		
		return ".dress.created";
	}
	@PostMapping("created")
	public String DressCreatedSubmit(Dress dto, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"bbs";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDress(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dress/list";
	}
	@RequestMapping("article")
	public String DressArticle() throws Exception{
		return ".dress.article";
	}
}
