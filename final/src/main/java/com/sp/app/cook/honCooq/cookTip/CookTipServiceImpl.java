package com.sp.app.cook.honCooq.cookTip;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.app.common.FileManager;
import com.sp.app.common.MyUtil;
import com.sp.app.common.dao.CommonDAO;

@Service("honCooq.cookTipService")
public class CookTipServiceImpl implements CookTipService{
	@Autowired
	private CommonDAO dao;

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertCookTip(CookTip dto, String pathname) throws Exception {
		try {
			dao.insertData("cookTip.insertCookTip", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	@Override
	public List<CookTip> listCookTip(Map<String, Object> map) {
		List<CookTip> list = null;
		try {
			list = dao.selectList("cookTip.listCookTip", map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = dao.selectOne("cookTip.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public CookTip readCookTip(int num) {
		CookTip dto = null;
		try {
			dto = dao.selectOne("cookTip.readCookTip", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("cookTip.updateHitCount", num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public CookTip preReadCookTip(Map<String, Object> map) {
		CookTip dto = null;
		try {
			dto = dao.selectOne("cookTip.preReadCookTip", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public CookTip nextReadCookTip(Map<String, Object> map) {
		CookTip dto = null;
		try {
			dto = dao.selectOne("cookTip.nextReadCookTip", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateCookTip(CookTip dto) throws Exception {
		try {
			dao.updateData("cookTip.updateCookTip", dto);			
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void deleteCookTip(int num, String userId) throws Exception {
		try {
			CookTip dto = readCookTip(num);
			if (dto==null || (! userId.equals("admin") && ! dto.getUserId().equals(userId))) {
				return;
			}
			// 스마트에디터 사용해 저장한 이미지 삭제하기 
			List<String> images;
			images = myUtil.getImgSrc(dto.getContent());
			if (images.size() != 0) {
				for (String image : images) {
					fileManager.doFileDelete(image);
				}
			}

			dao.deleteData("cookTip.deleteCookTip", dto);			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertCookTipLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("cookTip.insertCookTipLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int cookTipLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("cookTip.cookTipLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int readCookTipLike(Map<String, Object> map) throws Exception{
		int result=0;
		try {
			result=dao.selectOne("cookTip.readCookTipLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public void deleteCookTipLike(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("cookTip.deleteCookTipLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}		
	
	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("cookTip.insertCookTipReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("cookTip.listCookTipReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("cookTip.cookTipReplyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("cookTip.deleteCookTipReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list=null;
		try {
			list=dao.selectList("cookTip.listCookTipReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("cookTip.cookTipReplyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception{
		try {
			dao.insertData("cookTip.insertCookTipReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap=null;
		try {
			countMap=dao.selectOne("cookTip.cookTipReplyLikeCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}
	
	
}
