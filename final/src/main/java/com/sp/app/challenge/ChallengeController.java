package com.sp.app.challenge;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("challenge.challengeController")
@RequestMapping("/challenge/*")
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="name") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();

		int rows = 6;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("keyword", keyword);
        
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page = total_page;
		}
		
	    int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        
		List<Challenge> list = service.listChallenge(map);

        String query = "";
        String articleUrl = cp+"/challenge/article?page=" + current_page;
        if(keyword.length()!=0) {
        	query = "condition=" +condition + 
        	           "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
        if(query.length()!=0) {
        	articleUrl = cp+"/challenge/article?page=" + current_page + "&"+ query;
        }
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		return ".challenge.list";
	}
	
	@RequestMapping(value = "listAjax")
	@ResponseBody
	public Map<String, Object> listAjax(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="name") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req
			) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 6;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Challenge> list = service.listChallenge(map);
		
		String query = "";
		String articleUrl = cp+"/challenge/article?page=" + current_page;
		if(keyword.length()!=0) {
			query = "condition=" +condition + 
					"&keyword=" + URLEncoder.encode(keyword, "utf-8");	
		}
		
		if(query.length()!=0) {
			articleUrl = cp+"/challenge/article?page=" + current_page + "&"+ query;
		}
		
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("list", list);
		model.put("dataCount", dataCount);
		model.put("total_page", total_page);
		model.put("articleUrl", articleUrl);
		model.put("page", current_page);
		
		model.put("condition", condition);
		model.put("keyword", keyword);
		
		return model;
	}
	
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam long num,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			Model model
			) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query="";
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		Challenge dto = service.readChallenge(num);
		if(dto==null) {
			return "redirect:/challenge/list?"+query;
		}
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

        //상세리스트 -> 리스트 뽑아서 넘기는거 여기서 해야되는지 jsp에서 해야되는지..
        List<Challenge> challengeList = service.listChallenge2(num);
        
