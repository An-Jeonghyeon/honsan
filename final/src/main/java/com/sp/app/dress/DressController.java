package com.sp.app.dress;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Arrays;
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
		if(offset<0)
			offset=0;
		map.put("offset", offset);
		map.put("rows",rows);
		List<Dress> bestList=service.bestlist(map);
		List<Dress> list = service.listDress(map); 
		List<String> images;
		int listNum;
		int n=0;
		for(Dress dto:list) {
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
			if(dto.getHashtag()!=null) {
				String []ss = dto.getHashtag().split(",");
				dto.setTags(Arrays.asList(ss));
			}
			images = myUtil.getImgSrc(dto.getContent());
			if(images.size()>0) {
				dto.setSaveFilename(images.get(0));	
			}
			
		}
		for(Dress dto: bestList) {
			images = myUtil.getImgSrc(dto.getContent());
			if(images.size()>0) {
				dto.setSaveFilename(images.get(0));	
			}
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
		model.addAttribute("bestList", bestList);
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
	public String DressCreated(Model model) throws Exception{
		model.addAttribute("mode","created");
		return ".dress.created";
	}
	@PostMapping("created")
	public String DressCreatedSubmit(Dress dto, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDress(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dress/list";
	}
	@GetMapping("article")
	public String DressArticle(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "")String page,
			@RequestParam (defaultValue = "all")String condition,
			@RequestParam (defaultValue = "")String keyword,
			Model model
			) throws Exception{
		keyword = URLDecoder.decode(keyword,"utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(num);
		Dress dto=service.readDress(num);
		if(dto==null) {
			return"redirect:/dress/list?"+query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num",num);
		map.put("condition",condition);
		map.put("keyword",keyword);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".dress.article";
	}
	@RequestMapping("delete")
	public String deleteDress(@RequestParam int num,
							  @RequestParam String page,
							  @RequestParam(defaultValue = "all")String condition,
							  @RequestParam(defaultValue = "")String keyword,
							  HttpSession session
								) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		keyword= URLDecoder.decode(keyword,"utf-8");
		String query= "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}
		service.deleteDress(num, info.getUserId());
		
		return "redirect:/dress/list?"+query;
	}
	@RequestMapping(value = "update",method =RequestMethod.GET)
	public String updateForm(@RequestParam int num,
			 				 @RequestParam String page,
			 				 HttpSession session,
			 				 Model model ) throws Exception{
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		Dress dto = service.readDress(num);
		if(dto==null) {
			return"redirect:/dress/list?page="+page;
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/dress/list?page="+page;
		}
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page",page);
		
		return ".dress.created";
	}
	@RequestMapping(value = "update" , method =RequestMethod.POST)
	public String updateSubmit(Dress dto, @RequestParam String page,HttpSession session) throws Exception{
			try {
				service.updateDress(dto);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return "redirect:/dress/list?page="+page;
	}
	@PostMapping("insertDressReply")
	@ResponseBody
	public Map<String, Object> insertDressReply(DressReply dto, HttpSession session){
		SessionInfo info= (SessionInfo)session.getAttribute("member");
		String state="ture";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDressReply(dto);
		} catch (Exception e) {
			state="false";
		}
		Map<String, Object>model= new HashMap<String, Object>();
		model.put("state", state);
		return model;
		
	}
	@RequestMapping(value = "listReply")
	public String listReply(@RequestParam int num,
							@RequestParam(value="pageNo",defaultValue = "1")int current_page,
							Model model) throws Exception{
		int rows= 5;
		int total_page=0;
		int dataCount= 0;
		
		Map<String, Object>map =new HashMap<String, Object>();
		map.put("num", num);
		
		dataCount= service.DressReplyCount(map);
		total_page= myUtil.pageCount(rows, dataCount);
		if(current_page> total_page) {
			current_page= total_page;
		}
		int offset =(current_page-1)*rows;
		if(offset<0)offset =0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		
		List<DressReply> listReply= service.listReply(map);

		for(DressReply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		}
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply",listReply);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("replyCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);

		return"dress/listReply";
	}
	@RequestMapping(value = "deleteDressReply" , method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteDressReply(@RequestParam Map<String, Object> paramMap ){
		String state="true";
		try {
			service.deleteDressReply(paramMap);
			
		} catch (Exception e) {
			state="false";
			e.printStackTrace();
		}
		Map<String, Object> map= new HashMap<>();
		map.put("state", state);
		return map; 
	}
	@RequestMapping(value = "insertDressLikeCount",method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertDressLikeCount(
								@RequestParam int num,
								HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state ="true";
		int DressLikeCount=0;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num",num);
		paramMap.put("userId", info.getUserId());
		try {
			service.insertDressLikeCount(paramMap);
		} catch (Exception e) {
			service.deleteDressLikeCount(paramMap);
			state="false";
		}
		DressLikeCount = service.DressLikeCount(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state",state);
		model.put("DressLikeCount", DressLikeCount);
		return model;
	}

}
