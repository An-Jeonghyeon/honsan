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
	
	@RequestMapping("memberInfo")
	public String memberInfo() {
		return ".adm.memberInfo";
	}
	
	@RequestMapping("blacklist")
	public String blacklist() {
		return ".adm.blacklist";
	}
	
	@RequestMapping("reportlist")
	public String reportlist() {
		return ".adm.reportlist";
	}
	
	@RequestMapping("form")
	public String form() {
		return ".adm.form";
	}
	
	@RequestMapping("table")
	public String table() {
		return ".adm.table";
	}
	
	@RequestMapping("empty")
	public String empty() {
		return ".adm.empty";
	}
	
	
}
