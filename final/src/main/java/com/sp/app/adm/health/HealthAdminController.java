package com.sp.app.adm.health;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;

@Controller("adm.health.healthAdminController")
@RequestMapping("/adm/health/*")
public class HealthAdminController {

	@Autowired
	private HealthAdminService service;
	
	@Autowired
	private MyUtil myutil;
	
	//이건 관리자 페이지라서 
	@RequestMapping("list")
	public String listHealthAdmin(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "name") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			)throws Exception {
			
		String cp = req.getContextPath();
		
		int rows = 10;
		int totalPage = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0) {
			totalPage = myutil.pageCount(rows, dataCount);
		}
		if(totalPage<current_page) {
			current_page = totalPage;
		}
		
		int offset = (current_page-1)*rows;
		if(offset<0) {
			offset=0;
		}
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<HealthAdmin> list = service.listChallenge(map);
		
		int listNum=0;
		int n=0;
		for(HealthAdmin dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		//쿼리
		String query = "";
		String list_url = cp+"/adm/health/list";
		String article_url = cp+"/adm/health/article?page="+current_page;
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(keyword.length()!=0) {
			list_url= cp+"/adm/health/list?"+query;
			article_url = cp+"/adm/health/article?page="+current_page+ "&"+query;
		}
		
		//페이징
		String paging = myutil.paging(current_page, totalPage, list_url);
		

		
        model.addAttribute("list", list);
        model.addAttribute("article_url", article_url);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", totalPage);
        model.addAttribute("paging", paging);
        
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".adm.health.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {                          
		
		model.addAttribute("mode", "created");
		return ".adm.health.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			HealthAdmin dto,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+"uploads"+File.separator+"challenge";
		
		
		try {
			service.insertChallenge(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "redirect:/adm/health/list";
	}

	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="name") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="pageNo="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"challenge";
		
		service.deleteChallenge(num, pathname);
		
		return "redirect:/adm/health/list?"+query;
	}
	
	@RequestMapping(value="article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model) throws Exception {

		
		return "";
	}

	
} 
