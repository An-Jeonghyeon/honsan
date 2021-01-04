package com.sp.app.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("faq.faqController")
@RequestMapping("/faq/*")
public class FqaController {
	@RequestMapping(value = "main")
	public String FaqMain()throws Exception{
		return ".faq.main";
	}	
	
	@RequestMapping(value = "created", method= RequestMethod.GET)
	public String FaqCreatedFrom()throws Exception{
		return ".faq.created";
	}
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String FaqCreatedSubmit()throws Exception{
		return "redirect:/faq/list";
	}
}
