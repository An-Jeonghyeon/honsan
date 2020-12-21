package com.sp.app.room;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.member.SessionInfo;

//부동산 게시판
@Controller("room.roomController")
@RequestMapping("/room/*")
public class RoomController {

	@Autowired
	private RoomService service;
	
	@RequestMapping(value="roomlist", method=RequestMethod.GET)
	public String roomForm() {
		
		return ".room.roomlist";
	}

	
	@GetMapping("roomCreated")
	public String roomCread(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".room.roomCreated";
	}
	
	@PostMapping("roomCreated")
	public String roomCreatedSubmit(
			Room dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			service.insertRoom(dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/room/roomlist";
	}
	
	
	
}
