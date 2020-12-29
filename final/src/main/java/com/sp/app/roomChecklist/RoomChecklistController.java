package com.sp.app.roomChecklist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.member.SessionInfo;

@Controller("room.roomChecklistController")
@RequestMapping("/room/*")
public class RoomChecklistController {
	
	@Autowired
	private RoomChecklistService service;
	
	@RequestMapping(value="roomChecklist")
	public String main(
			HttpServletRequest req,
			HttpSession session,
			Model model
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		int dataCount = service.dataCount(info.getUserId());
		model.addAttribute("dataCount", dataCount);
		
		
		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		List<RoomChecklist> list = service.listChecklist(map);
		
		
		model.addAttribute("mode", "create");
		model.addAttribute("list", list);
		return ".room.roomChecklist";
	}
	
	@GetMapping("roomChecklistNum")
	public String article(
			@RequestParam int num,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		map.put("userId", info.getUserId());
		List<RoomChecklist> list = service.listChecklist(map);
		
		RoomChecklist dto = service.readChecklist(map);
		if (dto==null) {
			return "redirect:/room/roomChecklist";
		}
		
		if (! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/room/roomChecklist";
		}
		int dataCount = service.dataCount(info.getUserId());
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("list", list);
		return ".room.roomChecklist";
	}
	 
	@RequestMapping("roomChecklistCreated")
	public String roomCreatedSubmit(
			RoomChecklist dto,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			
			String item="";
			
			item = dto.getCk()+","+dto.getA1()+","+dto.getB2()+","+dto.getC3()+","+dto.getD4()+","+dto.getE5()+
					","+dto.getF6()+","+dto.getG7()+","+dto.getH8()+","+dto.getI9()+","+dto.getJ10()+","+dto.getK11()+
					","+dto.getL12()+","+dto.getM13()+","+dto.getN14()+","+dto.getO15()+","+dto.getP16()+","+dto.getQ17()+","+dto.getR18();
			
			dto.setItem(item); 
			int dataCount = service.dataCount(info.getUserId());
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("mode", "create");
			service.insertChecklist(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return null;
		return "redirect:/room/roomChecklistNum?num="+dto.getNum();
	}
	
	@RequestMapping("roomChecklistUpdate")
	public String roomUpdateSubmit(
			RoomChecklist dto,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		try {
			
			String item="";
			
			item = dto.getCk()+","+dto.getA1()+","+dto.getB2()+","+dto.getC3()+","+dto.getD4()+","+dto.getE5()+
					","+dto.getF6()+","+dto.getG7()+","+dto.getH8()+","+dto.getI9()+","+dto.getJ10()+","+dto.getK11()+
					","+dto.getL12()+","+dto.getM13()+","+dto.getN14()+","+dto.getO15()+","+dto.getP16()+","+dto.getQ17()+","+dto.getR18();
			
			dto.setItem(item); 
			int dataCount = service.dataCount(info.getUserId());
			model.addAttribute("mode", "update");
			model.addAttribute("dataCount", dataCount);

			service.updateChecklist(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/room/roomChecklistNum?num="+dto.getNum();
	}
	
	
	
	@RequestMapping("roomChecklistDelete")
	public String delete(
			@RequestParam int num,
			HttpSession session
			) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		
		
		service.deleteChecklist(num, info.getUserId());
		
		return "redirect:/room/roomChecklist";
	}
	
	
	
	
	
	
}
