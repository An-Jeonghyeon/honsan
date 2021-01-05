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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sp.app.common.FileManager;
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
	@Autowired
	private FileManager fileManager;
	
	
	@RequestMapping(value="roomlist")
	public ModelAndView roomlist(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String roomtype,
			HttpServletRequest req,
			Model model
			) throws Exception{
		int rows = 12;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
			roomtype = URLDecoder.decode(roomtype, "utf-8");
		}

		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("roomtype", roomtype);
		
		dataCount = service.dataCount(map);
		
		
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

		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/room/roomlist";
		String articleUrl = cp+"/room/roomArticle?page=" + current_page;
		if (keyword.length() != 0) {
			query = "keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}
		if((keyword.length() != 0) && (roomtype.length()!=0) ) {
			query+="&roomtype="+ URLEncoder.encode(roomtype, "utf-8");
		}else if (roomtype.length()!=0) {
			query="roomtype="+ URLEncoder.encode(roomtype, "utf-8");
		}

		if (query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		model.addAttribute("roomtype", roomtype);
		
		return new ModelAndView(".room.roomlist");
	}
	
	@RequestMapping(value="roomlist1")
	@ResponseBody
	public Map<String, Object> roomForm(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,			
			@RequestParam(value="keyword", defaultValue = "") String keyword,
			@RequestParam(value="roomtype", defaultValue = "") String roomtype,
			HttpServletRequest req
			) throws Exception {
		int rows = 12;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
			roomtype = URLDecoder.decode(roomtype, "utf-8");
		}
		
		if(!roomtype.equals("")) {
			roomtype= roomtype.replaceAll("쓰리룸 ", "쓰리룸+");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("roomtype", roomtype);
		
		dataCount = service.dataCount(map);
		
		
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

		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/room/roomlist";
		String articleUrl = cp+"/room/roomArticle?page=" + current_page;
		if (keyword.length() != 0) {
			query = "keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}
		if((keyword.length() != 0) && (roomtype.length()!=0) ) {
			query+="&roomtype="+ URLEncoder.encode(roomtype, "utf-8");
		}else if (roomtype.length()!=0) {
			query="roomtype="+ URLEncoder.encode(roomtype, "utf-8");
		}

		if (query.length()!=0) {
			listUrl += "?"+query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		Map<String, Object> model=new HashMap<>();
		
		model.put("list", list);
		model.put("articleUrl", articleUrl);
		model.put("pageNo", current_page);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("paging", paging);
		model.put("keyword", keyword);
		model.put("roomtype", roomtype);
		
		
		return model;
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
			if(aditem_none.equals("없음")) {
				
				dto.setAditem(aditem_none);
				
			}
			if(options_none.equals("없음")) {
				
				dto.setOptions(options_none);
				
			}
			
			dto.setUserId(info.getUserId());
			
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "room";		
			
			service.insertRoom(dto, pathname);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//return null;
		return "redirect:/room/roomArticle?num="+dto.getNum();
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
		
		List<Room> listFile=service.listFile(num);
		

		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("keyword", keyword);
		
		
		model.addAttribute("options",options);
		model.addAttribute("aditems",aditems);
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("listFile", listFile);
		
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

		List<Room> listFile=service.listFile(num);
		
		int listCount=listFile.size();
		model.addAttribute("listCount",listCount);
		
		model.addAttribute("listFile", listFile);
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
		
		try {
			if(!aditem_none.equals("1")) {
				dto.setAditem(aditem_none);
			}
			if(!options_none.equals("1")) {
				dto.setOptions(options_none);
			}
			String root = session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"room";
			
			service.updateRoom(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return null;
		return "redirect:/room/roomlist?page="+page;
	}
	
	@RequestMapping(value="roomDelete")
	public String roomDelete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/room/roomlist?"+query;
		}
		
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "room";
			service.deleteRoom(num, pathname, info.getUserId());
		} catch (Exception e) {
		}
		
		return "redirect:/room/roomlist?"+query;
	}
	
	
	@RequestMapping(value="deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "room";
		
		Room dto=service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFile(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "fileNum");
		map.put("num", fileNum);
		service.deleteFile(map);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", "true");
		return model;
	}
	
	
	
	//댓글 등록(대댓글도)
	@RequestMapping(value = "insertReply", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) { //등록 안되면
			state="false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		return map; 
	}
	
	//댓글 리스트 - text
	@RequestMapping(value = "listReplys")
	public String listReplys(
				@RequestParam int num,
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				Model model
			) throws Exception {
		
		int rows=5;
		int total_page = 0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		dataCount = service.ReplyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page=total_page;
		}
		
		int offset = (current_page-1) *rows;
		if(offset< 0) {
			offset=0;
		}
		map.put("offset", offset);
		map.put("rows", rows);
		List<Reply> listReply = service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page );
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "room/listReplys";
	}
	// 댓글 삭제(대댓글도) -json
	@RequestMapping(value="deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		
		String state="true";
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	//대댓글 리스트  - text (출력)
	@RequestMapping(value = "listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam int answer,
			Model model
			) throws Exception {
		
		List<Reply> listReplyAnswer = service.listReplyAnswer(answer);
		
		for(Reply dto : listReplyAnswer) {
			dto.setContent(dto.getContent().replaceAll("/n", "<br>"));
		}
		model.addAttribute("listReplyAnswer", listReplyAnswer);
		
		return "room/listReplyAnswer";
	}
	
	//대댓글의 갯수
	@RequestMapping(value = "replyAnswerCount")
	@ResponseBody
	public Map<String , Object> replyAnswerCount(
			@RequestParam(value = "answer") int answer
			) {
		
		int count = service.ReplyAnswerCount(answer);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("count", count);
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
