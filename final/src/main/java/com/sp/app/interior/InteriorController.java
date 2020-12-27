package com.sp.app.interior;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;
import com.sp.app.notice.Notice;

@Controller("interior.interiorController")
@RequestMapping("/interior/*")
public class InteriorController {
	
	@Autowired
	private InteriorService service;
	
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping("main")
	public String InteriorList(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception{

		int rows = 16;
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		
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
		
		List<Interior> list = service.listBoard(map);
			
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/interior/list";
		String articleUrl = cp+"/interior/boardItem?page=" + current_page;
		if (keyword.length() != 0) {
			query =  "&keyword=" 
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
		
		
		return ".interior.InteriorMain";
	}
	
	@RequestMapping(value="created" , method = RequestMethod.GET)
	public String InteriorForm(
			Model model
			) throws Exception{
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return ".interior.interior_created";
	}
	
	@RequestMapping(value="created" , method = RequestMethod.POST)
	public String Interiorsubmit(
			Interior dto,
			HttpSession session,
			Model model ,
			@RequestParam(value="category" ,defaultValue = "" , required = true) List<String> categorys)

			 throws Exception{
		
		
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
	    String pathname=root+"uploads"+File.separator+"interior";
		
		try {
			String tags = "" ;
			for(String category : categorys) {
				
				tags += category.trim() + ",";
			}
			
			dto.setUserId(info.getUserId());
			dto.setCategory(tags);
			service.insertInterior(dto , pathname);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		model.addAttribute("pathname","pathname");
		 
		 
		return "redirect:/interior/main";
		
	}
	
	@RequestMapping(value = "boardItem" , method = RequestMethod.GET)
	public String boardItem(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "1")String page,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(num);

		Interior dto = service.readBoard(num);
		List<Interior> flist = service.readBoardImg(num);
		if (dto==null && flist==null) {
			return "redirect:/interior/main?"+query;
		}
		
		List<Interior> ublist = service.userlistBoard(dto.getUserId());
		int ublistCount = ublist.size();
		
			
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
			
		map.put("keyword", keyword);
		
		model.addAttribute("ublist", ublist);
		model.addAttribute("ublistCount", ublistCount);		
		model.addAttribute("dto", dto);
		model.addAttribute("flist",flist);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		String category = dto.getCategory();
		
		if(category!=null) {
			String categorylist[] = dto.getCategory().trim().split(",");			
			model.addAttribute("categorylist", categorylist);
		}
			

		return ".interior.boardItem";
	}
	
	@RequestMapping(value="update" , method = RequestMethod.GET)
	public String updateForm(
			Interior dto,
			int num,
			Model model
			) throws Exception{
		
		dto = service.readBoard(num);
		List<Interior> flist = service.readBoardImg(num);
		
		if (dto==null && flist==null) {
			return "redirect:/interior/main";
		}
		int flistCount = flist.size(); //파일 길이 수정시 사진이 전부없으면 추가 박스를 만들기위한 변수값
		
		model.addAttribute("dto", dto);
		model.addAttribute("flist",flist);
		model.addAttribute("flistCount",flistCount);
		model.addAttribute("mode", "update");
		
		
		String category = dto.getCategory();
		
		if(category!=null) {
			String categorylist[] = dto.getCategory().trim().split(",");			
			model.addAttribute("categorylist", categorylist);
		}
	
		
			
		return ".interior.interior_update";
	}
	
	@RequestMapping(value = "update" , method = RequestMethod.POST)
	public String updateSubmit(
			Interior dto,
			HttpSession session,
			@RequestParam(value="category" ,defaultValue = "" , required = true) List<String> categorys
			)	throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
	    String pathname=root+"uploads"+File.separator+"interior";
		
		try {
			String tags = "" ;
			for(String category : categorys) {
				
				tags += category.trim() + ",";
			} 
			
			
			dto.setCategory(tags);
			service.updateInterior(dto, pathname);
			
		}catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		
		return "redirect:/interior/main";
	}
	
	@RequestMapping(value="deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int filenum,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "interior";
		
		Interior dto=service.readFile(filenum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "filenum");
		map.put("num", filenum);
		service.deleteFile(map);
		
		return map;
	}
	
	@RequestMapping(value="deleteMainFile", method=RequestMethod.POST)
	@ResponseBody
	public void deleteMainFile(
			@RequestParam int num,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "interior";
		
		Interior dto=service.readBoard(num);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getMainImg(), pathname);
		}
		
	}
}
