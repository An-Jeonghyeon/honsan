package com.sp.app.supplement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("supplement.supplementController")
@RequestMapping("/supplement/*")
public class SupplementController {
	
	@RequestMapping("list")
	public String list() throws Exception {
		
		return ".supplement.list";
	}
}
