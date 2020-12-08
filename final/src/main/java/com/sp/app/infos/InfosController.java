package com.sp.app.infos;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("infos.infosCountroller")
@RequestMapping("/infos/*")
public class InfosController {

	
	@RequestMapping(value = "infos")
	public String main() {
		return ".infos.infos";
	}
}
