package com.sp.app.cook.honCooq.recipe;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sp.app.common.MyUtil;

// 레시피(요리 정보)
@Controller("recipe.recipeController")
@RequestMapping("cook/honCooq/recipe/*")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="main")
	public String recipeMain() {
		return "cook/honCooq/recipe/recipeMain";
	}
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,			
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		int rows = 12;	// 한 화면에 보여주는 게시물 수
		int total_page=0;
		int dataCount=0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
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
		
		List<Recipe> list = service.listRecipe(map);
		
		String cp = req.getContextPath();
		String query = "";
		String listUrl = cp+"/cook/honCooq/recipe/list";
		String articleUrl = cp+"/cook/honCooq/recipe/article?page=" + current_page;
		if (keyword.length() != 0) {
			query = "condition="+condition + "&keyword=" 
						+ URLEncoder.encode(keyword, "utf-8");
		}

		if (query.length()!=0) {
			listUrl = cp+"/cook/honCooq/recipe/list?"+query;
			articleUrl = cp+"/cook/honCooq/recipe/article?page=" + current_page +"&"+ query;
		}
		
		String paging = myUtil.paging2(current_page, total_page, listUrl);
				
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);		
		
		return ".cook.honCooq.recipe.list";
	}
	
	
	
}
