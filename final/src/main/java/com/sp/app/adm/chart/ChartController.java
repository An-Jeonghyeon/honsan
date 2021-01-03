package com.sp.app.adm.chart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.dao.CommonDAO;
import com.sp.app.cook.honCooq.cookTip.CookTipServiceImpl;
import com.sp.app.dress.DressService;
import com.sp.app.interior.InteriorService;
import com.sp.app.room.RoomService;
import com.sp.app.supplement.SupplementService;

@Controller("admChart.admChartController")
@RequestMapping("/adm/chart/*")
public class ChartController {
	
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private InteriorService iService;
	
	@Autowired
	private RoomService rService;
	
	@Autowired
	private SupplementService sService;
	
	@Autowired
	private DressService dService;
	
	@Autowired
	private CookTipServiceImpl cService;
	
	@RequestMapping("chart")
	public String chartlist(
			Model model
			) throws Exception {
		int dressCount = 0;
		int cookCount = 0;
		int roomCount = 0;
		int interiorCount = 0;
		int suppleCount = 0;
		int totalCount = 0;
		
		double dressAve = 0;
		double cookAve = 0;
		double roomAve = 0;
		double interiorAve = 0;
		double suppleAve = 0;
		
		Map<String , Object> map = new HashMap<>();
		
		dressCount += dService.dataCount(map);
		cookCount += cService.dataCount(map);
		roomCount += rService.dataCount(map);
		interiorCount  += iService.dataCount(map);
		suppleCount += sService.dataCount(map);
		
		totalCount += dressCount + cookCount + roomCount + interiorCount +suppleCount;
		
		dressAve = Math.round((dressCount*100.0/totalCount)*10)/10.0;
		cookAve = Math.round((cookCount*100.0/totalCount)*10)/10.0;
		roomAve = Math.round((roomCount*100.0/totalCount)*10)/10.0;
		interiorAve = Math.round((interiorCount*100.0/totalCount)*10)/10.0;
		suppleAve = Math.round((suppleCount*100.0/totalCount)*10)/10.0;
		
		
		 model.addAttribute("dressCount", dressCount);
		 model.addAttribute("cookCount",cookCount );
		 model.addAttribute("roomCount", roomCount);
		 model.addAttribute("interiorCount", interiorCount);
		 model.addAttribute("suppleCount", suppleCount);
		 
		 model.addAttribute("dressAve", dressAve);
		 model.addAttribute("cookAve", cookAve);
		 model.addAttribute("roomAve", roomAve);
		 model.addAttribute("interiorAve", interiorAve);
		 model.addAttribute("suppleAve", suppleAve);
		 
		 
		 
		 return ".adm.newListChart.chart";
	}

}
