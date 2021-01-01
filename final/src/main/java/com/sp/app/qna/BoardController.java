package com.sp.app.qna;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;
import com.sp.app.member.SessionInfo;


//질문과 답변
@Controller("qna.boardController")
@RequestMapping(value="/qna/*")
public class BoardController {
	@Autowired
	private BoardService service;

	@Autowired
	private MyUtil myUtil;

	// @RequestMapping(value="{group}/list")
	@RequestMapping(value="qnalist")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model	) throws Exception {
		
		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Board> list = service.listBoard(map);

		// 글번호 만들기
		int listNum, n = 0;
		for(Board dto:list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}
		String cp = req.getContextPath();
		String listUrl = cp+"/qna/qnalist";
		
        String paging = myUtil.paging(current_page, total_page,listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		return ".qna.qnalist";
	}

	@RequestMapping(value="created", method=RequestMethod.GET)
	public String createdForm(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {

		List<Board> listCategory = service.listCategory();
		
		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Board> list = service.listBoard(map);

		// 글번호 만들기
		int listNum, n = 0;
		for(Board dto:list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);
			n++;
		}

        // ajax 페이징처리
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);		
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "created");
		return ".qna.created";
	}

	@RequestMapping(value="created", method=RequestMethod.POST)
	public String createdSubmit(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Board dto,
			HttpSession session,
			Model model
			) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		dto.setUserId(info.getUserId());
		service.insertBoard(dto);
		
		try {
		
		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;

		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
        map.put("offset", offset);
        map.put("rows", rows);

		List<Board> list = service.listBoard(map);

		// 글번호 만들기
		int listNum, n = 0;
		for(Board dto1:list) {
			listNum = dataCount - (offset + n);
			dto1.setListNum(listNum);
			n++;
		}

        // ajax 페이징처리
        String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		
		
		
		
		} catch (Exception e) {
			state="false";
		}
		model.addAttribute("dto", dto);
		model.addAttribute("state", state);
		return ".qna.qnalist";
	}

	@RequestMapping(value = "article", method = RequestMethod.GET)
	public String article(
			@RequestParam int num,
			@RequestParam(defaultValue="1") String pageNo,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletResponse resp,
			HttpSession session,
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		Board questionDto = service.readQuestion(num);
		if(questionDto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		if(questionDto.getQuestionPrivate()==1 &&
				 (! info.getUserId().equals("admin") && ! info.getUserId().equals(questionDto.getUserId()))) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		questionDto.setContent(questionDto.getContent().replaceAll("\n", "<br>"));
		
		Board answerDto = service.readAnswer(questionDto.getNum());
		if(answerDto!=null) {
			answerDto.setContent(answerDto.getContent().replaceAll("\n", "<br>"));
		}
		
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", questionDto.getNum());
		map.put("condition", condition);
		map.put("keyword", keyword);

		Board preReadDto = service.preReadQuestion(map);
		Board nextReadDto = service.nextReadQuestion(map);
		
		model.addAttribute("mode","update");
		model.addAttribute("questionDto", questionDto);
		model.addAttribute("answerDto", answerDto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", pageNo);
		
		return ".qna.article";
	}

	@RequestMapping(value="update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam(defaultValue="1") String pageNo,
			HttpServletResponse resp,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto = service.readQuestion(num);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(! info.getUserId().equals(dto.getUserId())) {
			resp.sendError(402, "권한이 없습니다.");
			return null;
		}
		
		List<Board> listCategory = service.listCategory();
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("dto", dto);		
		model.addAttribute("listCategory", listCategory);

		return ".qna.created";
	}

	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updateSubmit(
			@RequestParam int parent,
			Board dto,
			HttpSession session,
			Model model
			) throws Exception {

		String state="true";		

		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.updateBoard(dto);
		} catch (Exception e) {
			state="false";
		}

		model.addAttribute("state", state);
		return "redirect:/qna/article?num="+parent;
	}

	@RequestMapping(value="answer", method=RequestMethod.GET)
	public String answerForm(
			@RequestParam int num,
			HttpServletResponse resp,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto = service.readQuestion(num);
		if(dto==null) {
			resp.sendError(410, "삭제된 게시물입니다.");
			return null;
		}
		
		if(! info.getUserId().equals("admin")) {
			resp.sendError(402, "권한이 없습다.");
			return null;
		}
		
		dto.setContent("["+dto.getSubject()+"] 에 대한 답변입니다.\n");
		
		List<Board> listCategory = service.listCategory();
		
		model.addAttribute("mode", "answer");
		model.addAttribute("dto", dto);		
		model.addAttribute("listCategory", listCategory);		

		return ".qna.created";
	}

	@RequestMapping(value="answer", method=RequestMethod.POST)
	public String answerSubmit(
			@RequestParam int parent,
			Board dto,
			HttpSession session) throws Exception {

		try {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.insertBoard(dto);
		} catch (Exception e) {
		}

		return "redirect:/qna/article?num="+parent;
	}
	
	@RequestMapping(value="delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String mode,
			Model model,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="false";
		
		Board dto = service.readQuestion(num);
		if(dto!=null) {
			if(info.getUserId().equals(dto.getUserId())||info.getUserId().equals("admin")) {
				try {
					if(mode.equals("question")) {
						service.deleteQuestion(num);
					} else if(mode.equals("answer")) {
						service.deleteAnswer(num);
					}
					state="true";
				} catch (Exception e) {
				}
			}
		}
		
		model.addAttribute("state", state);
		return "redirect:/qna/qnalist";
	}
}
