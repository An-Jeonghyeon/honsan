package com.sp.app.dressMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller("dressMain.dressMainController")
@RequestMapping("/dressMain/*")
public class DressMainController {
	@RequestMapping("main")
	public String Main() throws Exception{
		return (".dressMain.main");
	}
}
