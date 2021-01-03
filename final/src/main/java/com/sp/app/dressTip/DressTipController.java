package com.sp.app.dressTip;

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

@Controller("dressTip.dressTipController")
@RequestMapping("/dressTip/*")
public class DressTipController {
	
	@Autowired
	private DressTipService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "created" , method = RequestMethod.GET)
	public String DressTipCreatd(Model model)throws Exception{
		model.addAttribute("mode","created");
		return ".dressTip.created";
	}
	@RequestMapping(value = "created" , method = RequestMethod.POST)
	public String DressTipCreatedSubmit(DressTip dto, HttpSession session)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDressTip(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dressTip/list";
	}
	@RequestMapping("list")
	public String DressTipList(@RequestParam(value = "page",defaultValue = "1")int current_page,
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
		
		List<DressTip> list= service.listDressTip(map);
		List<String> images;
		
		int listNum;
		int n=0;
		
		for(DressTip dto:list){
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
		String listUrl =cp+"/dressTip/list";
		String articleUrl = cp+"/dressTip/article?page="+current_page;
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
		
		return ".dressTip.list";
	}
		
	
}
