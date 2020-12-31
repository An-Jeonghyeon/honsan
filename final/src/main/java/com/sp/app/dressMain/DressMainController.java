package com.sp.app.dressMain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.APISerializer;
@Controller("dressMain.dressMainController")
@RequestMapping("/dressMain/*")
public class DressMainController {
	
	@Autowired
	private APISerializer apiSerializer;

	
	@Autowired
	private DressMainService service;
	
	
	@RequestMapping("main")
	public String Main() throws Exception{
		
		return (".dressMain.main");
	}
	
	// AJAX -XML로 응답 
	@RequestMapping(value = "weatherApi", method=RequestMethod.GET, produces ="application/json; charset=utf-8")
	@ResponseBody
	public String weather (@RequestParam String base_date,
						@RequestParam String base_time,
						@RequestParam String nx,
						@RequestParam String ny )throws Exception{
		String result= null;
		
		//동네 예보 확인
		String spec="http://apis.data.go.kr/1360000/VilageFcstInfoService/getVilageFcst";
		
		//키값
		String serviceKey="upM4eIzJDLRKUoXAemVRGZPAc0169zQ7YEmY6DxW1KCqi30hsnEDxjPjWT629RyETfT8haxrKzVb7KfAThHXEw%3D%3D";
		
		//한페이지 결과 수 
		int numOfRows =20;
		//페이지 번호
		int pageNo=1;
		//데이터 타입 -XML/JSON , 기본 :XML
		String  dataType="JSON";
		
		spec+="?serviceKey="+serviceKey+"&numOfRows="+numOfRows+"&pageNo="+pageNo;
		spec+="&base_date="+base_date+"&base_time="+base_time;
		spec+="&nx="+nx+"&ny="+ny;
		spec+="&dataType="+dataType;
		
		result=apiSerializer.receiveToString(spec);
		
		return result;
	}
	@RequestMapping(value = "weatherRequest", method= RequestMethod.POST)
	public String submitAreaName(@RequestParam String city ,Model model)throws Exception{
		System.out.println(city);
	
		List<DressMain>list=service.selectXYcode(city);
		
//			for(int i=0; i<list.size(); i++) {
//				System.out.println(list.get(i));
//			}
		
		model.addAttribute("list",list);			
		return ".dressMain.main";
	}
	

}