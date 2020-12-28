package com.sp.app.challenge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.dao.CommonDAO;

@Controller("challenge.challengeController")
@RequestMapping("/challenge/*")
public class ChallengeController {
	
	@Autowired
	private CommonDAO dao;

	@RequestMapping(value = "list")
	public String list() throws Exception {
		
		return ".challenge.list";
	}
	
}
