package com.sp.app.supplement;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;

@Controller("supplement.supplementController")
@RequestMapping("/supplement/*")
public class SupplementController {
	
	@Autowired
	private SupplementService service;
	
	@Autowired
	private MyUtil myUtil;
	
	//리스트
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		String cp=req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount= 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword=URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		//데이터 갯수
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(total_page<current_page) {
			current_page=total_page;
		}
		
		//리스트
		int offset = (current_page-1)*rows;
		if(offset < 0) {
			offset=0;
		}
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Supplement> list;
		list = service.listSupplement(map); 	
		
		//글번호
		int listNum=0;
		int n=0;
		for(Supplement dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		
		//베스트 리스트
		List<Supplement> bestList;
		bestList = service.bestListSupplement(map);
		
		//베스트 글번호
		int bestNum=0;
		for(Supplement dto : bestList) {
			bestNum +=1;
			dto.setBestNum(bestNum);
		}

		
		//쿼리
		String query = "";
		String list_url = cp+"/supplement/list";
		String article_url = cp+"/supplement/article?page="+current_page;
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		if(keyword.length()!=0) {
			list_url= cp+"/supplement/list?"+query;
			article_url = cp+"/supplement/article?page="+current_page+ "&"+query;
		}
		
		//페이징
		String paging = myUtil.paging(current_page, total_page, list_url);
		

		
        model.addAttribute("list", list);
        model.addAttribute("bestList", bestList);
        model.addAttribute("article_url", article_url);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);
        
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".supplement.list";
	}
	
	//글쓰기 폼
	@RequestMapping(value = "created", method = RequestMethod.GET)
	public String created(Model model) throws Exception {
		
		model.addAttribute("mode", "created");
		return ".supplement.created";
	}
	
	//글쓰기
	@RequestMapping(value = "created", method = RequestMethod.POST) //value는 주소값 -ㅣ> 위에 supplement/created
	public String createdSubmit(Supplement dto, HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"supplement";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertSupplement(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/supplement/list";
	}
	
	//게시글 추천 추가( ajax-json)
	@RequestMapping(value = "insertSupplementLike", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSupplementLike(
			@RequestParam int num, HttpSession sesstion) throws Exception {
		
		SessionInfo info=(SessionInfo)sesstion.getAttribute("member");
		String state="true";
		int supplementLikeCount=0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("userId", info.getUserId());
		
		try {
			service.insertSupplementLike(map);
		} catch (Exception e) {
			service.deleteSupplementLike(map);
			state="false";
		}
		
		supplementLikeCount=service.supplementLikeCount(num);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("supplementLikeCount", supplementLikeCount);
		
		return model;
	}
	
	//글보기
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			Model model
			) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
		
		//쿼리
		String query = "page="+page;
		if(keyword.length()!=0) {
			query +="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		//읽어오기
		Supplement dto = service.readSupplement(num);
		if(dto==null) {
			return "redirect:/supplement/list?"+query;
		}
		
		//조회수
		service.updateHitCount(num);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);
		
		//이전글, 다음글
		Supplement preReadDto = service.preReadSupplement(map);
		Supplement nextReadDto = service.nextReadSupplement(map);
		
		//보내기
		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return ".supplement.article";
	}
	
	//수정폼
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Supplement dto = service.readSupplement(num);
		if(dto==null) {
			return "redirect:/supplement/list?page="+page;
		}
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/supplement/list?page="+page;
		}
		
		model.addAttribute("mode","update");
		model.addAttribute("page", page);
		model.addAttribute("dto", dto);
		
		return ".supplement.created";
	}
	
	//수정완료
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSubmit(
			Supplement dto,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"supplement";
		
		try {
			service.updateSupplement(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/supplement/article?num="+dto.getNum()+"&page="+page;
	}

	//삭제
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String deleteSupplement(
			@RequestParam int num,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			@RequestParam String page,
			HttpSession session
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword=URLDecoder.decode(keyword, "utf-8");
		String query="page="+page;
		if(keyword.length()!=0) {
			query+="condition="+condition+"&keyword="+URLEncoder.encode(keyword, "utf-8");
		}
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"supplement";
			
		service.deleteSupplement(num, pathname, info.getUserId()); // 이 아이디 로그인한 아이디

		return "redirect:/supplement/list?"+query;
	}
	

	
}
