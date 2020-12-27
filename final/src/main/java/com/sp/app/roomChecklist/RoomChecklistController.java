package com.sp.app.roomChecklist;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("room.roomChecklistController")
@RequestMapping("/room/*")
public class RoomChecklistController {
	
	@RequestMapping(value="roomChecklist")
	public String main(
			HttpServletRequest req,
			Model model
			) {
		
		model.addAttribute("string", "ck1,ch2,ch3,a1,b3");
		
		return ".room.roomChecklist";
	}
	
	
}
