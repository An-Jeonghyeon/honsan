package com.sp.app.adm.chart;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
		
		
		Calendar cal = Calendar.getInstance();
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		int week = cal.get(Calendar.DAY_OF_WEEK);
		String woday = "";
		String pre1wday = "";
		String pre2wday = "";
		String pre3wday = "";
		String pre4wday = "";
		String pre5wday = "";
		String pre6wday = "";
		
		switch(week) {
		case 1:
			woday = "일";
			pre1wday = "토";
			pre2wday = "금";
			pre3wday = "목";
			pre4wday = "수";
			pre5wday = "화";
			pre6wday = "월";
			break;
		case 2:
			woday = "월";
			pre1wday = "일";
			pre2wday = "토";
			pre3wday = "금";
			pre4wday = "목";
			pre5wday = "수";
			pre6wday = "화";
			
		case 3:
			woday = "화";
			pre1wday = "월";
			pre2wday = "일";
			pre3wday = "토";
			pre4wday = "금";
			pre5wday = "목";
			pre6wday = "수";
			break;
		case 4:
			woday = "수";
			pre1wday = "화";
			pre2wday = "월";
			pre3wday = "일";
			pre4wday = "토";
			pre5wday = "금";
			pre6wday = "목";
			break;
		case 5:
			woday = "목";
			pre1wday = "수";
			pre2wday = "화";
			pre3wday = "월";
			pre4wday = "일";
			pre5wday = "토";
			pre6wday = "금";
			break;
		case 6:
			woday = "금";
			pre1wday = "목";
			pre2wday = "수";
			pre3wday = "화";
			pre4wday = "월";
			pre5wday = "일";
			pre6wday = "토";
			break;
		case 7:
			woday = "토";
			pre1wday = "금";
			pre2wday = "목";
			pre3wday = "수";
			pre4wday = "화";
			pre5wday = "월";
			pre6wday = "일";
			break;
		}
		
		
		String today = df.format(cal.getTime());
		map.put("keyword", today);
		int roomdayCount = rService.dataCount(map);
		int interiordayCount  = iService.dataCount(map);	
		map.put("condistion" ,"created");
		int dressdayCount = dService.dataCount(map);
		int cookdayCount = cService.dataCount(map);
		map.put("condistion" ,"register_date");
		int suppledayCount = sService.dataCount(map);
		
		model.addAttribute("dressdayCount", dressdayCount);
		model.addAttribute("cookdayCount",cookdayCount );
		model.addAttribute("roomdayCount", roomdayCount);
		model.addAttribute("interdayiorCount", interiordayCount);
		model.addAttribute("suppledayCount", suppledayCount);		
		
	
		cal.add(Calendar.DATE, -1);
		String pre1day = df.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		String pre2day = df.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		String pre3day = df.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		String pre4day = df.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		String pre5day = df.format(cal.getTime());
		cal.add(Calendar.DATE, -1);
		String pre6day = df.format(cal.getTime());
		
		
		
		
		/*
		 * String today1 = df.format(cal.getTime()); Map<String , Object> map1 = new
		 * HashMap<>(); map1.put("keyword", today1); int roomdayCount1 =
		 * rService.dataCount(map1); int interiordayCount1 = iService.dataCount(map1);
		 * map.put("condistion" ,"created"); int dressdayCount1 =
		 * dService.dataCount(map1); int cookdayCount1 = cService.dataCount(map1);
		 * map.put("condistion" ,"register_date"); int suppledayCount1 =
		 * sService.dataCount(map1);
		 */
		
		/*
		 * model.addAttribute("dressdayCount1", dressdayCount1);
		 * model.addAttribute("cookdayCount1",cookdayCount1 );
		 * model.addAttribute("roomdayCount1", roomdayCount1);
		 * model.addAttribute("interdayiorCount1", interiordayCount1);
		 * model.addAttribute("suppledayCount1", suppledayCount1);
		 * 
		 * 
		 * cal.add(Calendar.DATE, -1); String pre2day = df.format(cal.getTime()); String
		 * today2 = df.format(cal.getTime());
		 * 
		 * Map<String , Object> map2 = new HashMap<>(); map1.put("keyword", today2); int
		 * roomdayCount2 = rService.dataCount(map2); int interiordayCount2 =
		 * iService.dataCount(map2); map.put("condistion" ,"created"); int
		 * dressdayCount2 = dService.dataCount(map2); int cookdayCount2 =
		 * cService.dataCount(map2); map.put("condistion" ,"register_date"); int
		 * suppledayCount2 = sService.dataCount(map2);
		 * 
		 * model.addAttribute("dressdayCount2", dressdayCount2);
		 * model.addAttribute("cookdayCount2",cookdayCount2);
		 * model.addAttribute("roomdayCount2", roomdayCount2);
		 * model.addAttribute("interdayiorCount2", interiordayCount2);
		 * model.addAttribute("suppledayCount2", suppledayCount2);
		 * 
		 * cal.add(Calendar.DATE, -1); String pre3day = df.format(cal.getTime()); String
		 * today3 = df.format(cal.getTime());
		 * 
		 * Map<String , Object> map3 = new HashMap<>(); map1.put("keyword", today3); int
		 * roomdayCount3 = rService.dataCount(map3); int interiordayCount3 =
		 * iService.dataCount(map3); map.put("condistion" ,"created"); int
		 * dressdayCount3 = dService.dataCount(map3); int cookdayCount3 =
		 * cService.dataCount(map3); map.put("condistion" ,"register_date"); int
		 * suppledayCount3 = sService.dataCount(map3);
		 * 
		 * model.addAttribute("dressdayCount3", dressdayCount3);
		 * model.addAttribute("cookdayCount3",cookdayCount3);
		 * model.addAttribute("roomdayCount3", roomdayCount3);
		 * model.addAttribute("interdayiorCount3", interiordayCount3);
		 * model.addAttribute("suppledayCount3", suppledayCount3);
		 * 
		 * cal.add(Calendar.DATE, -1); String pre4day = df.format(cal.getTime()); String
		 * today4 = df.format(cal.getTime());
		 * 
		 * Map<String , Object> map4 = new HashMap<>(); map1.put("keyword", today4); int
		 * roomdayCount4 = rService.dataCount(map4); int interiordayCount4 =
		 * iService.dataCount(map4); map.put("condistion" ,"created"); int
		 * dressdayCount4 = dService.dataCount(map4); int cookdayCount4 =
		 * cService.dataCount(map4); map.put("condistion" ,"register_date"); int
		 * suppledayCount4 = sService.dataCount(map4);
		 * 
		 * model.addAttribute("dressdayCount4", dressdayCount4);
		 * model.addAttribute("cookdayCount4",cookdayCount4);
		 * model.addAttribute("roomdayCount4", roomdayCount4);
		 * model.addAttribute("interdayiorCount4", interiordayCount4);
		 * model.addAttribute("suppledayCount4", suppledayCount4);
		 * 
		 * cal.add(Calendar.DATE, -1); String pre5day = df.format(cal.getTime()); String
		 * today5 = df.format(cal.getTime());
		 * 
		 * Map<String , Object> map5 = new HashMap<>(); map1.put("keyword", today5); int
		 * roomdayCount5 = rService.dataCount(map5); int interiordayCount5 =
		 * iService.dataCount(map5); map.put("condistion" ,"created"); int
		 * dressdayCount5 = dService.dataCount(map5); int cookdayCount5 =
		 * cService.dataCount(map5); map.put("condistion" ,"register_date"); int
		 * suppledayCount5 = sService.dataCount(map5);
		 * 
		 * model.addAttribute("dressdayCount5", dressdayCount5);
		 * model.addAttribute("cookdayCount5",cookdayCount5);
		 * model.addAttribute("roomdayCount5", roomdayCount5);
		 * model.addAttribute("interdayiorCount5", interiordayCount5);
		 * model.addAttribute("suppledayCount5", suppledayCount5);
		 * 
		 * cal.add(Calendar.DATE, -1); String pre6day = df.format(cal.getTime()); String
		 * today6 = df.format(cal.getTime());
		 * 
		 * Map<String , Object> map6 = new HashMap<>(); map1.put("keyword", today6); int
		 * roomdayCount6 = rService.dataCount(map6); int interiordayCount6 =
		 * iService.dataCount(map6); map.put("condistion" ,"created"); int
		 * dressdayCount6 = dService.dataCount(map6); int cookdayCount6 =
		 * cService.dataCount(map6); map.put("condistion" ,"register_date"); int
		 * suppledayCount6 = sService.dataCount(map6);
		 * 
		 * model.addAttribute("dressdayCount6", dressdayCount6);
		 * model.addAttribute("cookdayCount6",cookdayCount6);
		 * model.addAttribute("roomdayCount6", roomdayCount6);
		 * model.addAttribute("interdayiorCount6", interiordayCount6);
		 * model.addAttribute("suppledayCount6", suppledayCount6);
		 */
		
		
		
		 model.addAttribute("woday", woday);
		 model.addAttribute("pre1wday", pre1wday);
		 model.addAttribute("pre2wday", pre2wday);
		 model.addAttribute("pre3wday", pre3wday);
		 model.addAttribute("pre4wday", pre4wday);
		 model.addAttribute("pre5wday", pre5wday);
		 model.addAttribute("pre6wday", pre6wday);	
		
		 model.addAttribute("today", today);
		 model.addAttribute("pre1day", pre1day);
		 model.addAttribute("pre2day", pre2day);
		 model.addAttribute("pre3day", pre3day);
		 model.addAttribute("pre4day", pre4day);
		 model.addAttribute("pre5day", pre5day);
		 model.addAttribute("pre6day", pre6day);
		
		
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
