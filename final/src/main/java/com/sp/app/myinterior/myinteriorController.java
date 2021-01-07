package com.sp.app.myinterior;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.interior.Interior;
import com.sp.app.interior.InteriorService;
import com.sp.app.member.SessionInfo;


@Controller("myinterior.myinteriorController")
@RequestMapping("/myinterior/*")
public class myinteriorController {
	
	@Autowired
	private InteriorService service;
	
	
	@RequestMapping(value="mListAll" ,method = RequestMethod.GET)
	public String memberListAll(
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("rows" , 0);
		
		List<Interior> list = service.userlistBoard(map);
					
		model.addAttribute("list", list);
		
		
		return ".mypage.myInterior";
	}
}
