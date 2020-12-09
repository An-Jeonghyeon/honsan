package com.sp.app.interior;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("interior.interiorController")
@RequestMapping("/interior/*")
public class InteriorController {
	
	@RequestMapping("main")
	public String InteriorMain() throws Exception{
		
		return ".interior.InteriorMain";
	}
}
