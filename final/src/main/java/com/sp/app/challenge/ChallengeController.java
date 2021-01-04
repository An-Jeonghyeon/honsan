package com.sp.app.challenge;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;

@Controller("challenge.challengeController")
@RequestMapping("/challenge/*")
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="name") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();

		int rows = 6;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page = total_page;
		}
		
	    int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
		List<Challenge> list = service.listChallenge(map);

        String query = "";
        String articleUrl = cp+"/challenge/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	articleUrl = cp+"/challenge/article?page=" + current_page + "&"+ query;
        }
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".challenge.list";
	}
	
	@RequestMapping(value = "listAjax")
	@ResponseBody
	public Map<String, Object> listAjax(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="name") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Challenge> list = service.listChallenge(map);
		
		String query = "";
		String articleUrl = cp+"/challenge/article?page=" + current_page;
		if(keyword.length()!=0) {
			query = "condition=" +condition + 
					"&keyword=" + URLEncoder.encode(keyword, "utf-8");	
		}
		
		if(query.length()!=0) {
			articleUrl = cp+"/challenge/article?page=" + current_page + "&"+ query;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("articleUrl", articleUrl);
		model.put("page", current_page);
		
		model.put("condition", condition);
		model.put("keyword", keyword);
		
		return model;
	}
	
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam long num,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query="";
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Challenge dto = service.readChallenge(num);
		if(dto==null) {
			return "redirect:/challenge/list?"+query;
		}
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

        //상세리스트 -> 리스트 뽑아서 넘기는거 여기서 해야되는지 jsp에서 해야되는지..
        List<Challenge> challengeList = service.listChallenge2(num);
        
//        List<String> contentList = new ArrayList<>();
//        for(Challenge s : challengeList) {
//        	int start = Integer.parseInt(s.getStartDate());
//        	int end = Integer.parseInt(s.getEndDate());
//        	int day = end - start + 1; // 총 일수 
//        	
//        	for(int i=1; i<=day; i++) {
//        		contentList.add(s.getContent());
//        	}
//        }
//        
        List<Challenge> list3 = new ArrayList<Challenge>();
        for(Challenge s : challengeList) {
        	int start = Integer.parseInt(s.getStartDate());
        	int end = Integer.parseInt(s.getEndDate());
        	
        	for(int i=start; i<=end; i++) {
        		Challenge dto2 = new Challenge();
        		dto2.setdDate(i);
        		dto2.setExContent(s.getExContent());
        		
        		list3.add(dto2);
//        		System.out.println(i);
//        		System.out.println(s.getExContent());
        		
        	}
        	
//        	for(Challenge d : list3) {
//        		System.out.println("**"+d.getdDate());
//        		System.out.println("**"+d.getExContent());
//        	}
//        	System.out.println("--------------------");
//        	
        }
        
        
		model.addAttribute("dto", dto);
		model.addAttribute("challengeList", challengeList); //파일따로 
		model.addAttribute("query", query);
		model.addAttribute("contentList", list3);
        
		return ".challenge.article";
	}
	
	
	
}
