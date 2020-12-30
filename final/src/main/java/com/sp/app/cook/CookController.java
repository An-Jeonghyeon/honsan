package com.sp.app.cook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cook.cookController")
@RequestMapping("/cook/*")
public class CookController {
	
	@RequestMapping("/cook/honCooq/{menuItem}")
	public String main(@PathVariable String menuItem,
			Model model			
			) throws Exception {
		
		model.addAttribute("menuItem", menuItem);
		return ".cook.honCooq.honCooqMain";	
	}
	
	// 메인으로 가기..?
	@RequestMapping("main")
	public String honCooq(
			Model model
			) throws Exception {
		
		return ".cook.honCooq.honCooqMain";
	}
}
