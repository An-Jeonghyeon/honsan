package com.sp.app.cook.honCooq.recipe;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sp.app.common.APISerializer;

@Controller("recipe.recipeController")
@RequestMapping("cook/honCooq/recipe/*")
public class RecipeController {
	
	
	@Autowired
	private APISerializer apiSerializer;
	
	@RequestMapping(value="main")
	public String recipeMain() {
		return "cook/honCooq/recipe/recipeMain";
	}
	
	// AJAX-JSON으로 응답
	public String recipeList(HttpServletRequest req) throws Exception {
		String resultXML = null;
		
		String keyId = "181abc97b6634b1f842b";
		String spec = "";
		
		
		return resultXML;
	}
	
	
	
}
