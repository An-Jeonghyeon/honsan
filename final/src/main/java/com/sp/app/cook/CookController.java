package com.sp.app.cook;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("cook.cookController")
public class CookController {
	
	@RequestMapping("/cook/honCooq/{menuItem}")
	public String main(@PathVariable String menuItem,
			Model model			
			) throws Exception {
		
		model.addAttribute("menuItem", menuItem);
		return ".cook.honCooq.honCooqMain";	
	}
}
