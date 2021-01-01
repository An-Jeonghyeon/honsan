package com.sp.app.adm.health;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sp.app.member.SessionInfo;

@Controller("adm.health.healthAdminController")
@RequestMapping("/adm/health/*")
public class HealthAdminController {

	@Autowired
	HealthAdminService service;
	
	@RequestMapping("list")
	public String listHealthAdmin() throws Exception {
		
		return ".adm.health.list";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".adm.health.created";
	}
	
	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			HealthAdmin dto,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname= root+"uploads"+File.separator+"challenge";
		
		try {
			service.insertChallenge(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		return "redirect:/adm/health/list";
	}
	
	//이거 수정전 created
/*	@RequestMapping(value = "created", method = RequestMethod.POST)
	public String createdSubmit(
			HealthAdmin dto,
			HttpSession session,
			Model model
			) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path= root+"uploads"+File.separator+"challenge";
		
		try {
			service.insertChallenge(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		model.addAttribute("dto", dto);
		
		return ".adm.health.createdMore";
	}
*/
	
/*
 	public Map<String, Object> insertMore(
			HealthAdmin dto
			) throws Exception {
		
		String state = "true";
		int exNum=1; //이거 추가 리스트 할때 고쳐야됨.. data-exNum 가져와서 없을경우1, 있으면 ++??
		
		try {
			dto.setNum(exNum);
			service.insertChallengeMore(dto);
		} catch (Exception e) {
			e.printStackTrace();
			state ="false";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("state", state);
		
		return map; 
	}	
*/

	
} 
