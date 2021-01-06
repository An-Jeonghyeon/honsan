package com.sp.app.dressMain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
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
	@RequestMapping(value = "areaWeather", method=RequestMethod.GET, produces = "application/xml; charset=utf-8")
	@ResponseBody
	public String areaweather()throws Exception{
		String result= null;
		
		//현재 지역 날씨 확인
		String spec="http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
		result=apiSerializer.receiveToString(spec);

		
	
	
		System.out.println(result);
		return result;
	}
	@RequestMapping("areaWeatherChart")
	@ResponseBody
	public Map<String, Object> areaWeatherChart() throws Exception{
		String result= null;
		
		//현재 지역 날씨 확인
		String spec="http://www.kma.go.kr/XML/weather/sfc_web_map.xml";
		result=apiSerializer.receiveToString(spec);

		
		JSONObject job = XML.toJSONObject(result);
		//System.out.println(job.toString());
		JSONArray jar=job.getJSONObject("current").getJSONObject("weather").getJSONArray("local");
		
		double[] dd=new double[11];
		
		for(int i =0; i<jar.length(); i++) {
			JSONObject ob = jar.getJSONObject(i);
			
			String s= ob.getString("content");
			double t = ob.getDouble("ta");
			
			
			try {
				if(s.equals("서울")) dd[0] = t;
				else if (s.equals("인천")) dd[1] = t;
				else if (s.equals("춘천")) dd[2] = t;
				else if (s.equals("강릉")) dd[3] = t;
				else if (s.equals("청주")) dd[4] = t;
				else if (s.equals("대전")) dd[5] = t;
				else if (s.equals("전주")) dd[6] = t;
				else if (s.equals("광주")) dd[7] = t;
				else if (s.equals("대구")) dd[8] = t;
				else if (s.equals("부산")) dd[9] = t;
				else if (s.equals("제주")) dd[10] = t;
			} catch (Exception e) {
			
			}
	
			
		}
		Map<String, Object> model = new HashMap<String, Object>();
		
		
		List<Map<String, Object>> list  = new ArrayList<Map<String,Object>>();
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("data", dd);
		map.put("name", "현재기온");
		list.add(map);
		
	
		model.put("categories", new String[] {"서울","인천", "춘천", "강릉", "청주", "대전", "전주", "광주", "대구", "부산", "제주"});
		model.put("series", list);
		return model;
	}
	
	

}
