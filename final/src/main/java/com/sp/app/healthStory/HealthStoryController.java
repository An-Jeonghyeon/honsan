package com.sp.app.healthStory;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("healthStory.healthStoryController")
@RequestMapping("/healthStory/*")
public class HealthStoryController {
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		
		return ".healthStory.list";
	}
	
	//글쓰기 폼
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".supplement.created";
	}
	
}
