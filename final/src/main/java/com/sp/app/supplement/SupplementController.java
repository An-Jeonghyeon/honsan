package com.sp.app.supplement;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.member.SessionInfo;

@Controller("supplement.supplementController")
@RequestMapping("/supplement/*")
public class SupplementController {
	
	@Autowired
	private SupplementService service;
	
	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".supplement.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".supplement.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST) //이거 vaalue 왜 이거인거?
	public String createdSubmit(Supplement dto, HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			
			System.out.println(dto.getHashtag());
			System.out.println(dto.getUserId());
			System.out.println(dto.getHashtag());
			System.out.println(dto.getHashtag());
			
			service.insertSupplement(dto, "created");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/supplement/list";
	}
}
