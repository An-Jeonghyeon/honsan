package com.sp.app.adm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("adm.admController")
@RequestMapping("/adm/*")
public class admController {
		
	//처음 관리자 화면은 게시판 새글현황으로
	@RequestMapping("adm")
	public String main() {
		return ".adm.newListChart.chart";
	}
	
	//이 컨트롤러에서 일단 메뉴 누르면 첫화면 가게만 해둠..나머지 다른 페이지는각자 컨트롤러에서 
	@RequestMapping("visitorStatus")
	public String blacklist() {
		return ".adm.visitor.visitorStatus";
	}
	
	@RequestMapping("memberMng")
	public String memberInfo() {
		return ".adm.memberMng.memberList";
	}
	
	@RequestMapping("boardMng")
	public String reportlist() {
		return ".adm.boardMng.boardList";
	}
	
	@RequestMapping("cook")
	public String form() {
		return ".adm.cook.list";
	}

}
