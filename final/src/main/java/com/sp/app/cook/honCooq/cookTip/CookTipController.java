package com.sp.app.cook.honCooq.cookTip;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

// 요리팁 
@Controller("honCooq.cookTipController")
@RequestMapping("cook/honCooq/cookTip/*")
public class CookTipController {
	@Autowired
	private CookTipService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list() throws Exception {
		return ".cook.honCooq.cookTip.list";
	}
	
	
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return ".cook.honCooq.cookTip.created";
	}
	
	@RequestMapping(value="created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			CookTip dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertCookTip(dto, "created");
		} catch (Exception e) {
			e.printStackTrace();
			state="false";
			throw e;
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
