package com.sp.app.cook.honCooq.recipe;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.dao.CommonDAO;

@Service("honCooq.recipeService")
public class RecipeServiceImpl implements RecipeService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Recipe> listRecipe(Map<String, Object> map) {
		List<Recipe> list = null;
		try {
			list = dao.selectList("recipe.listRecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("recipe.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Recipe readRecipe(int num) {
		Recipe dto = null;
		try {
			dto = dao.selectOne("recipe.readRecipe", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Recipe readRecipeIngre(int num) {
		Recipe dto = null;
		try {
			dto = dao.selectOne("recipe.readRecipeIngre", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Recipe readRecipeProcess(int num) {
		Recipe dto = null;
		try {
			dto = dao.selectOne("recipe.readRecipeProcess", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public Recipe preReadRecipe(Map<String, Object> map) {
		Recipe dto = null;
		try {
			dto = dao.selectOne("recipe.preReadRecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Recipe nextReadRecipe(Map<String, Object> map) {
		Recipe dto = null;
		try {
			dto = dao.selectOne("recipe.nextReadRecipe", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateRecipe(Recipe dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteRecipe(int num, String userId) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertRecipeLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("recipe.insertRecipeLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int recipeLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("recipe.recipeLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int readRecipeLike(Map<String, Object> map) throws Exception {
		int result=0;
		try {
			result=dao.selectOne("recipe.readRecipeLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteRecipeLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("recipe.deleteRecipeLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("recipe.insertRecipeReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("recipe.listRecipeReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("recipe.recipeReplyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("recipe.deleteRecipeReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list=null;
		try {
			list=dao.selectList("recipe.listRecipeReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("recipe.recipeReplyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("recipe.insertRecipeReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap=null;
		try {
			countMap=dao.selectOne("recipe.recipeReplyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}
}
