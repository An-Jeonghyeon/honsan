package com.sp.app.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//부동산 게시판
@Controller("room.roomController")
@RequestMapping("/room/*")
public class RoomController {

	//@Autowired
	//private RoomService service;
	
	@RequestMapping(value="roomlist", method=RequestMethod.GET)
	public String roomForm() {
		
		return ".room.roomlist";
	}
	
	@RequestMapping(value="roomCreated", method=RequestMethod.GET)
	public String roomCread() {
		
		return ".room.roomCreated";
	}
	
	
	
	
	
}
