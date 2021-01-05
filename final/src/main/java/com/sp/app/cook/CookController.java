package com.sp.app.cook;

import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("cook.cookController")
public class CookController {
	
	@RequestMapping("/cook/honCooq/{menuItem}")
	public String main(@PathVariable String menuItem,
			@RequestParam(defaultValue = "1") String m, 
			@RequestParam(defaultValue = "1") String page, 
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model			
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
//		
//		if(keyword.length()!=0) {
//			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
//		}
		
		model.addAttribute("menuItem", menuItem);
		model.addAttribute("m", m);
		model.addAttribute("page", page);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		return ".cook.honCooq.honCooqMain";	
	}
	
}
