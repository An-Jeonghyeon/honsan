package com.sp.app.mypage;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mypage.myPageController")
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	private MypageService service;
	
	@RequestMapping(value = "/main")
	public String mypage(
			Mypage dto,
			Model model
			) {
		
		
		
		model.addAttribute("dto", dto);
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
		
		return ".mypage.myprofile";
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
		
		model.addAttribute("dto", dto);
		return ".mypage.mypage";
	}
}
