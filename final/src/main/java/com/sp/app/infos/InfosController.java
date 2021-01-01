package com.sp.app.infos;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.notice.Notice;
import com.sp.app.notice.NoticeService;

@Controller("infos.infosCountroller")
@RequestMapping("/infos/*")
public class InfosController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value = "infos")
	public String main(Model model) {
		
		//공지사항 리스트
        List<Notice> noticeList = noticeService.mainListNotice();
        model.addAttribute("noticeList", noticeList);
		
		return ".infos.infos";
	}
	
	

	
}
