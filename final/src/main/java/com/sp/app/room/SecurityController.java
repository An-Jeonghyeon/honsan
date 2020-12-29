package com.sp.app.room;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("room.securityController")
@RequestMapping("/room/*")
public class SecurityController {
	
	@RequestMapping(value="security", method=RequestMethod.GET)
	public String main() {
		
		return ".room.security";
	}
	
	@RequestMapping(value="securityTest")
	public String securtiyTest() {
		
		return ".room.securityTest";
	}

}
