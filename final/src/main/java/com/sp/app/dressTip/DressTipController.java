package com.sp.app.dressTip;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("dressTip.dressTipController")
@RequestMapping("/dressTip/*")
public class DressTipController {
	@RequestMapping("list")
	public String DressTip() throws Exception{
		return (".dressTip.list");
	}
}
