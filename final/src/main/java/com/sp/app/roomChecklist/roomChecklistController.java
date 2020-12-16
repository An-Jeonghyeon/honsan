package com.sp.app.roomChecklist;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//부동산 체크리스트
@Controller("room.roomChecklistController")
@RequestMapping("/room/*")
public class roomChecklistController {
	
	//@Autowired
	//private RoomService service;
	
	@RequestMapping(value="roomChecklist", method=RequestMethod.GET)
	public String roomChecklistForm() {
		
		return ".room.roomChecklist";
	}
	
}
