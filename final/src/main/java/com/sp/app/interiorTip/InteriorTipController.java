package com.sp.app.interiorTip;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.interior.Reply;
import com.sp.app.member.SessionInfo;

@Controller("interiorTip.interiorTipController")
@RequestMapping("/interiorTip/*")
public class InteriorTipController {

	@Autowired
	private InteriorTipService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		
		  int rows = 10; 
		  int total_page=0; 
		  int dataCount=0;
		  
		  if (req.getMethod().equalsIgnoreCase("GET")) { 
			  keyword =URLDecoder.decode(keyword, "utf-8"); 
		  }
		  
		  Map<String, Object> map = new HashMap<>(); 
		  map.put("condition", condition);
		  map.put("keyword", keyword);
		  
		  dataCount = service.dataCount(map); 
		  if (dataCount!=0) { 
			  total_page =myUtil.pageCount(rows, dataCount); 
		  }
		  
		  if (total_page < current_page) {
			  current_page = total_page; 
		  }
		  
		  int offset = (current_page-1) * rows; 
		  if (offset<0) offset=0;
		  map.put("offset", offset); 
		  map.put("rows", rows);
		  
		  List<InteriorTip> list = service.listBoard(map);
		  
		  
		  String cp = req.getContextPath(); 
		  String query = ""; 
		  String listUrl = cp+"/interiorTip/list"; 
		  String articleUrl = cp+"/interiorTip/article?page=" +current_page; 
		  if (keyword.length() != 0) { 
			  query = "condition="+condition +
					  "&keyword=" + URLEncoder.encode(keyword, "utf-8"); 
		  }
		  
		  if (query.length()!=0) { 
			  listUrl += "?"+query; articleUrl += "&" + query; 
		  }
		  
		  String paging = myUtil.paging(current_page, total_page, listUrl);
		  
		  model.addAttribute("list", list); 
		  model.addAttribute("articleUrl",articleUrl); 
		  model.addAttribute("page", current_page);
		  model.addAttribute("dataCount", dataCount); 
		  model.addAttribute("total_page",total_page); 
		  model.addAttribute("paging", paging);
		  model.addAttribute("condition", condition); 
		  model.addAttribute("keyword",keyword);
		 
		
		return ".interiorTip.interiorTipList";
	}
	
	@GetMapping("created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".interiorTip.interiorTipCreated";
	}
	
	@PostMapping("created")
	public String createdSubmit(
			InteriorTip dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/interiorTip/list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "")String page,
			@RequestParam(defaultValue = "") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(num);
		
		InteriorTip dto = service.readBoard(num);
		if (dto==null) {
			return "redirect:/interiorTip/list?"+query;
		}
		
		
		
		// 스마트에디터를 사용하는 경우 아래 주석처리(스마트에디터는 자체적으로 고쳐서..?)
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		InteriorTip preReadDto = service.preReadBoard(map);
		InteriorTip nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".interiorTip.interiorTipBoard";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		InteriorTip dto = service.readBoard(num);
		
		if (dto==null) {
			return "redirect:/interiorTip/list?page="+page;
		}
		
		if (! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/interiorTip/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".interiorTip.interiorTipCreated";
	}
	
	@PostMapping("update")
	public String updateSubmit(
			InteriorTip dto,
			@RequestParam String page
			) {
	
		try {
			service.updateBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/interiorTip/list?page="+page;
	}
	

	@RequestMapping("delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session
			) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
			
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+
					URLEncoder.encode(keyword, "utf-8");
		}
		
		service.deleteBoard(num, info.getUserId());
		
		return "redirect:/interiorTip/list?"+query;
	}
	
	
	// AJAX - 리플/답글 등록 : JSON 응답
	@RequestMapping(value = "insertReply", method = RequestMethod.POST) // 등록은 get으로 하면 안된다~~
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}