//        List<String> contentList = new ArrayList<>();
//        for(Challenge s : challengeList) {
//        	int start = Integer.parseInt(s.getStartDate());
//        	int end = Integer.parseInt(s.getEndDate());
//        	int day = end - start + 1; // 총 일수 
//        	
//        	for(int i=1; i<=day; i++) {
//        		contentList.add(s.getContent());
//        	}
//        }
//        
        List<Challenge> list3 = new ArrayList<Challenge>();
        for(Challenge s : challengeList) {
        	int start = Integer.parseInt(s.getStartDate());
        	int end = Integer.parseInt(s.getEndDate());
        	
        	for(int i=start; i<=end; i++) {
        		Challenge dto2 = new Challenge();
        		dto2.setdDate(i);
        		dto2.setExContent(s.getExContent());
        		
        		list3.add(dto2);
//        		System.out.println(i);
//        		System.out.println(s.getExContent());
        		
        	}
        	
//        	for(Challenge d : list3) {
//        		System.out.println("**"+d.getdDate());
//        		System.out.println("**"+d.getExContent());
//        	}
//        	System.out.println("--------------------");
//        	
        }
        
        
		model.addAttribute("dto", dto);
		model.addAttribute("challengeList", challengeList); //파일따로 
		model.addAttribute("query", query);
		model.addAttribute("contentList", list3);
		model.addAttribute("mode", "article");

		return ".challenge.article";
	}
	
	//도전하기 버튼 누르면 여기서 인서트만 하고...articleGo로 리다이렉트
	@RequestMapping(value = "userInsert", method = RequestMethod.GET)
	public String userInsert(
			Challenge dto,
			@RequestParam long num,
			HttpSession session,
			Model model 
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		Challenge dto1 = service.readChallenge(num);
		if(dto1==null) {
			return "redirect:/challenge/list";
		}
		
		try {
			dto.setUserId(info.getUserId());
			service.insertUserChallenge(dto);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("mode", "articleNo"); //인서트 실패시(이유 : 이미 도전하기 누른거)
			model.addAttribute("num", num); //인서트 실패시(이유 : 이미 도전하기 누른거)
			return "redirect:/challenge/myChallenge?userId="+userId; //여기서 그냥 바로 리스트로보내기..
		}
		
		return "redirect:/challenge/articleGo?num="+dto.getNum();
	}
	
	//도전 폼  -> 위에서 인서트하고 여기로 리다이렉트되어  article로 넘어가기
	@RequestMapping(value = "articleGo", method = RequestMethod.GET)
	public String articleGo (
			@RequestParam long num,
			HttpSession session,
			Model model
			) throws Exception {
		
		//article에 뿌릴 챌린지 내용들 가져오기
		Challenge dto = service.readChallenge(num);
		if(dto==null) {
			return "redirect:/challenge/list?";
		}
		
		String endDate=dto.getChallengePeriod();
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

        List<Challenge> challengeList = service.listChallenge2(num);

        List<Challenge> list3 = new ArrayList<Challenge>();
        for(Challenge s : challengeList) {
        	int start = Integer.parseInt(s.getStartDate());
        	int end = Integer.parseInt(s.getEndDate());
        	
        	for(int i=start; i<=end; i++) {
        		Challenge dto2 = new Challenge();
        		dto2.setdDate(i);
        		dto2.setExContent(s.getExContent());
        		
        		list3.add(dto2);
        	}
        }
        //--내용 뿌리는건 이상x
        
		//각 개인의 챌린지화면에 완료된 부분에 체크하고, completion 누적하기위한 userChallenge 1개
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", info.getUserId());
		map.put("num", num);
		Challenge dto2 = service.readUserChallengeOne(map);
		int enabled = dto2.getEnabled();
		int totalCount = dto2.getTotalCount();
		
		System.out.println("가져와지니..?"+ dto2.getCompletion()); //넴
		String ch=dto2.getCompletion();
		System.out.println(ch);
		
		List<String> comList = new ArrayList<String>();
		//만약 아직 앙무것도 완료 안한상태가 아니라면
		String[] com =  dto2.getCompletion().split(",");
		for(String s : com) {
			comList.add(s);   //완료한 일차 담은거
		}
		model.addAttribute("comList", comList);// 완료한 일자 
        

        
		model.addAttribute("dto", dto); //챌린지 내용(challenge1)
		model.addAttribute("challengeList", challengeList); //challenge2 따로 
		model.addAttribute("contentList", list3); //day에 쓸거(뭉쳐서 받은거 하루씩으로 푼거)
		model.addAttribute("mode", "articleGo"); //article인거 알려주기
		model.addAttribute("dto2", dto2); //이건 개별꺼
		model.addAttribute("completion1", ch); //이건 개별꺼
		model.addAttribute("endDate", endDate); //며칠짜리인지
		model.addAttribute("enabled", enabled); //진행상황
		model.addAttribute("totalCount", totalCount); //나의 카운트
		
		return ".challenge.article";
	}
	
	//완료버튼시	
	@RequestMapping(value = "challengeOk", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> challengeOk(
			Challenge dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state = "true";
		
		dto.setUserId(info.getUserId());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", dto.getNum());
		map.put("userId", dto.getUserId());
		
		//하나 완료하면 총카운터 +1씩
		try {
			service.updateTotalCount(map);
		} catch (Exception e) {
			e.printStackTrace(); //이거 나중에 지우기
			state = "false";
		}

		//기존꺼...+
		String completion = dto.getCompletion();
		System.out.println("*************9999 "+ completion);
		
		map.put("completion", completion); 
		
		try {
			service.updateCompletion(map); //이거 일수+업데이트 
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		} 
		//여기서 completion을 나눠서 보내줘야함 
		List<String> comList = new ArrayList<String>();
		String[] com =  completion.split(",");
		for(String s : com) {
			comList.add(s);   //완료한 일차 담은거
		}
		
		Challenge dto2 = service.readUserChallengeOne(map);
		String completion3 = dto2.getCompletion();
		//이건 보낼거..
		Map<String, Object> model = new HashMap<String, Object>();

		model.put("completion3", completion3); //완룓된숫자들
		model.put("state", state);
		model.put("comList", dto2); //진행중인거 한개

		return model;
	}
	
	//마이페이지 챌린지
	@RequestMapping(value = "myChallenge")
	public String myChallenge(
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpSession session,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp=req.getContextPath();

		int rows = 10;
		int total_page = 0;
		int dataCount= 0;
		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		
		dataCount = service.myListDataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page) {
			current_page=total_page;
		}
		
		int offset = (current_page-1)*rows;
		if(offset < 0) {
			offset=0;
		}
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Challenge> list = service.listMyChallenge(map);
		
		int listNum=0;
		int n=0;
		for(Challenge dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		String list_url = cp+"/challenge/myChallenge?page="+current_page;
		
		String paging = myUtil.paging(current_page, total_page, list_url);
		
		model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("paging", paging);
        model.addAttribute("total_page", total_page);

		return ".mypage.myChallenge";
	}
	
	//진행중인 챌린지 삭제
	@RequestMapping(value = "deleteMyChallenge", method = RequestMethod.GET)
	public String deleteMyChallenge(
			@RequestParam long num,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("num", num);
		
		service.deleteMyChallenge(map);
		

		return "redirect:/challenge/myChallenge";
	}

	@RequestMapping(value = "updateEnabled", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateEnabled(
			Challenge dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String state="true";

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("num", dto.getNum());
		try {
			service.updateEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
		
	}
		
	
}
