package com.sp.app.itEstimate;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("itEstimate.itEstimateController")
@RequestMapping("/itEstimate/*")
public class itEstimateController {
	
	@RequestMapping(value = "main")
	public String itEstimatemain() throws Exception{
		return ".itEstimate.itEstimateMain";
	}
}
