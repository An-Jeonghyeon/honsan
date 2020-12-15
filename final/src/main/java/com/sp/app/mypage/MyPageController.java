package com.sp.app.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@RequestMapping(value = "/main")
	public String mypage() {
		return ".mypage.mypage";
	}
}
