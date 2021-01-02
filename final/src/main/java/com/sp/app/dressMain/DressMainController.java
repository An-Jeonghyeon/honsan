package com.sp.app.dressMain;

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
	
	
	@RequestMapping(value = "weatherRequest", method=RequestMethod.GET, produces ="application/json; charset=utf-8")
	@ResponseBody
	public String submitAreaName(@RequestParam String town,
								@RequestParam String base_date,
								@RequestParam String base_time,
									Model model)throws Exception{
		
		
		DressMain dto = service.selectXYcode(town);
		
		String result= null;
		
		if(dto==null) {
			result = "{\"state\":\"false\"}";
			return result;
		}
		
		
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
		spec+="&nx="+dto.getXcode()+"&ny="+dto.getYcode();
		spec+="&dataType="+dataType;
		
		
		result=apiSerializer.receiveToString(spec);
		
		return result;

		
	}
	

}