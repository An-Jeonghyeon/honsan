package com.sp.app.adm.health;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("adm.health.healthAdminController")
@RequestMapping("/adm/health/*")
public class HealthAdminController {

	
	@RequestMapping("list")
	public String listHealthAdmin() throws Exception {
		
		return ".adm.health.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String create(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".adm.health.created";
	}
} 
