package com.sp.app.room;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

//부동산 게시판
@Controller("room.roomController")
@RequestMapping("/room/*")
public class RoomController {

	@Autowired
	private RoomService service;
	
	@Autowired
	private MyUtil myUtil;
	/*
	@Autowired
	private FileManager fileManager;
	*/
	@RequestMapping(value="roomlist")
	public String roomForm(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		int rows = 12;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		
		System.out.println(dataCount+"개---------------");
		
		if (dataCount!=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * rows;
		if (offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Room> list = service.listRoom(map);
		
		int listNum, n=0;
		for(Room dto : list) {
			listNum = dataCount - (offset+n);
			dto.setNum(listNum);
			n++;
		}
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/room/roomlist";
		String articleUrl = cp+"/room/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		
		
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
