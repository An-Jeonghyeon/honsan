package com.sp.app.dress;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.member.SessionInfo;
@Controller("dress.dressController")
@RequestMapping("/dress/*")
public class DressController {
	
	@Autowired
	private DressService service;
	
	@RequestMapping("list")
	public String DressList() throws Exception{
		return ".dress.list";
	}
	
	
	@GetMapping("created")
	public String DressCreated() throws Exception{
		
		return ".dress.created";
	}
	@PostMapping("created")
	public String DressCreatedSubmit(Dress dto, HttpSession session) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root+"uploads"+File.separator+"bbs";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDress(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/dress/list";
	}
	@RequestMapping("article")
	public String DressArticle() throws Exception{
		return ".dress.article";
	}
}
