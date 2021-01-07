package com.sp.app.interiorTip;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.interior.Interior;
import com.sp.app.interior.InteriorService;
import com.sp.app.interior.Reply;
import com.sp.app.member.SessionInfo;


@Controller("interiorTip.interiorTipController")
@RequestMapping("/interiorTip/*")
public class InteriorTipController {

	@Autowired
	private InteriorTipService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private InteriorService iService;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String categorys,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		
		  int rows = 10; 
		  int total_page=0; 
		  int dataCount=0;
		  
		  if (req.getMethod().equalsIgnoreCase("GET")) { 
			  keyword =URLDecoder.decode(keyword, "utf-8"); 
			  categorys =URLDecoder.decode(categorys, "utf-8");   
		  }
		  
		  
		  Map<String, Object> map = new HashMap<>(); 
		  map.put("condition", condition);
		  map.put("keyword", keyword);
		  map.put("categorys", categorys);
		  
		  dataCount = service.dataCount(map); 
		  if (dataCount!=0) { 
			  total_page =myUtil.pageCount(rows, dataCount); 
		  }
		  
		  if (total_page < current_page) {
			  current_page = total_page; 
		  }
		  
		  int offset = (current_page-1) * rows; 
		  if (offset<0) offset=0;
		  map.put("offset", offset); 
		  map.put("rows", rows);
		  
		  List<InteriorTip> list = service.listBoard(map);
		  
		  
		  String cp = req.getContextPath(); 
		  String query = ""; 
		  String listUrl = cp+"/interiorTip/list"; 
		  String articleUrl = cp+"/interiorTip/article?page=" +current_page; 
		  if (keyword.length() != 0) { 
			  query = "condition="+condition +
					  "&keyword=" + URLEncoder.encode(keyword, "utf-8"); 
		  }
		  
		  if (query.length()!=0) { 
			  listUrl += "?"+query; articleUrl += "&" + query; 
		  }
		  
