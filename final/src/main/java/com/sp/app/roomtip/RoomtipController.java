package com.sp.app.roomtip;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("roomtip.roomtipController")
@RequestMapping("/room/*")
public class RoomtipController {

	@Autowired
	private RoomtipService service;

	@Autowired
	private MyUtil myUtil;

	
	@RequestMapping(value="roomtip")
	public String main(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "enabled");
		List<RoomtipReply> listCategory=service.listCategory(map);

		model.addAttribute("listCategory", listCategory);
		model.addAttribute("categoryNum", "1");
		model.addAttribute("pageNo", current_page);

		return ".room.roomtip";
	}

	

	// AJAX-Text(HTML)
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="1") int categoryNum,
			HttpServletRequest req,
			Model model
			)
			throws Exception {
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
   	    
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("categoryNum", categoryNum);

        dataCount = service.dataCount(map);
        if(dataCount != 0) {
            total_page = myUtil.pageCount(rows,  dataCount) ;
        }
        
        if(total_page < current_page) { 
            current_page = total_page;
        }

        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

        List<RoomtipReply> list = service.listRoomtip(map);
        /*
        int listNum, n = 0;
        for(RoomtipReply dto : list) {
        	listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
            
        	dto.setContent(myUtil.htmlSymbols(dto.getContent()));
        }
        */
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		
		model.addAttribute("categoryNum", categoryNum);
		
		return "room/roomtipReply";
	}

	// AJAX-처리 결과 JSON으로 변환하여 응답
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	@ResponseBody // JSON으로 변환해서 넘기는 어노테이션
	public Map<String, Object> insertSubmit(RoomtipReply dto, 
			@RequestParam(defaultValue="1") int categoryNum,
			HttpSession session
			) throws Exception {
		String state = "true";
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.insertRoomtip(dto);
		} catch (Exception e) {
			state = "false"; // JSON으로 변환해서 넘겨야 한다.
		}
		//int categoryNum = dto.getCategoryNum();

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("categoryNum", categoryNum);
		return model;
	}

	// AJAX-처리결과가 JSON으로 변환하여 응답
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(@RequestParam int num, 
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="1") int categoryNum, 
			HttpSession session)
			throws Exception {

		String state = "true";

		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Map<String, Object> map = new HashMap<>();
			map.put("userId", info.getUserId());
			map.put("num", num);

			service.deleteRoomtip(map);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		model.put("pageNo", current_page);
		model.put("categoryNum", categoryNum);
		return model;
	}

	@RequestMapping("listReply")
	public String listReply(@RequestParam int num, @RequestParam(value = "pageNo", defaultValue = "1") int current_page, @RequestParam(defaultValue="1") int categoryNum,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("categoryNum", categoryNum);

        dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		List<RoomtipReply> listReply = service.listRoomtip(map);

		for (RoomtipReply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		// 자바스크립트를 호출하는 페이징 처리
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "room/roomtipReply";
	}

}
