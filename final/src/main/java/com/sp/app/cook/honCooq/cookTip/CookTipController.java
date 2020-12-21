package com.sp.app.cook.honCooq.cookTip;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

// 요리팁 
@Controller("honCooq.cookTipController")
@RequestMapping("cook/honCooq/cookTip/*")
public class CookTipController {
	@Autowired
	private CookTipService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager filemanager;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 16;	// 한 화면에 보여주는 게시물 수
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
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
		
		List<CookTip> list = service.listCookTip(map);
		
		int listNum, n=0;
		for(CookTip dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/cook/honCooq/cookTip/list";
		String articleUrl = cp+"/cook/honCooq/cookTip/article?page=" + current_page;
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
		
		return ".cook.honCooq.cookTip.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return ".cook.honCooq.cookTip.created";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> createdSubmit(	// ajax 화면 구성시
	public String createdSubmit(
			CookTip dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		//String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertCookTip(dto, "created");
		} catch (Exception e) {
			e.printStackTrace();
			//state="false";
			throw e;
		}
		
//		Map<String, Object> model=new HashMap<>();
//		model.put("state", state);
//		return model;
		return "redirect:/cook/honCooq/cookTip/list";
	}
	
	@RequestMapping("article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model			
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		// 해당 레코드(글 정보) 가져오기
		CookTip dto = service.readCookTip(num);
		if (dto==null) {
			return "redirect:/cook/honCooq/cookTip/list?"+query;
		}
		
		// 스마트 에디터 사용시 주석처리 해야함!
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글 불러오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		CookTip preReadDto = service.preReadCookTip(map);
		CookTip nextReadDto = service.nextReadCookTip(map);
		
		model.addAttribute("dto", dto);		
		model.addAttribute("preReadDto", preReadDto);		
		model.addAttribute("nextReadDto", nextReadDto);		
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".cook.honCooq.cookTip.article";
	}
	
	
}
