package com.sp.app.adm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adm.admController")
@RequestMapping("/adm/*")
public class admController {

	
	@RequestMapping("adm")
	public String main() {
		return ".adm.chart";
	}
	
	@RequestMapping("chart")
	public String chart() {
		return ".adm.chart";
	}
	
	@RequestMapping("visitorStatus")
	public String blacklist() {
		return ".adm.visitorStatus";
	}
	
	@RequestMapping("memberManagement")
	public String memberInfo() {
		return ".adm.memberManagement";
	}
	
	@RequestMapping("boardManagement")
	public String reportlist() {
		return ".adm.boardManagement";
	}
	
	@RequestMapping("health")
	public String table() {
		return ".adm.health";
	}
	
	@RequestMapping("cook")
	public String form() {
		return ".adm.cook";
	}
	
//	@RequestMapping("empty")
//	public String empty() {
//		return ".adm.empty";
//	}
	
	
}
