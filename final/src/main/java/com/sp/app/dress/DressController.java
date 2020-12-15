package com.sp.app.dress;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("dress.dressController")
@RequestMapping("/dress/*")
public class DressController {
	@RequestMapping("list")
	public String DressList() throws Exception{
		return ".dress.list";
	}
	@GetMapping("created")
	public String DressCreated() throws Exception{
		
		return ".dress.created";
	}
	@PostMapping("created")
	public String DressCreatedSubmit() throws Exception{
		
		return "redirect:/dress/list";
	}
	@RequestMapping("article")
	public String DressArticle() throws Exception{
		return ".dress.article";
	}
}
