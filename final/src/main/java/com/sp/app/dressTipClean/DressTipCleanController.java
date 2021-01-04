package com.sp.app.dressTipClean;

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
import com.sp.app.member.SessionInfo;

@Controller("dressTipClean.dressTipCleanController")
@RequestMapping("/dressTipClean/*")
public class DressTipCleanController {
	
	@Autowired
	private DressTipCleanService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "created" , method = RequestMethod.GET)
	public String DressTipCleanCreatd(Model model)throws Exception{
		model.addAttribute("mode","created");
		return ".dressTipClean.created";
	}
	@RequestMapping(value = "created" , method = RequestMethod.POST)
	public String DressTipCleanCreatedSubmit(DressTipClean dto, HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDressTipClean(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dressTipClean/list";
	}
	@RequestMapping("list")
	public String DressTipCleanList(@RequestParam(value = "page",defaultValue = "1")int current_page,
								@RequestParam(defaultValue = "all")String condition,
								@RequestParam(defaultValue = "") String keyword,
								HttpServletRequest req,
								Model model
	)throws Exception{
		int rows=9;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword,"utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount= service.dataCount(map);
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		if(total_page<current_page) {
			current_page =total_page;
		}
		int offset= (current_page-1)*rows;
		if(offset<0)offset=0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<DressTipClean> list= service.listDressTipClean(map);
		List<String> images;
		
		int listNum;
		int n=0;
		
		for(DressTipClean dto:list){
			listNum=dataCount-(offset+n);
			dto.setListNum(listNum);
			n++;
			images= myUtil.getImgSrc(dto.getContent());
			if(images.size()>0) {
				dto.setSaveFileName(images.get(0));
			}
		}
		String cp = req.getContextPath();
		String query ="";
		String listUrl =cp+"/dressTipClean/list";
		String articleUrl = cp+"/dressTipClean/article?page="+current_page;
		if(keyword.length()!=0) {
			query= "condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}
		if(query.length()!=0) {
			listUrl +="?"+query;
			articleUrl+="&"+query;
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
		
		return ".dressTipClean.list";
	}
	@RequestMapping(value = "article" , method = RequestMethod.GET)
	public String DressTipCleanArticle(@RequestParam (defaultValue = "1")int num,
							      @RequestParam (defaultValue = "" )String page,
							      @RequestParam (defaultValue = "all")String condition,
							      @RequestParam (defaultValue = "")String keyword,
							      HttpSession session, Model model
	)throws Exception{
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}
		service.updateHitCount(num);
		DressTipClean dto = service.readDressTipClean(num);
		if(dto==null) {
			return "redirect:/dressTipClean/list?"+query;
		}
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("num", num);
		map.put("condition", condition);
		map.put("keyword", keyword);
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("query",query);
		
		return ".dressTipClean.article";
	}
	@RequestMapping(value = "delete")
	public String deleteDressTipClean(@RequestParam int num , 
								  @RequestParam String page,
								  @RequestParam(defaultValue= "all")String condition,
								  @RequestParam(defaultValue= "")String keyword,
								  HttpSession session
									
	)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		keyword = URLDecoder.decode(keyword,"utf-8");
		String query ="page="+page;
		if(keyword.length()!=0) {
			 query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword,"utf-8");
		}
		service.deleteDressTipClean(num ,info.getUserId());
		
		return "redirect:/dressTipClean/list?"+query;
	}
	@RequestMapping(value = "update",method = RequestMethod.GET)
	public String updateDressTipCleanForm(@RequestParam int num,
								 @RequestParam String page,
								 HttpSession session,
								 Model model
	)throws Exception{
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			DressTipClean dto = service.readDressTipClean(num);
			if(dto == null) {
				return "redirect:/dressTipClean/list?page="+page;
			}
			if(! info.getUserId().equals(dto.getUserId())) {
				return "redirect:/dressTipClean/list?page="+page;
			}
			model.addAttribute("dto",dto);
			model.addAttribute("mode","update");
			model.addAttribute("page",page);
		return ".dressTipClean.created";
	}
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateDressTipCleanSubmit(DressTipClean dto,@RequestParam String page, HttpSession session)throws Exception{
		try {
			service.updateDressTipClean(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dressTipClean/list?page="+page;
		
	}
	
}