		  String paging = myUtil.paging3(current_page, total_page, listUrl);
		  model.addAttribute("categorys", categorys); 
		  model.addAttribute("list", list); 
		  model.addAttribute("articleUrl",articleUrl); 
		  model.addAttribute("page", current_page);
		  model.addAttribute("dataCount", dataCount); 
		  model.addAttribute("total_page",total_page); 
		  model.addAttribute("paging", paging);
		  model.addAttribute("condition", condition); 
		  model.addAttribute("keyword",keyword);
		 
		
		return ".interiorTip.interiorTipList";
	}
	
	@GetMapping("created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".interiorTip.interiorTipCreated";
	}
	
	@PostMapping("created")
	public String createdSubmit(
			InteriorTip dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/interiorTip/list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam (defaultValue = "1")int num,
			@RequestParam (defaultValue = "")String page,
			@RequestParam(defaultValue = "") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String categorys,
			HttpSession session,
			Model model
			) throws Exception {
		
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		categorys = URLDecoder.decode(categorys, "utf-8");
		
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="
					+URLEncoder.encode(keyword, "utf-8");
		}
		
		service.updateHitCount(num);
		
		InteriorTip dto = service.readBoard(num);
		if (dto==null) {
			return "redirect:/interiorTip/list?"+query;
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> loginmap = new HashMap<>();
		
		loginmap.put("userId", info.getUserId());
		Interior logindto = iService.readprofile(loginmap);
		
		// 스마트에디터를 사용하는 경우 아래 주석처리(스마트에디터는 자체적으로 고쳐서..?)
		// dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		//  좋아요
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		int readinteriorTipLike=0;
		int interiorTipLikecount =0;
		try {
			readinteriorTipLike = service.readInteriorTipLike(paramMap);	
			interiorTipLikecount = service.interiorTipLikeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("userLike", readinteriorTipLike);
		model.addAttribute("interiorTipLikeCount", interiorTipLikecount);
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("categorys", categorys);
		
		
		InteriorTip preReadDto = service.preReadBoard(map);
		InteriorTip nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("logindto",logindto);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".interiorTip.interiorTipBoard";
	}
	
	@GetMapping("update")
	public String updateForm(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model
			) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		InteriorTip dto = service.readBoard(num);
		
		if (dto==null) {
			return "redirect:/interiorTip/list?page="+page;
		}
		
		if (! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/interiorTip/list?page="+page;
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".interiorTip.interiorTipCreated";
	}
	
	@PostMapping("update")
	public String updateSubmit(
			InteriorTip dto,
			@RequestParam String page
			) {
	
		try {
			service.updateBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/interiorTip/list?page="+page;
	}
	

	@RequestMapping("delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session
			) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
			
		keyword = URLDecoder.decode(keyword, "utf-8");
		String query = "page="+page;
		if (keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+
					URLEncoder.encode(keyword, "utf-8");
		}
		
		service.deleteBoard(num, info.getUserId());
		
		return "redirect:/interiorTip/list?"+query;
	}
	
	
	// AJAX - 리플/답글 등록 : JSON 응답
	@RequestMapping(value = "insertReply", method = RequestMethod.POST) // 등록은 get으로 하면 안된다~~
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	
	// 댓글 리스트 
	@RequestMapping(value="listReply")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) throws Exception {
		
		int rows=4;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		
		dataCount = service.replyCount(map);

		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
        int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);
		List<Reply> listReply=service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod3(current_page, total_page, "listPage");
		
		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "interiorTip/listReply";
	}	
	
	
	@RequestMapping(value="insertInteriorTipLike", method=RequestMethod.POST) //포스트방식으로 왔을때 
	@ResponseBody //에이작스 제이슨 등 쓸때는 리스폰스 바디필수 자동연결 
	public Map<String, Object> insertInteriorLike(
			@RequestParam int num,  
			HttpSession session
			) {
		String state="true";   // 처음은 무조건 좋아요가 진행된 상태가아니니 true 넘기게 디폴트 ture 로 작성한다.
		int interiorTipLikeCount=0; 
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("num", num); // 게시물의 번호 
		paramMap.put("userId", info.getUserId()); //현재 로그인된 아이디 
		
		try {
			service.insertInteriorTipLike(paramMap);// 맵에 셋팅한 넘버와 아이디 테이블에 추가 	
		} catch (Exception e) {
			e.printStackTrace();  // 실패시 false 출력 
			state="false";
		}
			
		interiorTipLikeCount = service.interiorTipLikeCount(num); // 추가된 테이블의 총 카운트 입력 
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);   // jsp 에서 잘 작동하였는지 확인하기 위한 메세지
		model.put("interiorLikeCount", interiorTipLikeCount); // 좋아요 총 수를 담은 변수 
		
		return model;
	}
	
	
	// 게시글 좋아요 삭제(delete) : AJAX-JSON
	@RequestMapping(value="deleteInteriorTipLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteInteriorTipLike(
			@RequestParam int num,
			HttpSession session
			) {
		String state="true";
		int interiorTipLikeCount=0; //좋아요의 총 수를 담을 변수 
		SessionInfo info=(SessionInfo)session.getAttribute("member"); //로그인된 회원정보
		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("num", num); //게시판의 시퀸스 번호 
		paramMap.put("userId", info.getUserId()); // 접속중인 아이디 
		
		try {
			service.deleteInteriorTipLike(paramMap);	// map 설정한 정보 테이블에서 삭제 
		} catch (Exception e) {
			e.printStackTrace();
			state="false";   // 삭제 실패 시 메시지 전송을 위한 변수 
		}
			
		interiorTipLikeCount = service.interiorTipLikeCount(num);
		 
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);  // 상태의 성공 실패 여부 
		model.put("interiorTipLikeCount", interiorTipLikeCount); // 실행 후 좋아요의 수 를 담은 변수
		
		return model;
	}
}


