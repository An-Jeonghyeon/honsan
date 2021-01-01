package com.sp.app.room;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping(value="securityTestSubmit")
	public String securityTestSubmit(
			SecurityTest dto,
			Model model
			) throws Exception{
		try {
			int cate1 = dto.getA1()+dto.getB1()+dto.getC1()+dto.getD1()+dto.getE1();
			int cate2 = dto.getF1()+dto.getG1()+dto.getH1()+dto.getI1()+dto.getJ1();
			int cate3 = dto.getK1()+dto.getL1()+dto.getM1()+dto.getN1()+dto.getO1();
			
			int total=cate1+cate2+cate3;
			
			model.addAttribute("cate1", cate1);
			model.addAttribute("cate2", cate2);
			model.addAttribute("cate3", cate3);
			model.addAttribute("total", total);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ".room.securityTestSubmit";
		
	}
	
	
	@RequestMapping(value="securityService")
	public String securityService() {
		
		return ".room.securityService";
	}
	
	
}
