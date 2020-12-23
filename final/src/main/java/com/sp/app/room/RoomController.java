package com.sp.app.room;

import java.io.File;
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
		/*
		int listNum, n=0;
		for(Room dto : list) {
			listNum = dataCount - (offset+n);
			dto.setNum(listNum);
			n++;
		}*/
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/room/roomlist";
		String articleUrl = cp+"/room/roomArticle?page=" + current_page;
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
		model.addAttribute("mode", "roomCreated");
		return ".room.roomCreated";
	}
	
	@PostMapping("roomCreated")
	public String roomCreatedSubmit(
			@RequestParam(value = "aditem_none", defaultValue = "1") String aditem_none,
			@RequestParam(value = "options_none", defaultValue = "1") String options_none,
			Room dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			if(aditem_none != "1") {
				dto.setAditem(aditem_none);
			}
			if(options_none != "1") {
				dto.setOptions(options_none);
			}
			dto.setUserId(info.getUserId());
			
			service.insertRoom(dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/room/roomlist";
	}
	
	
	@GetMapping("roomArticle")
	public String article(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "")String page,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		Room dto = service.readRoom(num);
		if (dto==null) {
			return "redirect:/room/roomlist?"+query;
		}
		
		String[] options=dto.getOptions().split(",");
		String[] aditems=dto.getAditem().split(",");
		
		// 스마트에디터를 사용하는 경우 아래 주석처리(스마트에디터는 자체적으로 고쳐서..?)
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("keyword", keyword);
		
		model.addAttribute("options",options);
		model.addAttribute("aditems",aditems);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".room.roomArticle";
	}
	
	@GetMapping("roomUpdate")
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Room dto = service.readRoom(num);
		
		
		if (dto==null) {
			return "redirect:/room/roomlist?page="+page;
		}
		
		if (! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/room/roomlist?page="+page;
		}

		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "roomUpdate");
		model.addAttribute("page", page);
		
		return ".room.roomCreated";
	}
	
	@PostMapping("roomUpdate")
	public String updateSubmit(
			@RequestParam(value = "aditem_none", defaultValue = "1") String aditem_none,
			@RequestParam(value = "options_none", defaultValue = "1") String options_none,
			Room dto,
			@RequestParam String page,
			HttpSession session
			) {
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"room";
		
		try {
			if(!aditem_none.equals("1")) {
				dto.setAditem(aditem_none);
			}
			if(!options_none.equals("1")) {
				dto.setOptions(options_none);
			}
			
			service.updateRoom(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/room/roomlist?page="+page;
	}
	
	@RequestMapping("deleteFile")
	public String deleteFile(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session
			) {
		// 수정에서 파일 삭제
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"room";
		
		Room dto = service.readRoom(num);
		if (dto==null) {
			return "redirect:/room/roomlist?page="+page;
		}
		
		if (! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/room/roomlist?page="+page;
		}
		
		try {/*
			if (dto.getSaveFilename()!=null) {
				fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				dto.setSaveFilename("");
				dto.setOriginalFilename("");*/
				service.updateRoom(dto, pathname); // 삭제한 파일정보 수정
			/*}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/room/roomUpdate?num="+num+"&page="+page;
	}
	
	@RequestMapping("delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session
			) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"room";
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&keyword="+
					URLEncoder.encode(keyword, "utf-8");
		}
		
		service.deleteRoom(num, pathname, info.getUserId());
		
		return "redirect:/room/roomlist?"+query;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
