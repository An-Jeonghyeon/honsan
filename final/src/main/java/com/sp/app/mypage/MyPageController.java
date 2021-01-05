package com.sp.app.mypage;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.FileManager;
import com.sp.app.interior.Interior;
import com.sp.app.member.SessionInfo;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	private MypageService service;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value = "/main")
	public String mypage(
			Mypage rto,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		rto.setUserId(info.getUserId());
		Mypage dto = service.readProfile(rto);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "created");
		return ".mypage.mypage";
	}
	
	@RequestMapping(value = "updateForm" , method = RequestMethod.POST)
	public String profileUpdateForm(
			Mypage dto,
			Model model
			) throws Exception {
		
		Mypage mto = null;
		
		mto = service.readProfile(dto);
		
		
		model.addAttribute("dto", mto);
		model.addAttribute("mode", "update");
		
		return ".mypage.mypage";
	}
	
	@RequestMapping(value="profileUpdate" , method = RequestMethod.POST)
	public String profileUpdateSubmit(
			Mypage dto,
			Model model,
			HttpSession session
			) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
	    String pathname=root+"uploads"+File.separator+"profile";
		
		
		service.updateProfile(dto , pathname);
		
		
		dto = service.readProfile(dto);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "created");
		return ".mypage.mypage";
	}
	
	@RequestMapping(value="deleteMainFile", method=RequestMethod.POST)
	@ResponseBody
	public void deleteMainFile(
			Mypage dto,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "interior";
		
		Mypage rto = service.readProfile(dto);
		if(rto!=null) {
			fileManager.doFileDelete(dto.getProfileImg(), pathname);
		}
		
	}
}
