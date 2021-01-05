package com.sp.app.cook.honCooq.recipe;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

// 레시피(요리 정보)
@Controller("recipe.recipeController")
@RequestMapping("cook/honCooq/recipe/*")
public class RecipeController {
	@Autowired
	private RecipeService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model
			) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int rows = 12;	// 한 화면에 보여주는 게시물 수
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userId", info.getUserId());
		
		dataCount = service.dataCount(map);
		if (dataCount!=0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트에 출력할 데이터를 가져오기
		int offset = (current_page-1) * rows;
		if (offset<0) offset=0;
		map.put("offset", offset);
		map.put("rows", rows);
		
		// 글 리스트
		List<Recipe> list = service.listRecipe(map);
		
		
		String cp = req.getContextPath();
		String query = "";
//		String listUrl = cp+"/cook/honCooq/recipe/list";
		String articleUrl = cp+"/cook/honCooq/recipe/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition="+condition + "&keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length()!=0) {
//			listUrl = cp+"/cook/honCooq/recipe/list?"+query;
			articleUrl = cp+"/cook/honCooq/recipe/article?page=" + current_page +"&"+ query;
		}
		
        // ajax 페이징처리
        String paging = myUtil.pagingMethod2(current_page, total_page, "listPage");
        // String paging = myUtil.paging2(current_page, total_page);
				
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);		
		
		return "/cook/honCooq/recipe/list";
	}
	
	@RequestMapping(value = "article")
	public String article(
			@RequestParam int num,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpSession session,
			Model model) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}		
		
		// 해당 레코드(글 정보) 가져오기
		Recipe dto = service.readRecipe(num);
		if(dto==null) {
			return "redirect:/cook/honCooq/main?"+query;
		}
		
		// 스마트 에디터인 경우 주석 처리
//      dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
         
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("num", num);

//		Recipe preReadDto = service.preReadRecipe(map);
//		Recipe nextReadDto = service.nextReadRecipe(map);
				
		model.addAttribute("dto", dto);
//		model.addAttribute("preReadDto", preReadDto);
//		model.addAttribute("nextReadDto", nextReadDto);
		
		// 좋아요 여부 가져오기
		SessionInfo info=(SessionInfo)session.getAttribute("member");		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		int readcookTipLike=0;
		
		try {
			readcookTipLike = service.readRecipeLike(paramMap);					
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("userLike", readcookTipLike);		
		model.addAttribute("page", page);
		model.addAttribute("query", query);		
		
		return ".cook.honCooq.recipe.article";
	}	
	
}
