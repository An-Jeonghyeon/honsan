package com.sp.app.cook.honCooq.recipe;

import java.util.List;
import java.util.Map;

public interface RecipeService {
	public List<Recipe> listRecipe(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Recipe readRecipe(int num);
	//public Recipe readRecipeIngre(int num);
	//public Recipe readRecipeProcess(int num);
	
	public List<Recipe> listRecipeIngre(int num);
	public List<Recipe> listRecipeProcess(int num);
	
	public Recipe preReadRecipe(Map<String, Object> map);
	public Recipe nextReadRecipe(Map<String, Object> map);
	public void updateRecipe(Recipe dto) throws Exception;
	public void deleteRecipe(int num, String userId) throws Exception;
	
	public void insertRecipeLike(Map<String, Object> map) throws Exception;
	public int recipeLikeCount(int num);
	public int readRecipeLike(Map<String, Object> map) throws Exception;
	public void deleteRecipeLike(Map<String, Object> map) throws Exception;
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public void insertReplyLike(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}
